package com.kh.zoody.attendance.controller;

import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.zoody.attendance.service.AttendanceService;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.ExtraWorkVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {
	
	private final AttendanceService attService;
	
	//(서브메뉴) 근무현황 메인 화면
	@GetMapping("main")
	public String workStatus(Integer page, Model model) {
		
		//근무 현황 그래프
		int allAttCnt = attService.getUserAttendanceCnt();
		model.addAttribute("allAttCnt",allAttCnt);
		
		//휴가,출결,초과근무 목록 조회
		int listCount = attService.getMainAttCnt();
		int leaveListCount = attService.getMainLeaveCnt();
		
		int currentPage = (page != null) ? page: 1;
		
		PageVo mPv = new PageVo(listCount, currentPage, 2, 3);
		List<AttendanceVo> mainAttList = attService.mainAttlist(mPv);
		List<LeaveVo> mainLeList = attService.mainLeList(mPv);
		List<ExtraWorkVo> mainWorkList = attService.mainWorkList(mPv);
		
		//부서별 목록 조회
		List<AttendanceVo> deList = attService.mainDeList();
		
		model.addAttribute("mainAttList", mainAttList);
		model.addAttribute("mainLeList", mainLeList);
		model.addAttribute("deList", deList);
		model.addAttribute("mainWorkList", mainWorkList);
		model.addAttribute("mPv", mPv);
		
		//FullCalendar 조회 
		List<AttendanceVo> calendarList = attService.mainCalendarList();
		
//		//FullCalendar 이벤트 형식으로 변환
//        List<FullCalendarEvent> events = new ArrayList<>();
//        for (AttendanceVo attendance : calendarList) {
//            // 출근 시간과 퇴근 시간을 FullCalendar에 출력할 형식으로 변환하여 저장
//            String title = "출근: " + attendance.getCheckInTime() + ", 퇴근: " + attendance.getCheckOutTime();
//            String start = attendance.getEnrolldate() + "T" + attendance.getCheckInTime();
//            String end = attendance.getEnrolldate() + "T" + attendance.getCheckOutTime();
//
//            events.add(new FullCalendarEvent(title, start, end));
//        }
        
        List<Map<String, String>> events = new ArrayList<>();
        for (AttendanceVo attendance : calendarList) {
            Map<String, String> event = new HashMap<>();
            event.put("title", "출근: " + attendance.getCheckInTime() + ", 퇴근: " + attendance.getCheckOutTime());
            event.put("start", attendance.getEnrolldate() + "T" + attendance.getCheckInTime());
            event.put("end", attendance.getEnrolldate() + "T" + attendance.getCheckOutTime());

            events.add(event);
        }
        
        //FullCalendar 이벤트 목록을 프론트엔드로 전달
        model.addAttribute("events", events);
        
		//데이터베이스에서 주간 근무 현황 데이터를 가져와서 배열로 변환
//		List<AttendanceVo> chartList = attService.mainChartList();
		
		//JSP에 데이터를 전달하기 위해 Model에 설정
//		model.addAttribute("enrolldateData", convertToEnrolldateArray(chartList));
//		model.addAttribute("totalWorkTimeData", convertToTotalWorkTimeArray(chartList));
		
		
		return "attendance/workStatus";
	}

	//이벤트 데이터를 담을 클래스 생성
	private static class FullCalendarEvent {
	    private final String title;
	    private final String start;
	    private final String end;
	
	    public FullCalendarEvent(String title, String start, String end) {
	        this.title = title;
	        this.start = start;
	        this.end = end;
	    }
	
	    public String getTitle() {
	        return title;
	    }
	
	    public String getStart() {
	        return start;
	    }
	
	    public String getEnd() {
	        return end;
	    }
	    
	    @Override
	    public String toString() {
	        return "FullCalendarEvent{" +
	                "title='" + title + '\'' +
	                ", start='" + start + '\'' +
	                ", end='" + end + '\'' +
	                '}';
	    }
	}

	
	// enrolldate 데이터를 JavaScript 배열로 변환하는 메서드
	private String convertToEnrolldateArray(List<AttendanceVo> chartList) {
		StringBuilder sb = new StringBuilder();
		for (AttendanceVo attendance : chartList) {
			sb.append("'").append(attendance.getEnrolldate()).append("',");
		}
		// 마지막 쉼표 제거
		sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}
	
	// totalWorkTime 데이터를 JavaScript 배열로 변환하는 메서드
	private String convertToTotalWorkTimeArray(List<AttendanceVo> chartList) {
		StringBuilder sb = new StringBuilder();
		for (AttendanceVo attendance : chartList) {
			sb.append("'").append(attendance.getTotalWorkTime()).append("',");
		}
		// 마지막 쉼표 제거
		sb.deleteCharAt(sb.length() - 1);
		return sb.toString();
	}
	
	//메인화면 출퇴근 등록
	@PostMapping("main")
	public ResponseEntity<String> workStatus(@RequestParam String loginMemberNo, @RequestParam String action) {
	    try {
	        AttendanceVo attendanceVo = new AttendanceVo();
	        attendanceVo.setLoginMemberNo(loginMemberNo);

	        if ("check-in".equals(action)) {
	            if (attService.hasCheckInRecordToday(attendanceVo)) {
	                return ResponseEntity.ok("already-checked-in");
	            } else {
	                attService.checkInWork(attendanceVo);
	                return ResponseEntity.ok("출근 완료");
	            }
	        } else if ("check-out".equals(action)) {
	            if (attService.hasCheckOutRecordToday(attendanceVo)) {
	                return ResponseEntity.ok("already-checked-out");
	            } else {
	                attService.checkOutWork(attendanceVo);
	                return ResponseEntity.ok("퇴근 완료");
	            }
	        } else {
	            return ResponseEntity.badRequest().body("올바르지 않은 요청");
	        }
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("오류 발생");
	    }
	}
	
	//메인화면 주간 차트
	
	
	//(서브메뉴) 근무현황 목록 조회
	@GetMapping("list")
	public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "1") int lp,@RequestParam(defaultValue = "1") int wp, Model model, String searchValue) {

	    int listCount = attService.getMyAttendanceCnt(searchValue);
	    int leaveListCount = attService.getLeaveCnt();
	    int workListCount = attService.getWorkCnt();
	    int currentPage = page;
//	    int pageLimit = 5;
//	    int boardLimit = 10;
	    
	    //내 출결 조회
	    PageVo pv = new PageVo(listCount, currentPage, 5, 10);
	    List<AttendanceVo> attVoList = attService.list(pv, searchValue);
	    model.addAttribute("attVoList", attVoList);
	    model.addAttribute("searchValue", searchValue);
	    
	    //휴가 요청 조회
	    PageVo leavePv = new PageVo(leaveListCount, lp, 2, 4);
	    List<LeaveVo> leVoList = attService.leaveList(leavePv);
	    model.addAttribute("leVoList", leVoList);
	    
	    //초과근무 요청 조회
	    PageVo workPv = new PageVo(workListCount, wp, 2, 4);
	    List<ExtraWorkVo> ewList = attService.extraWorkList(workPv);
	    model.addAttribute("ewList", ewList);
	    
	    //출근 타입 카운팅
	    int currentTypeOne = attService.getCurrentTypeOneCnt();
	    int currentTypeSix = attService.getCurrentTypeSixCnt();
	    int currentTypeLeave = attService.getCurrentTypeLeaveCnt();
	    int currentTypeFour = attService.getCurrentTypeFourCnt(); 
	    
	    model.addAttribute("currentTypeOne", currentTypeOne);
	    model.addAttribute("currentTypeSix", currentTypeSix);
	    model.addAttribute("currentTypeLeave", currentTypeLeave);
	    model.addAttribute("currentTypeFour", currentTypeFour);
	    model.addAttribute("pv", pv);
	    model.addAttribute("leavePv", leavePv);
	    model.addAttribute("workPv", workPv);

	    return "attendance/list";
	}
	
	@PostMapping("list")
	public String list(@RequestParam Map<String, String> params) {
		
//		try {
//			
//			String no = params.get("no");
//	        
//	        if (loginMemberNo == null || action == null) {
//	            return "redirect:/attendance/main"; // 또는 적절한 경로로 리다이렉트 처리
//	        }
//
//	        AttendanceVo attendanceVo = new AttendanceVo();
//	        attendanceVo.setLoginMemberNo(loginMemberNo);
//
//	        if ("check-in".equals(action)) {
//	            if (attService.hasCheckInRecordToday(attendanceVo)) {
//	                // 이미 출근 등록을 완료한 경우 처리
//	            } else {
//	                // 출근 완료 처리
//	                attService.checkInWork(attendanceVo);
//	            }
//	        } else if ("check-out".equals(action)) {
//	            if (attService.hasCheckOutRecordToday(attendanceVo)) {
//	                // 이미 퇴근 등록을 완료한 경우 처리
//	            } else {
//	                // 퇴근 완료 처리
//	                attService.checkOutWork(attendanceVo);
//	            }
//	        } else {
//	            return "redirect:/attendance/main"; // 또는 적절한 경로로 리다이렉트 처리
//	        }

	        int result = attService.submitOjection(params);

	        return "attendance/list";
//	    } catch (Exception e) {
//	        // 오류 발생 시 적절한 에러 처리
//	        return "redirect:/attendance/main"; // 또는 적절한 경로로 리다이렉트 처리
//	    }
	}
	
	//(관리자권한) 유저 전체 근무 조회
	@GetMapping("admin/allList")
	public String objection(Integer page, Model model, @RequestParam Map<String, String> paramMap) {
		
		int listCount = attService.getAllAttendanceCnt(paramMap);
		int currentPage = (page != null) ? page: 1;
		
		PageVo allPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> attAllVoList = attService.allList(allPv, paramMap);
		
		model.addAttribute("attAllVoList", attAllVoList);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("allPv", allPv);
		
		//이의신청 건수 카운팅
		int objectionCnt = getObjectionCnt();
		model.addAttribute("objectionCnt", objectionCnt);
		
		return "attendance/allList";
	}
	
	@GetMapping("admin/objection")
	public String adminObjection(Integer page, Model model, @RequestParam Map<String, String> paramMap){
		
		int listCount = attService.getObjCnt(paramMap);
		int currentPage = (page != null) ? page: 1;
		
		PageVo objPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> objVoList = attService.objList(objPv, paramMap);
		
		model.addAttribute("objVoList", objVoList);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("objPv", objPv);
		
		int objectionCnt = getObjectionCnt();
		model.addAttribute("objectionCnt", objectionCnt);
		
		return "attendance/adminObjection";
	}
	
	//이의신청 건수 카운팅
	public int getObjectionCnt() {
	    return attService.getObjectionCnt();
	}
	
	@PostMapping("admin/objection")
	public String adminObjection(@RequestParam Map<String, String> objParams) {
		
		int updateStatus = attService.updateStatus(objParams);
		
		return "attendance/adminObjection";
	}

}

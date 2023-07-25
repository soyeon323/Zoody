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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.zoody.attendance.service.AttendanceService;
import com.kh.zoody.attendance.vo.AttendanceVo;
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
		
		
		
		//휴가,출결,초과근무 목록 조회
		int listCount = attService.getMainAttCnt();
		int leaveListCount = attService.getMainLeaveCnt();
		
		int currentPage = (page != null) ? page: 1;
		
		PageVo mPv = new PageVo(listCount, currentPage, 2, 3);
		List<AttendanceVo> mainAttList = attService.mainAttlist(mPv);
		List<LeaveVo> mainLeList = attService.mainLeList(mPv);
		
		//부서별 목록 조회
		List<AttendanceVo> deList = attService.mainDeList();
		
		model.addAttribute("mainAttList", mainAttList);
		model.addAttribute("mainLeList", mainLeList);
		model.addAttribute("deList", deList);
		
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
        
        log.info("mainCalendarList 호출됨. 결과: {}", events);
		
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
	public String workStatus(@RequestParam String loginMemberNo, @RequestParam String action) throws Exception {

	    AttendanceVo attendanceVo = new AttendanceVo();
	    attendanceVo.setLoginMemberNo(loginMemberNo);

	    //클라이언트에서 전달된 action 값에 따라 출근 또는 퇴근 작업 수행
	    if ("check-in".equals(action)) {
	        int checkInresult = attService.checkInWork(attendanceVo);
	    } else if ("check-out".equals(action)) {
	        int checkOutresult = attService.checkOutWork(attendanceVo);
	    }

	    return "attendance/workStatus";
	}
	
	//메인화면 주간 차트
	
	
	//(서브메뉴) 근무현황 목록 조회
	@GetMapping("list")
	public String list(Integer page, Model model) {

	    int listCount = attService.getMyAttendanceCnt();
	    int leaveListCount = attService.getLeaveCnt();
	    int currentPage = (page != null) ? page: 1;
//	    int pageLimit = 5;
//	    int boardLimit = 10;

	    //내 출결 조회
	    PageVo pv = new PageVo(listCount, currentPage, 5, 10);
	    List<AttendanceVo> attVoList = attService.list(pv);
	    model.addAttribute("attVoList", attVoList);
	    
	    //휴가 요청 조회
	    PageVo leavePv = new PageVo(leaveListCount, currentPage, 2, 4);
	    List<LeaveVo> leVoList = attService.leaveList(leavePv);
	    model.addAttribute("leVoList", leVoList);

	    return "attendance/list";
	}
	
	//(관리자권한) 유저 전체 근무 조회
	@GetMapping("allList")
	public String objection(Integer page, Model model) {
		
		int listCount = attService.getAllAttendanceCnt();
		int currentPage = (page != null) ? page: 1;
		
		PageVo allPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> attAllVoList = attService.allList(allPv);
		
		model.addAttribute("attAllVoList", attAllVoList);
		
		return "attendance/allList";
	}
	
	@GetMapping("admin/objection")
	public String adminObjection(Integer page, Model model){
		
		int listCount = attService.getObjCnt();
		int currentPage = (page != null) ? page: 1;
		
		PageVo objPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> objVoList = attService.objList(objPv);
		
		model.addAttribute("objVoList", objVoList);
		
		return "attendance/adminObjection";
	}

}

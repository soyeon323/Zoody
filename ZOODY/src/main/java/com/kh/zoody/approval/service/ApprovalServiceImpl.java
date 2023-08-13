package com.kh.zoody.approval.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.approval.dao.ApprovalDao;
import com.kh.zoody.approval.vo.ApplicationForExtraWorkVo;
import com.kh.zoody.approval.vo.ApplicationForLeaveVo;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.ApproverVo;
import com.kh.zoody.approval.vo.DrafterVo;
import com.kh.zoody.approval.vo.ExtraWorkCategoryVo;
import com.kh.zoody.approval.vo.ExtraWorkVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;
import com.kh.zoody.approval.vo.LeaveVo;
import com.kh.zoody.approval.vo.LetterOfApprovalVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class ApprovalServiceImpl implements ApprovalService {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	private final ApprovalDao approvalDao;

	// 결재문서 양식 가져오기
	@Override
	public String getDocumentForm(String category) {
		return approvalDao.getDocumentForm(category, sqlSessionTemplate);
	}

	
	// 품의서 작성
	@Override
	public int writeLOA(ApprovalVo approvalVo, List<String> approver, List<String> cc, String content) {
		return approvalDao.writeLOA(approvalVo, approver, cc, content, sqlSessionTemplate);
	}

	
	// 휴가 타입 가져오기
	@Override
	public List<LeaveTypeVo> getLeaveType() {
		return approvalDao.getLeaveType(sqlSessionTemplate);
	}

	// 휴가 신청서 작성
	@Override
	public int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeaveVo afl) {
		return approvalDao.writeAFL(approvalVo, approver, cc, afl, sqlSessionTemplate);
	}

	
	// 추가 근무 유형 가지요기
	@Override
	public List<ExtraWorkCategoryVo> getWorkType() {
		return approvalDao.getWorkType(sqlSessionTemplate);
	}

	// 휴일/연장 근무 신청서 작성
	@Override
	public int writeAFE(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForExtraWorkVo afe) {
		return approvalDao.writeAFE(approvalVo, approver, cc, afe, sqlSessionTemplate);
	}


	// 유저가 결재해야하는 문서목록
	@Override
	public List<ApprovalVo> getApprovalList(String userNo) {
		
		List<ApprovalVo> approvalVoList = approvalDao.getApprovalList(userNo, sqlSessionTemplate);
		
		for(int i = 0; i < approvalVoList.size(); i++) {
			String approvalNo = approvalVoList.get(i).getNo();
			
			String authority = approvalDao.getAuthority(approvalNo, sqlSessionTemplate);
			
			String approverCnt = approvalDao.getApproverCnt(approvalNo, sqlSessionTemplate);
			
			List<ApproverVo> approverList = approvalDao.getApproverState(approvalNo, sqlSessionTemplate);
			
			
			String result = "";
			int cnt = 0;
			for(int j = 0; j < approverList.size(); j++) {
				
				if( "2".equals(approverList.get(j).getApprovalState()) ) {
					result = "반려";
					break;
				} else if( "1".equals(approverList.get(j).getApprovalState()) && Integer.parseInt(approverList.get(j).getGrade()) <= Integer.parseInt(authority) ){
					result = "전결";
					break;
				} else if(cnt == Integer.parseInt(approverCnt)) {
					result = "결재완료";
				} else if( "1".equals(approverList.get(j).getApprovalState()) ) {
					cnt++;
					result = "진행중";
				} else if( "0".equals(approverList.get(j).getApprovalState()) ) {
					result = "진행중";
				}
			}
			
			approvalVoList.get(i).setResult(result);
		}
		return approvalVoList;
	}


	// 전자결재 상세 보기
	@Override
	public ApprovalVo getApprovalDetail(String no) {
		return approvalDao.getApprovalDetail(no, sqlSessionTemplate);
	}


	// 상세보기 상신인 정보 가져오기
	@Override
	public DrafterVo getDrafterInfo(String no) {
		return approvalDao.getDrafterInfo(no, sqlSessionTemplate);
	}

	// 문서번호로 카테고리 번호 얻기
	@Override
	public String getCategory(String no) {
		return approvalDao.getCategory(no, sqlSessionTemplate);
	}

	// 품의서 내용 가져오기
	@Override
	public LetterOfApprovalVo getLoaInfo(String no) {
		return approvalDao.getLoaInfo(no, sqlSessionTemplate);
	}

	// 결재자들 불러오기
	@Override
	public List<ApproverVo> getApprovers(String no) {
		return approvalDao.getApprovers(no, sqlSessionTemplate);
	}

	// 참조인들 불러오기
	@Override
	public List<ApproverVo> getCc(String no) {
		return approvalDao.getCc(no, sqlSessionTemplate);
	}

	// 결재
	@Override
	public Map<String, String> deciseApproval(Map<String, String> dataMap) {

		String decision = dataMap.get("decision");
		
		String decisionNo = "";
		if("approve".equals(decision)) {
			decisionNo = "1";
		} else if("disapprove".equals(decision)) {
			decisionNo = "2";
		}
		dataMap.put("decisionNo", decisionNo);
		
		int result = approvalDao.deciseApproval(dataMap, sqlSessionTemplate);
		
		String approvalResult = "";
		
		if(result == 1) {
			
			String approvalNo = dataMap.get("no");
			
			String authority = approvalDao.getAuthority(approvalNo, sqlSessionTemplate);
			
			String approverCnt = approvalDao.getApproverCnt(approvalNo, sqlSessionTemplate);
			
			List<ApproverVo> approverList = approvalDao.getApproverState(approvalNo, sqlSessionTemplate);
			
			int cnt = 0;
			for(int j = 0; j < approverList.size(); j++) {
				
				if( "2".equals(approverList.get(j).getApprovalState()) ) {
					//"반려";
					approvalResult = "반려";
					break;
				} else if( "1".equals(approverList.get(j).getApprovalState()) && Integer.parseInt(approverList.get(j).getGrade()) <= Integer.parseInt(authority) ){
					//"전결";
					approvalResult = "전결";
					
					String category = approvalDao.getCategory(approvalNo, sqlSessionTemplate);
					
					if("2".equals(category)) {
						
						ApplicationForLeaveVo data = approvalDao.getAflInfo(approvalNo, sqlSessionTemplate);
						
						LeaveVo leaveVo = new LeaveVo();
						leaveVo.setUserNo(dataMap.get("userNo"));
						leaveVo.setLeaveNo(data.getTypeNo());
						leaveVo.setProxyNo(dataMap.get("userNo") + 1);
						leaveVo.setReasonContent(data.getReason());
						String startDate = data.getFrom().substring(0,4) + '/' + data.getFrom().substring(4,6) + '/' + data.getFrom().substring(6,8);
						leaveVo.setStartTime(startDate);
						String endDate = data.getTo().substring(0,4) + '/' + data.getTo().substring(4,6) + '/' + data.getTo().substring(6,8);
						leaveVo.setEndTime(endDate);
						
						result = approvalDao.insertLeave(leaveVo, sqlSessionTemplate);
						
					} else if("3".equals(category)) {
						
						ApplicationForExtraWorkVo data = approvalDao.getAfeInfo(approvalNo, sqlSessionTemplate);
						
						ExtraWorkVo extraWorkVo = new ExtraWorkVo();
						extraWorkVo.setUserNo(dataMap.get("userNo"));
						extraWorkVo.setTypeNo(data.getTypeNo());
						extraWorkVo.setStartTime(data.getStartTime());
						extraWorkVo.setEndTime(data.getEndTime());
						extraWorkVo.setReason(data.getReason());
						
						result = approvalDao.inserExtraWork(extraWorkVo, sqlSessionTemplate);
					}
					
					break;
				} else if(cnt == Integer.parseInt(approverCnt)) {
					//"결재완료";
					approvalResult = "결재 완료";
					
					String category = approvalDao.getCategory(approvalNo, sqlSessionTemplate);
					
					if("2".equals(category)) {
						
						ApplicationForLeaveVo data = approvalDao.getAflInfo(approvalNo, sqlSessionTemplate);
						
						LeaveVo leaveVo = new LeaveVo();
						leaveVo.setUserNo(dataMap.get("userNo"));
						leaveVo.setLeaveNo(data.getTypeNo());
						leaveVo.setProxyNo(dataMap.get("userNo") + 1);
						leaveVo.setReasonContent(data.getReason());
						String startDate = data.getFrom().substring(0,4) + '/' + data.getFrom().substring(4,6) + '/' + data.getFrom().substring(6,8);
						leaveVo.setStartTime(startDate);
						String endDate = data.getTo().substring(0,4) + '/' + data.getTo().substring(4,6) + '/' + data.getTo().substring(6,8);
						leaveVo.setEndTime(endDate);
						
						result = approvalDao.insertLeave(leaveVo, sqlSessionTemplate);
						
					} else if("3".equals(category)) {
						
						ApplicationForExtraWorkVo data = approvalDao.getAfeInfo(approvalNo, sqlSessionTemplate);
						
						ExtraWorkVo extraWorkVo = new ExtraWorkVo();
						extraWorkVo.setUserNo(dataMap.get("userNo"));
						extraWorkVo.setTypeNo(data.getTypeNo());
						extraWorkVo.setStartTime(data.getStartTime());
						extraWorkVo.setEndTime(data.getEndTime());
						extraWorkVo.setReason(data.getReason());
						
						result = approvalDao.inserExtraWork(extraWorkVo, sqlSessionTemplate);
					}
				}
			}
		}
		
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("result", Integer.toString(result));
		resultMap.put("approvalResult", approvalResult);
		
		return resultMap;
	}


	@Override
	public String getCat1Ctn(String userNo) {
		return approvalDao.getCat1Ctn(userNo, sqlSessionTemplate);
	}

	@Override
	public String getCat2Ctn(String userNo) {
		return approvalDao.getCat2Ctn(userNo, sqlSessionTemplate);
	}

	@Override
	public String getCat3Ctn(String userNo) {
		return approvalDao.getCat3Ctn(userNo, sqlSessionTemplate);
	}

	@Override
	public String getCat4Ctn(String userNo) {
		return approvalDao.getCat4Ctn(userNo, sqlSessionTemplate);
	}


	@Override
	public List<ApprovalVo> getStandbyList(String userNo) {
		
		List<ApprovalVo> approvalVoList = approvalDao.getStandbyList(userNo, sqlSessionTemplate);
		
		for(int i = 0; i < approvalVoList.size(); i++) {
			String approvalNo = approvalVoList.get(i).getNo();
			
			String authority = approvalDao.getAuthority(approvalNo, sqlSessionTemplate);
			
			String approverCnt = approvalDao.getApproverCnt(approvalNo, sqlSessionTemplate);
			
			List<ApproverVo> approverList = approvalDao.getApproverState(approvalNo, sqlSessionTemplate);
			
			
			String result = "";
			int cnt = 0;
			for(int j = 0; j < approverList.size(); j++) {
				
				if( "2".equals(approverList.get(j).getApprovalState()) ) {
					result = "반려";
					break;
				} else if( "1".equals(approverList.get(j).getApprovalState()) && Integer.parseInt(approverList.get(j).getGrade()) <= Integer.parseInt(authority) ){
					result = "전결";
					break;
				} else if(cnt == Integer.parseInt(approverCnt)) {
					result = "결재완료";
				} else if( "1".equals(approverList.get(j).getApprovalState()) ) {
					cnt++;
					result = "진행중";
				} else if( "0".equals(approverList.get(j).getApprovalState()) ) {
					result = "진행중";
				}
			}
			
			approvalVoList.get(i).setResult(result);
		}
		return approvalVoList;
		
	}


	@Override
	public List<ApprovalVo> getCCList(String userNo) {
		List<ApprovalVo> approvalVoList = approvalDao.getCCList(userNo, sqlSessionTemplate);
		
		for(int i = 0; i < approvalVoList.size(); i++) {
			String approvalNo = approvalVoList.get(i).getNo();
			
			String authority = approvalDao.getAuthority(approvalNo, sqlSessionTemplate);
			
			String approverCnt = approvalDao.getApproverCnt(approvalNo, sqlSessionTemplate);
			
			List<ApproverVo> approverList = approvalDao.getApproverState(approvalNo, sqlSessionTemplate);
			
			
			String result = "";
			int cnt = 0;
			for(int j = 0; j < approverList.size(); j++) {
				
				if( "2".equals(approverList.get(j).getApprovalState()) ) {
					result = "반려";
					break;
				} else if( "1".equals(approverList.get(j).getApprovalState()) && Integer.parseInt(approverList.get(j).getGrade()) <= Integer.parseInt(authority) ){
					result = "전결";
					break;
				} else if(cnt == Integer.parseInt(approverCnt)) {
					result = "결재완료";
				} else if( "1".equals(approverList.get(j).getApprovalState()) ) {
					cnt++;
					result = "진행중";
				} else if( "0".equals(approverList.get(j).getApprovalState()) ) {
					result = "진행중";
				}
			}
			
			approvalVoList.get(i).setResult(result);
		}
		return approvalVoList;
	}


	@Override
	public List<ApprovalVo> getUpvoteList(String userNo) {
		List<ApprovalVo> approvalVoList = approvalDao.getUpvoteList(userNo, sqlSessionTemplate);
		
		for(int i = 0; i < approvalVoList.size(); i++) {
			String approvalNo = approvalVoList.get(i).getNo();
			
			String authority = approvalDao.getAuthority(approvalNo, sqlSessionTemplate);
			
			String approverCnt = approvalDao.getApproverCnt(approvalNo, sqlSessionTemplate);
			
			List<ApproverVo> approverList = approvalDao.getApproverState(approvalNo, sqlSessionTemplate);
			
			
			String result = "";
			int cnt = 0;
			for(int j = 0; j < approverList.size(); j++) {
				
				if( "2".equals(approverList.get(j).getApprovalState()) ) {
					result = "반려";
					break;
				} else if( "1".equals(approverList.get(j).getApprovalState()) && Integer.parseInt(approverList.get(j).getGrade()) <= Integer.parseInt(authority) ){
					result = "전결";
					break;
				} else if(cnt == Integer.parseInt(approverCnt)) {
					result = "결재완료";
				} else if( "1".equals(approverList.get(j).getApprovalState()) ) {
					cnt++;
					result = "진행중";
				} else if( "0".equals(approverList.get(j).getApprovalState()) ) {
					result = "진행중";
				}
			}
			
			approvalVoList.get(i).setResult(result);
		}
		return approvalVoList;
	}


	@Override
	public ApplicationForLeaveVo getAflInfo(String no) {
		return approvalDao.getAflInfo(no, sqlSessionTemplate);
	}

	@Override
	public ApplicationForExtraWorkVo getAfEDetail(String no) {
		return approvalDao.getAfeInfo(no, sqlSessionTemplate);
	}
	
}

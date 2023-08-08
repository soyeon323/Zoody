package com.kh.zoody.approval.service;

import java.util.List;

import com.kh.zoody.approval.vo.ApplicationForExtraWorkVo;
import com.kh.zoody.approval.vo.ApplicationForLeaveVo;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.DrafterVo;
import com.kh.zoody.approval.vo.ExtraWorkCategoryVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;
import com.kh.zoody.user.vo.UserVo;

public interface ApprovalService {

	// 문서 양식 가져오기
	String getDocumentForm(String category);

	// 품의서 작성
	int writeLOA(ApprovalVo approvalVo, List<String> approver, List<String> cc, String content);

	// 휴가 타입 가져오기
	List<LeaveTypeVo> getLeaveType();

	// 휴가 신청서 작성
	int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeaveVo afl);

	// 추가 근무 유형 가지요기
	List<ExtraWorkCategoryVo> getWorkType();

	// 휴일/연장 근무 신청서 작성
	int writeAFE(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForExtraWorkVo afe);

	// 유저가 결재해야하는 문서목록
	List<ApprovalVo> getApprovalList(String userNo);

	// 전자결재 상세 보기
	ApprovalVo getApprovalDetail(String no);

	// 상세보기 상신이 정보 가져오기
	DrafterVo getDrafterInfo(String no);

}

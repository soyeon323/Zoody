package com.kh.zoody.approval.service;

import java.util.List;

import com.kh.zoody.approval.vo.ApplicationForLeave;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;

public interface ApprovalService {

	// 문서 양식 가져오기
	String getDocumentForm(String category);

	// 품의서 작성
	int writeLOA(ApprovalVo approvalVo, List<String> approver, List<String> cc, String content);

	// 휴가 타입 가져오기
	List<LeaveTypeVo> getLeaveType();

	// 휴가 신청서 작성
	int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeave afl);

}

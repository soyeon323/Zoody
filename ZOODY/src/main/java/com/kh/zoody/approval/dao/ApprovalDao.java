package com.kh.zoody.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.approval.vo.ApplicationForLeave;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;

public interface ApprovalDao {

	// 결재문서 양식 가져오기
	String getDocumentForm(String category, SqlSessionTemplate sqlSessionTemplate);

	// 품의서 작성
	int writeLOA(ApprovalVo approvalVo, List<String> approver, List<String> cc, String content,
			SqlSessionTemplate sqlSessionTemplate);

	// 휴가 타입 가져오기
	List<LeaveTypeVo> getLeaveType(SqlSessionTemplate sqlSessionTemplate);

	// 휴가 신청서 작성
	int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeave afl,
			SqlSessionTemplate sqlSessionTemplate);

}

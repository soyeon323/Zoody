package com.kh.zoody.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.approval.dao.ApprovalDao;
import com.kh.zoody.approval.vo.ApplicationForLeave;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
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
	public int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeave afl) {
		return approvalDao.writeAFL(approvalVo, approver, cc, afl, sqlSessionTemplate);
	}

}

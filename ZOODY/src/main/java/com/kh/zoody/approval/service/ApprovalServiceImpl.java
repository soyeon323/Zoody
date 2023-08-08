package com.kh.zoody.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.approval.dao.ApprovalDao;
import com.kh.zoody.approval.vo.ApplicationForExtraWorkVo;
import com.kh.zoody.approval.vo.ApplicationForLeaveVo;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.DrafterVo;
import com.kh.zoody.approval.vo.ExtraWorkCategoryVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;
import com.kh.zoody.user.vo.UserVo;

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
		return approvalDao.getApprovalList(userNo, sqlSessionTemplate);
	}


	// 전자결재 상세 보기
	@Override
	public ApprovalVo getApprovalDetail(String no) {
		return approvalDao.getApprovalDetail(no, sqlSessionTemplate);
	}


	// 상세보기 상신이 정보 가져오기
	@Override
	public DrafterVo getDrafterInfo(String no) {
		return approvalDao.getDrafterInfo(no, sqlSessionTemplate);
	}

}

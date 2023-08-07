package com.kh.zoody.approval.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.approval.vo.ApplicationForLeave;
import com.kh.zoody.approval.vo.ApprovalCCVo;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.ApproverVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;
import com.kh.zoody.approval.vo.LetterOfApprovalFormVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ApprovalDaoImpl implements ApprovalDao {

	@Override
	public String getDocumentForm(String category, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("approval.getDocumentForm", category);
	}

	// 품의서 작성
	@Override
	public int writeLOA(ApprovalVo approvalVo, List<String> approver, List<String> cc, String content,
			SqlSessionTemplate sqlSessionTemplate) {
		
		int result = sqlSessionTemplate.insert("approval.insertApproval", approvalVo);
		
		
		List<ApproverVo> approverList = new ArrayList<>();
		for(int i = 0; i < approver.size(); i++) {
			
			ApproverVo approverVo = new ApproverVo();
			approverVo.setApprovalNo(approvalVo.getNo());
			approverVo.setApproverNo(approver.get(i));
			if(i + 1 < approver.size()) {
				approverVo.setNextApprovaerNo(approver.get(i+1));
			}
			
			approverList.add(approverVo);
			
		}
		result *= sqlSessionTemplate.insert("approval.insertApprover", approverList);
		
		if(cc != null) {
			List<ApprovalCCVo> CcList = new ArrayList<>();
			for(int i = 0; i < cc.size(); i++) {
				ApprovalCCVo ccVo = new ApprovalCCVo();
				ccVo.setNo(approvalVo.getNo());
				ccVo.setCcNo(cc.get(i));
				
				CcList.add(ccVo);
			}
			result *= sqlSessionTemplate.insert("approval.insertCC", CcList);
		}
		
		LetterOfApprovalFormVo loa = new LetterOfApprovalFormVo();
		loa.setApprovalNo(approvalVo.getNo());
		loa.setContent(content);
		result *= sqlSessionTemplate.insert("approval.insertLOA", loa);
		
		return result;
	}

	
	// 휴가 타입 가져오기
	@Override
	public List<LeaveTypeVo> getLeaveType(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("approval.getLeaveType");
	}

	
	// 휴가 신청서 작성
	@Override
	public int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeave afl,
			SqlSessionTemplate sqlSessionTemplate) {
		
		int result = sqlSessionTemplate.insert("approval.insertApproval", approvalVo);
		
		List<ApproverVo> approverList = new ArrayList<>();
		for(int i = 0; i < approver.size(); i++) {
			
			ApproverVo approverVo = new ApproverVo();
			approverVo.setApprovalNo(approvalVo.getNo());
			approverVo.setApproverNo(approver.get(i));
			if(i + 1 < approver.size()) {
				approverVo.setNextApprovaerNo(approver.get(i+1));
			}
			
			approverList.add(approverVo);
			
		}
		result *= sqlSessionTemplate.insert("approval.insertApprover", approverList);
		
		if(cc != null) {
			List<ApprovalCCVo> CcList = new ArrayList<>();
			for(int i = 0; i < cc.size(); i++) {
				ApprovalCCVo ccVo = new ApprovalCCVo();
				ccVo.setNo(approvalVo.getNo());
				ccVo.setCcNo(cc.get(i));
				
				CcList.add(ccVo);
			}
			result *= sqlSessionTemplate.insert("approval.insertCC", CcList);
		}
		
		afl.setApprovalNo(approvalVo.getNo());
		result *= sqlSessionTemplate.insert("approval.insertAFL", afl);
		
		return result;
	}

}

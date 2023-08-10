package com.kh.zoody.approval.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.approval.vo.ApplicationForExtraWorkVo;
import com.kh.zoody.approval.vo.ApplicationForLeaveVo;
import com.kh.zoody.approval.vo.ApprovalCCVo;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.ApproverVo;
import com.kh.zoody.approval.vo.DrafterVo;
import com.kh.zoody.approval.vo.ExtraWorkCategoryVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;
import com.kh.zoody.approval.vo.LetterOfApprovalVo;
import com.kh.zoody.user.vo.UserVo;

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
		
		LetterOfApprovalVo loa = new LetterOfApprovalVo();
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
	public int writeAFL(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForLeaveVo afl,
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

	
	// 추가 근무 유형 가지요기
	@Override
	public List<ExtraWorkCategoryVo> getWorkType(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("approval.getWorkType");
	}

	// 휴일/연장 근무 신청서 작성
	@Override
	public int writeAFE(ApprovalVo approvalVo, List<String> approver, List<String> cc, ApplicationForExtraWorkVo afe,
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
		
		afe.setApprovalNo(approvalVo.getNo());
		result *= sqlSessionTemplate.insert("approval.insertAFE", afe);
		
		return result;
	}

	
	// 유저가 결재해야하는 문서목록
	@Override
	public List<ApprovalVo> getApprovalList(String userNo, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("approval.getApprovalList", userNo);
	}

	
	// 전자결재 상세 보기
	@Override
	public ApprovalVo getApprovalDetail(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("approval.getApprovalDetail", no);
	}

	// 상세보기 상신인 정보 가져오기
	@Override
	public DrafterVo getDrafterInfo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("approval.getDrafterInfo", no);
	}

	// 문서번호로 카테고리 번호 얻기
	@Override
	public String getCategory(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("approval.getCategory", no);
	}

	// 품의서 내용 가져오기
	@Override
	public LetterOfApprovalVo getLoaInfo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("approval.getDetailLOA", no);
	}

	// 결재자들 불러오기
	@Override
	public List<ApproverVo> getApprovers(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("approval.getApprovers", no);
	}

	// 참조인들 불러오기
	@Override
	public List<ApproverVo> getCc(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("approval.getCc", no);
	}

	// 결재
	@Override
	public int deciseApproval(Map<String, String> dataMap, SqlSessionTemplate sqlSessionTemplate) {
		
		int result = sqlSessionTemplate.update("approval.decisionUpdate", dataMap);
		
		log.info("결정 업데이트 결과 : {}", result);
		
		if(dataMap.containsValue("instruction")) {
			result *= sqlSessionTemplate.update("approval.instructionUpdate", dataMap);
		}
		
		return result;
	}
	
}

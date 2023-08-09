package com.kh.zoody.community.vo;

import lombok.Data;

@Data
public class VoteVo {
	private String no; //
	private String title;
	
    private String startDate;
    private String endDate;
    
    private String scope; // 대상범위
    private String publicScope; // 결과 공개
    private String multipleVote; // 다중 선택
    
    private String guide; // 안내 문구
    private String question; // 문항
    
    private String writer; // 작성자
    
    private String voter; // 투표참여한 사람
    
    private String itemRownum; // 보기 rowNum
    private String itemNo; // 보기 No
    private String item; // 보기 질문
	
}

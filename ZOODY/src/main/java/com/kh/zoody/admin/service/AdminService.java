package com.kh.zoody.admin.service;

import java.util.List;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

public interface AdminService {

	//공지사항 목록
	List<NoticeVo> list(PageVo pv);

	//공지사항 게시글 갯수 조회
	int getNoticeListCnt();

	//복사할 게시글
	int copy(List<String> noList);



}

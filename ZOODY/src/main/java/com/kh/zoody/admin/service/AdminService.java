package com.kh.zoody.admin.service;

import java.util.List;

import com.kh.zoody.notice.vo.NoticeVo;

public interface AdminService {

	//공지사항 목록
	List<NoticeVo> list();

}

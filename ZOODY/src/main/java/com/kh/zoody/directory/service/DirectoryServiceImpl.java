package com.kh.zoody.directory.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.directory.doa.DirectorytDao;
import com.kh.zoody.document.vo.DocumentVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class DirectoryServiceImpl implements DirectoryService {

	private final SqlSessionTemplate sst;
	private final DirectorytDao dao;
	
	@Override
	public int renameDirectory(DocumentVo vo) {
		return dao.renameDirectory(sst, vo);
	}

}









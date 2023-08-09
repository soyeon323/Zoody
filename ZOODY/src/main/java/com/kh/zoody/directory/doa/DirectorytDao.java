package com.kh.zoody.directory.doa;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.document.vo.DocumentVo;

public interface DirectorytDao {

	int renameDirectory(SqlSessionTemplate sst, DocumentVo vo);

}

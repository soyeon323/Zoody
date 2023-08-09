package com.kh.zoody.directory.doa;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.document.vo.DocumentVo;

@Repository
public class DirectorytDaoImpl implements DirectorytDao{
	
	public int renameDirectory(SqlSessionTemplate sst, DocumentVo vo) {
		return sst.update("directory.renameDirectory" , vo);
	}
	
}

package com.kh.zoody.animal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.animal.vo.AnimalVo;

@Repository
public class AnimalDao {

	//동물 등록
	public int animalEnroll(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.insert("animal.enroll",vo);
	}

}

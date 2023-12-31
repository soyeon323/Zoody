package com.kh.zoody.animal.dao;

import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.animal.health.vo.HealthVo;
import com.kh.zoody.animal.training.vo.TrainingVo;
import com.kh.zoody.animal.vo.AnimalVo;
import com.kh.zoody.page.vo.PageVo;

@Repository
public class AnimalDao {

	//동물 등록
	public int animalEnroll(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.insert("animal.enroll",vo);
	}

	//동물 목록 조회
	public List<AnimalVo> AnimalList(SqlSessionTemplate sst, PageVo pv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
		return sst.selectList("animal.AnimalList",paramMap,rb);
	}
	
	//동물 리스트 조회(총 갯수)
	public int getAnimalListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("animal.getAnimalListCnt");
	}

	//동물 훈련 일지 작성
	public int trainingWrite(SqlSessionTemplate sst, TrainingVo vo) {
		return sst.insert("animal.trainingWrite",vo);
	}

	//동물 건강 상태 작성
	public int healthWrite(SqlSessionTemplate sst, HealthVo vo) {
		return sst.insert("animal.healthWrite",vo);
	}

	//동물 상세 조회
	public AnimalVo animalDetail(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.selectOne("animal.animalDetail",vo);
	}

	//동물건강 상태 조회
	public HealthVo animalHealth(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.selectOne("animal.animalHealth",vo);
	}

	//동물훈련 일지 조회
	public List<TrainingVo> trainingList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
		RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
		return sst.selectList("animal.trainingList",searchValue,rb);
	}

	//동물 훈련일지 리스트 조회(총 갯수)
	public int getAnimalTrainingListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("animal.getAnimalTrainingListCnt");
	}

	//동물 훈련 일지 상세 조회
	public AnimalVo animalTrainingDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("animal.animalTrainingDetail",no);
	}

	//동물 건강 일지 리스트 총 갯수 조회
	public int getAnimalHealthListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("animal.getAnimalHealthListCnt");
	}

	//동물 건강일지 리스트 조회
	public List<HealthVo> animalHealthList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
		RowBounds rb = new RowBounds(pv.getOffset(),pv.getBoardLimit());
		return sst.selectList("animal.animalHealthList",searchValue,rb);
	}

	//동물 폐사 처리
	public int animalDie(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.update("animal.animalDie" , vo);
	}

	//동물 담당부서 수정
	public int animalDeptEdit(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.update("animal.animalDeptEdit" , vo);
	}

	//해당 동물의 훈련일지 조회
	public List<TrainingVo> trainingDetail(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.selectList("animal.trainingDetail",vo);
	}

	//해당 동물의 건강검진 일지 리스트
	public List<HealthVo> healthDetail(SqlSessionTemplate sst, AnimalVo vo) {
		return sst.selectList("animal.healthDetail" , vo);
	}

	//훈련일지 수정
	public int trainingEdit(SqlSessionTemplate sst, TrainingVo vo) {
		return sst.update("animal.trainingEdit" , vo);
	}

	
	//건강검진 수정
	public int healthEdit(SqlSessionTemplate sst, HealthVo vo) {
		return sst.update("animal.healthEdit" ,vo);
	}


}

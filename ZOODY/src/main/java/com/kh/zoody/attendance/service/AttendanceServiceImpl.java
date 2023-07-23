package com.kh.zoody.attendance.service;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.attendance.dao.AttendanceDao;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService{
	
	private final SqlSessionTemplate sst;
	private final AttendanceDao dao;
	
	
	//(서브메뉴) 근무현황 목록 조회	
	@Override
	public List<AttendanceVo> list(PageVo pv) {
		return dao.list(sst, pv);
	}


	@Override
	public int getMyAttendanceCnt() {
		return dao.getMyAttendanceCnt(sst);
	}


	@Override
	public List<LeaveVo> leaveList(PageVo leavePv) {
		return dao.leaveList(sst, leavePv);
	}


	@Override
	public int getLeaveCnt() {
		return dao.getLeaveCnt(sst);
	}


	@Override
	public int getAllAttendanceCnt() {
		return dao.getAllAttendanceCnt(sst);
	}


	@Override
	public List<AttendanceVo> allList(PageVo allPv) {
		return dao.allList(sst, allPv);
	}


	@Override
	public int getMainAttCnt() {
		return dao.getMainAttCnt(sst);
	}


	@Override
	public int getMainLeaveCnt() {
		return dao.getMainLeaveCnt(sst);
	}


	@Override
	public List<AttendanceVo> mainAttlist(PageVo mPv) {
		return dao.mainAttlist(sst, mPv);
	}


	@Override
	public List<LeaveVo> mainLeList(PageVo mPv) {
		return dao.mainLeList(sst, mPv);
	}


	@Override
	public int getObjCnt() {
		return dao.getObjCnt(sst);
	}


	@Override
	public List<AttendanceVo> objList(PageVo objPv) {
		return dao.objList(sst, objPv);
	}


	@Override
	public List<AttendanceVo> mainDeList() {
		return dao.mainDeList(sst);
	}


	@Override
	public int checkInWork(AttendanceVo attendanceVo) {
		return dao.checkInWork(sst, attendanceVo);
	}


    @Override
    public int checkOutWork(AttendanceVo attendanceVo) {
        int attendanceNo = dao.checkInWork(sst, attendanceVo);

        // 출근 기록이 인서트된 행의 no 값을 attendanceVo에 설정
        attendanceVo.setNo(attendanceNo);

        // 퇴근 기록을 업데이트
        return dao.checkOutWork(sst, attendanceVo);
    }



	
	

}

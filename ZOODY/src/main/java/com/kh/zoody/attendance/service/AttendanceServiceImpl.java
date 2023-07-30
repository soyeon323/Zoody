package com.kh.zoody.attendance.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.attendance.dao.AttendanceDao;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.ExtraWorkVo;
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
	public List<AttendanceVo> list(PageVo pv, String searchValue) {
		return dao.list(sst, pv, searchValue);
	}


	@Override
	public int getMyAttendanceCnt(String searchValue) {
		return dao.getMyAttendanceCnt(sst, searchValue);
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
	public int getAllAttendanceCnt(Map<String, String> paramMap) {
		return dao.getAllAttendanceCnt(sst, paramMap);
	}


	@Override
	public List<AttendanceVo> allList(PageVo allPv, Map<String, String> paramMap) {
		return dao.allList(sst, allPv, paramMap);
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
	public int getObjCnt(Map<String, String> paramMap) {
		return dao.getObjCnt(sst, paramMap);
	}


	@Override
	public List<AttendanceVo> objList(PageVo objPv, Map<String, String> paramMap) {
		return dao.objList(sst, objPv, paramMap);
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
		return dao.checkOutWork(sst, attendanceVo);
	}


	@Override
	public List<AttendanceVo> mainChartList() {
		return dao.mainChartList(sst);
	}


	@Override
	public List<AttendanceVo> mainCalendarList() {
		return dao.mainCalendarList(sst);
	}


	@Override
	public int getCurrentTypeOneCnt() {
		return dao.getCurrentTypeOneCnt(sst);
	}


	@Override
	public int getCurrentTypeSixCnt() {
		return dao.getCurrentTypeSixCnt(sst);
	}


	@Override
	public int getCurrentTypeLeaveCnt() {
		return dao.getCurrentTypeLeaveCnt(sst);
	}


	@Override
	public int getCurrentTypeFourCnt() {
		return dao.getCurrentTypeFourCnt(sst);
	}


	@Override
	public int submitOjection( Map<String, String> params) {
		return dao.submitOjection(sst, params);
	}


	@Override
	public List<ExtraWorkVo> extraWorkList(PageVo workPv) {
		return dao.extraWorkList(sst, workPv);
	}


	@Override
	public int getObjectionCnt() {
		return dao.getObjectionCnt(sst);
	}


	@Override
	public int updateStatus(Map<String, String> objParams) {
		return dao.updateStatus(sst, objParams);
	}


	@Override
	public List<ExtraWorkVo> mainWorkList(PageVo mPv) {
		return dao.mainWorkList(sst, mPv);
	}


	@Override
	public int getUserAttendanceCnt() {
		return dao.getUserAttendanceCnt(sst);
	}


	@Override
	public int getWorkCnt() {
		return dao.getWorkCnt(sst);
	}








	
	

}

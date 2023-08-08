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
	public List<AttendanceVo> list(PageVo pv, String searchValue, String no) {
		return dao.list(sst, pv, searchValue, no);
	}


	@Override
	public int getMyAttendanceCnt(String searchValue, String no) {
		return dao.getMyAttendanceCnt(sst, searchValue, no);
	}


	@Override
	public List<LeaveVo> leaveList(PageVo leavePv, String no) {
		return dao.leaveList(sst, leavePv, no);
	}


	@Override
	public int getLeaveCnt(String no) {
		return dao.getLeaveCnt(sst, no);
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
	public int getMainAttCnt(String no) {
		return dao.getMainAttCnt(sst, no);
	}


	@Override
	public int getMainLeaveCnt(String no) {
		return dao.getMainLeaveCnt(sst, no);
	}


	@Override
	public List<AttendanceVo> mainAttlist(PageVo mPv, String no) {
		return dao.mainAttlist(sst, mPv, no);
	}


	@Override
	public List<LeaveVo> mainLeList(PageVo mPv, String no) {
		return dao.mainLeList(sst, mPv, no);
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
	public List<AttendanceVo> mainDeList(String departmentNo) {
		return dao.mainDeList(sst, departmentNo);
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
	public int getCurrentTypeOneCnt(String no) {
		return dao.getCurrentTypeOneCnt(sst, no);
	}


	@Override
	public int getCurrentTypeSixCnt(String no) {
		return dao.getCurrentTypeSixCnt(sst, no);
	}


	@Override
	public int getCurrentTypeLeaveCnt(String no) {
		return dao.getCurrentTypeLeaveCnt(sst, no);
	}


	@Override
	public int getCurrentTypeFourCnt(String no) {
		return dao.getCurrentTypeFourCnt(sst, no);
	}


	@Override
	public int submitOjection( Map<String, String> params) {
		return dao.submitOjection(sst, params);
	}


	@Override
	public List<ExtraWorkVo> extraWorkList(PageVo workPv, String no) {
		return dao.extraWorkList(sst, workPv, no);
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
	public List<ExtraWorkVo> mainWorkList(PageVo mPv, String no) {
		return dao.mainWorkList(sst, mPv, no);
	}


	@Override
	public int getUserAttendanceCnt(String no) {
		return dao.getUserAttendanceCnt(sst, no);
	}


	@Override
	public int getWorkCnt(String no) {
		return dao.getWorkCnt(sst, no);
	}


	@Override
	public boolean hasCheckInRecordToday(AttendanceVo attendanceVo) {
		return dao.hasCheckInRecordToday(sst, attendanceVo);
	}


	@Override
	public boolean hasCheckOutRecordToday(AttendanceVo attendanceVo) {
		return dao.hasCheckOutRecordToday(sst, attendanceVo);
	}


	@Override
	public List<Map<String, Object>> monthList(String no) {
		return dao.monthList(sst, no);
	}


	@Override
	public List<Map<String, Object>> dataChart(String no) {
		return dao.dataChart(sst, no);
	}


	@Override
	public List<AttendanceVo> chartList(String no, String formattedStartDate, String formattedEndDate) {
		return dao.chartList(sst, no, formattedStartDate, formattedEndDate);
	}


//	@Override
//	public Integer countSum(AttendanceVo vo, int i) {
//		// TODO Auto-generated method stub
//		return null;
//	}













	
	

}

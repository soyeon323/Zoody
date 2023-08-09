package com.kh.zoody.meetingroom.service;

import java.awt.Image;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.meetingroom.dao.MeetingroomDao;
import com.kh.zoody.meetingroom.vo.MeetingroomReservationVo;
import com.kh.zoody.meetingroom.vo.MeetingroomVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MeetingroomServiceImpl implements MeetingroomService{
	
	private final MeetingroomDao dao;
	private final SqlSessionTemplate sst;
	private final ServletContext servletContext;

	@Override
	public List<MeetingroomVo> selectList() {
		return dao.selectList(sst);
	}

	@Override
	public int addMeetingroom(MeetingroomVo mvo, MultipartFile file) {
        // 파일 업로드 처리
        String fileName = saveUploadedFile(file);
        String originName = file.getOriginalFilename();

        // 회의실 정보 저장
        mvo.setChangeName(fileName);
        mvo.setOriginName(originName);
        
        
        return dao.addMeetingroom(sst, mvo);
    }

    //파일 업로드
    private String saveUploadedFile(MultipartFile file) {
    	try {

    		//절대 경로
//    		String uploadDir = "D:/dev/finalZoodyRepo/ZOODY/src/main/webapp/resources/img/meetingroom/";
    		
    		// 상대 경로 설정
            String relativePath = "/resources/img/meetingroom/";

            // 상대 경로를 절대 경로로 변환
            String absolutePath = servletContext.getRealPath(relativePath);
            

            File dir = new File(absolutePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            //원본 파일명 가져오기
            String originalFileName = file.getOriginalFilename();

            //파일명 중복 방지를 위해 유니크한 파일명 생성
            String uniqueFileName = java.util.UUID.randomUUID().toString() + "_" + originalFileName;

            //파일을 서버에 저장할 경로와 파일명 결합
            Path filePath = Paths.get(absolutePath + uniqueFileName);

            //파일을 지정된 경로에 저장
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            //저장된 파일명 또는 경로 반환
            return uniqueFileName;
            
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    

	@Override
	public int mtDelete(String no) {
		return dao.mtDelete(sst, no);
	}

	@Override
	public MeetingroomVo selectDetail(String no) {
		return dao.selectDetail(sst, no);
	}

	@Override
	public int updateMeetingroom(MeetingroomVo mvo, MultipartFile file) {
		
		// 파일 업로드 처리
        String fileName = saveUploadedFile(file);
        String originName = file.getOriginalFilename();

        // 회의실 정보 저장
        mvo.setChangeName(fileName);
        mvo.setOriginName(originName);
		
		return dao.updateMeetingroom(sst, mvo);
	}

	@Override
	public List<Map<String, Object>> reserveTime(String meetingroomNo, String date) {
		return dao.reserveTime(sst, meetingroomNo, date);
	}

	@Override
	public int addReserve(MeetingroomReservationVo mrv) {
		return dao.addReserve(sst, mrv);
	}

	@Override
	public List<String> getReservedTimes(String meetingroomNo, String date) {
		return dao.getReservedTimes(sst, meetingroomNo, date);
	}

	@Override
	public List<MeetingroomReservationVo> reserveTimeList(String meetingroomNo, String date) {
		return dao.reserveTimeList(sst, meetingroomNo, date);
	}

	@Override
	public int checkTime(String meetingroomNo, String date, String startTime) {
		return dao.checkTime(sst, meetingroomNo, date, startTime);
	}

	@Override
	public int addReserveInfoToCalendar() {
		return dao.addReserveInfoToCalendar(sst);
	}

}

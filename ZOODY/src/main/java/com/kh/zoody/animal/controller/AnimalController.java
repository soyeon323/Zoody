package com.kh.zoody.animal.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.zoody.animal.health.vo.HealthVo;
import com.kh.zoody.animal.service.AnimalService;
import com.kh.zoody.animal.training.vo.TrainingVo;
import com.kh.zoody.animal.vo.AnimalVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("animal")
@RequiredArgsConstructor
@Slf4j
public class AnimalController {

	private final AnimalService as;
	
	//동물 등록
	@GetMapping("enroll")
	public String animalEnroll() {
		return "animal/enroll";
	}
	
	//동물 등록
	@PostMapping("enroll")
	public String animalEnroll(AnimalVo vo, MultipartFile f , HttpServletRequest req) throws Exception {
		
		String savePath = req.getServletContext().getRealPath("/resources/img/animal/");
		String originalFilename = f.getOriginalFilename();
		
		String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	    String fileName = UUID.randomUUID().toString() + extension;
	    String path = savePath + fileName;
	    File target = new File(path);
	    f.transferTo(target);
		
		vo.setProfile(fileName);
		log.info(fileName);
		int result = as.animalEnroll(vo);
		
		if(result !=2 && f.isEmpty()) {
			throw new RuntimeException();
		}
		return "redirect:/animal/list?page=1";
	}
	
	
	//동물 리스트
	@RequestMapping("list")
	public String animalList( @RequestParam(defaultValue = "1") Integer page, Model model , @RequestParam Map<String,String> paramMap) {
		
		int listCount = as.getAnimalListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 7;
	
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int getAnimalListCnt = as.getAnimalListCnt();
		
		List<AnimalVo> animalList = as.AnimalList(pv , paramMap);
		log.info("animalList = {}",animalList);
		if(animalList ==null) {
			throw new RuntimeException();
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("animalList", animalList);
		map.put("getAnimalListCnt", getAnimalListCnt);
		map.put("pv", pv);
		
		
		model.addAttribute("map",map);
		return "animal/list";
	}

	//동물 상세 조회
	@GetMapping("detail")
	public String animalDetail(AnimalVo vo , TrainingVo tvo, Model model) {
		
		AnimalVo animalVo = as.animalDetail(vo);
		//해당 동물의 동물 훈련일지 리스트
		List<TrainingVo>  tvList= as.trainingDetail(vo);

		//해당 동물의 건강검진 일지 리스트
		List<HealthVo> htList = as.healthDetail(vo);
		
		log.info("animalVo = {}",animalVo);
		log.info("trainingVo = {}",tvList);
		if(animalVo == null) {
			throw new RuntimeException();
		}
		
		model.addAttribute("animalVo",animalVo); 
		model.addAttribute("trainingVo",tvList); 
		model.addAttribute("healthVo",htList); 
		return "animal/detail";
	}

	
	//동물 훈련 일지리스트 조회
	@GetMapping("training/list")
	public String animalTrainingList(@RequestParam(defaultValue = "1")  Integer page, TrainingVo vo , Model model , String searchValue) {
		
		int listCount = as.getAnimalTrainingListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 7;
	
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int getAnimalTrainingListCnt = as.getAnimalTrainingListCnt();
		
		List<TrainingVo> trainingVo = as.trainingList(pv,searchValue);
		if(trainingVo ==null) {
			throw new RuntimeException();
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("trainingVo", trainingVo);
		map.put("getAnimalTrainingListCnt",getAnimalTrainingListCnt);
		map.put("pv", pv);
		
		
		model.addAttribute("map",map);
		return "animal/training-list";
	}
	
	
	//동물 훈련 일지 작성
	@PostMapping("training/write")
	public String animalTraining(TrainingVo vo) {
		
		int result = as.trainingWrite(vo);
		if(result != 1) {
			throw new RuntimeException();
		}

		return "redirect:/animal/training/list?page=1";
	}
	
	//동물 훈련 일지 상세조회
	@GetMapping("training/detail")
	public String animalTrainingDetail(String no , Model m) {
		
		AnimalVo vo = as.animalTrainingDetail(no);
		log.info("훈련일지 vo 는 = {}",vo);
		if(vo==null) {
			throw new RuntimeException();
		}
		m.addAttribute("vo",vo);
		return "animal/training-detail";
	}
	
	//동물 건강 상태 리스트
	@GetMapping("health/list")
	public String animalHealthList( @RequestParam(defaultValue = "1") Integer page, Model model , String searchValue) {
		
		int listCount = as.getAnimalHealthListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 7;
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int getAnimalHealthListCnt = as.getAnimalHealthListCnt();
		
		List<HealthVo> animalHealthList = as.animalHealthList(pv , searchValue);
		log.info("animaHealthList = {}",animalHealthList);
		if(animalHealthList ==null) {
			throw new RuntimeException();
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("animalHealthList", animalHealthList);
		map.put("getAnimalListCnt", getAnimalHealthListCnt);
		map.put("pv", pv);
		
		model.addAttribute("map",map);
		return "animal/health-list";
		}
	
	
	//동물 건강상태 작성
	@PostMapping("health/write")
	public String animalHealthWrite(HealthVo vo) {
		
		int result = as.healthWrite(vo);
		if(result != 1) {
			throw new RuntimeException();
		}

		return "redirect:/animal/health/list?page=1";
	}
	
	//동물 건강 상태 상세조회
	@GetMapping("health/detail")
	public String animalHealth(AnimalVo vo , Model model) {
		
		HealthVo hvo = as.animalHealth(vo);
		log.info("hvo = {}",hvo);
		if(hvo ==null) {
			throw new RuntimeException();
		}
		
		model.addAttribute("hvo",hvo);
    
		return "animal/health-detail";
	}
	
	//동물 폐사 처리
	@PostMapping("die")
	public String animalDie(AnimalVo vo) {
		
		int result = as.animalDie(vo);
		if(result !=1) {
			throw new RuntimeException();
		}
		return "redirect:/animal/list?page=1";

	}
	
	//동물 담당부서 수정
	@PostMapping("dept/edit")
	@ResponseBody
	public String animalDetpEdit(AnimalVo vo) {
		
		int result = as.animalDeptEdit(vo);
		if(result !=1) {
			throw new RuntimeException();
		}
		return "data";
	}
	
	//훈련일지 수정
	@PostMapping("training/edit")
	public String trainingEdit(TrainingVo vo) {
		
		int result = as.trainingEdit(vo);
		
		if(result !=1) {
			throw new RuntimeException();
		}
		
		return "redirect:/animal/training/list";
	}
	
	//건강검진 수정
	@PostMapping("health/edit")
	public String healthEdit(HealthVo vo) {
		
		int result = as.healthEdit(vo);
		
		if(result !=1) {
			throw new RuntimeException();
		}
		return "redirect:/animal/health/list";
	}
	
	
}

package com.moco.finalProject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moco.movieAPI.BasicMovieDTO;
import com.moco.movieAPI.movieRecommend.DirectorDTO;
import com.moco.movieAPI.movieRecommend.RecommendService;

@Controller
@RequestMapping(value="/movie/basicMovieSearch/movieRecommend/")
public class BasicMovieRecommendController {
	
	@Inject
	RecommendService recommendService;
	
	@RequestMapping(value="recommendHome", method=RequestMethod.GET)
	public void recommendHome(){
		
	}
	
	@RequestMapping(value="recommendList", method=RequestMethod.GET)
	public void recommendList(String criteria, String subCriteria, Model model){
		System.out.println(criteria+"/"+subCriteria);
		List<BasicMovieDTO> movieList = new ArrayList<BasicMovieDTO>(); // 영화 리스트
		int jjimCount = 0; // 찜하기 갯수
		Map<String, Object> criteria_map = new HashMap<String, Object>(); // 조건 map
		Map<String, Object> movie_map = new HashMap<String, Object>(); // 넘겨줄 list map
		try{
			// 장르별
			if(criteria.equals("genre")){
				criteria_map.put("genre", subCriteria);
			}
			// 년도별
			else if(criteria.equals("year")){
				criteria_map.put("year", Integer.parseInt(subCriteria));
			}
			// 감독별 별점 평균 순위
			else if(criteria.equals("director")){
				criteria_map.put("director", "director");
				List<DirectorDTO> directorList = recommendService.directorList();
				movie_map.put("directorList", directorList);
			}
			// 나이별 최다관람순
			else if(criteria.equals("age")){
				
			}
			// 오늘날씨
			else if(criteria.equals("weather")){
				
			}
			// 그룹별 
			else if(criteria.equals("group")){
				criteria_map.put("group", subCriteria);
			}
			// 내가 본 영화와 비슷한 영화
			else if(criteria.equals("my")){
				
			}
			// 리뷰 순위
			else if(criteria.equals("review")){
				
			}
			// 찜하기 순위
			else if(criteria.equals("jjim")){
				
			}
			// 최근 영화
			else if(criteria.equals("recent")){
				
			}
			movieList = recommendService.genreList(criteria_map);
			movie_map.put("movieList", movieList);
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("movie_map", movie_map).addAttribute("criteria", criteria);
	}
}

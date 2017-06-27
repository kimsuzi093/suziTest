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
		List<BasicMovieDTO> movieList = new ArrayList<BasicMovieDTO>(); // 영화 리스트
		int jjimCount = 0; // 찜하기 갯수
		Map<String, Object> criteria_map = new HashMap<String, Object>(); // 조건 map
		Map<String, Object> movie_map = new HashMap<String, Object>(); // 넘겨줄 list map
		try{
			if(criteria.equals("genre")){
				criteria_map.put("genre", subCriteria);
				movieList = recommendService.genreList(criteria_map);
				movie_map.put("movieList", movieList);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("movie_map", movie_map);
	}
}

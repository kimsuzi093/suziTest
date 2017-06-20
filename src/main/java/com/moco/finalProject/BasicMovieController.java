package com.moco.finalProject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.javassist.runtime.DotClass;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moco.movieAPI.BasicMovieDTO;
import com.moco.movieAPI.BasicMovieService;
import com.moco.movieAPI.movieSearch.SearchDTO;
import com.moco.util.PageMaker;
import com.moco.util.PageResult;
import com.moco.util.RowMaker;

@Controller
@RequestMapping(value="/movie/basicMovieSearch/")
public class BasicMovieController {
	@Inject
	BasicMovieService basicMovieService;
	
	@RequestMapping(value = "movieSearchHome", method = RequestMethod.GET)
	public void movieSearchHome(Model model){
		List<String> nationList = new ArrayList<String>();
		try {
			nationList = basicMovieService.nationList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("nationList", nationList);
	}
	
	@RequestMapping(value = "movieSearch", method = RequestMethod.POST)
	public String movieSearch(SearchDTO searchDTO, Integer curPage, Model model){
		List<BasicMovieDTO> movieList = new ArrayList<BasicMovieDTO>();
		Map<String, Object> map = new HashMap<String, Object>();
		// curPage
		if(curPage == null){
			curPage = 1;
		}
		// 입력값이 없으면 null로 초기화
		if(searchDTO.getTitle()==""){
			searchDTO.setTitle(null);
		}
		if(searchDTO.getGenre().equals("all")){
			searchDTO.setGenre(null);
		}
		if(searchDTO.getNation().equals("all")){
			searchDTO.setNation(null);
		}
		if(searchDTO.getDirector()==""){
			searchDTO.setDirector(null);
		}
		if(searchDTO.getActor()==""){
			searchDTO.setActor(null);
		}
		// map.put
		map.put("searchDTO", searchDTO);
		map.put("curPage", curPage);
		// totalCount
		int totalCount = 0;
		try {
			totalCount = basicMovieService.totalCount(map);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		// paging
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pageResult = pageMaker.paging(totalCount);
		map.put("rowMaker", rowMaker);
		// list
		try {
			movieList = basicMovieService.list(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("movieList", movieList).addAttribute("pageResult", pageResult).addAttribute("curPage", curPage)
		.addAttribute("searchDTO", searchDTO);
		return "movie/basicMovieSearch/movieList";
	}
}

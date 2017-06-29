package com.moco.finalProject;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moco.jjim.JjimDTO;
import com.moco.member.MemberDTO;
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
	public String movieSearch(SearchDTO searchDTO, Integer curPage, Model model, HttpSession session){
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
		if(searchDTO.getGenre().equals("all") || searchDTO.getGenre().equals("")){
			searchDTO.setGenre(null);
		}
		if(searchDTO.getNation().equals("all") || searchDTO.getNation().equals("")){
			searchDTO.setNation(null);
		}
		if(searchDTO.getDirector()==""){
			searchDTO.setDirector(null);
		}
		if(searchDTO.getActor()==""){
			searchDTO.setActor(null);
		}
		if(searchDTO.getYearMin()==0){
			searchDTO.setYearMin(1900);
		}
		if(searchDTO.getYearMax()==0){
			searchDTO.setYearMax(2100);
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
		// view 이후 리스트로 돌아갈 때
		session.setAttribute("searchDTO", searchDTO);
		session.setAttribute("curPage", curPage);
		// model
		model.addAttribute("movieList", movieList).addAttribute("pageResult", pageResult).addAttribute("curPage", curPage)
		.addAttribute("searchDTO", searchDTO);
		return "movie/basicMovieSearch/movieList";
	}
	// view
	@RequestMapping(value = "movieView", method = RequestMethod.GET)
	public void movieView(int num, String kind, Model model, HttpSession session){
		if(kind==null){
			kind="story";
		}
		BasicMovieDTO basicMovieDTO = new BasicMovieDTO();
		JjimDTO jjimDTO = null;
		try {
			basicMovieDTO = basicMovieService.view(num);
			JjimDTO testJjim = new JjimDTO();
			testJjim.setbNum(num);
			testJjim.setId(((MemberDTO)session.getAttribute("memberDTO")).getId());
			jjimDTO = basicMovieService.jjimCheck(testJjim);
		} catch (Exception e) {
			
		}
		model.addAttribute("movieDTO", basicMovieDTO).addAttribute("kind", kind).addAttribute("jjimDTO", jjimDTO);
	}
	// view_story
	@RequestMapping(value = "movieView_story", method = RequestMethod.GET)
	public void movieViewStroy(int num, Model model){
		BasicMovieDTO basicMovieDTO = new BasicMovieDTO();
		try {
			basicMovieDTO = basicMovieService.view(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("movieDTO", basicMovieDTO);
	}
	// view_trailer
	@RequestMapping(value = "movieView_trailer", method = RequestMethod.GET)
	public void movieViewTrailer(int num, Model model){
		BasicMovieDTO basicMovieDTO = new BasicMovieDTO();
		try {
			basicMovieDTO = basicMovieService.view(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("movieDTO", basicMovieDTO);
	}
	// 찜하기
	@RequestMapping(value = "jjim", method = RequestMethod.GET)
	public void jjim(boolean flag, int bNum, HttpSession session){
		JjimDTO jjimDTO = new JjimDTO();
		jjimDTO.setId(((MemberDTO)session.getAttribute("memberDTO")).getId());
		jjimDTO.setbNum(bNum);
		try{
			if(flag){
				basicMovieService.jjimInsert(jjimDTO);
			}else{
				basicMovieService.jjimDelete(jjimDTO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

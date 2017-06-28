package com.moco.finalProject;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moco.movieSchedule.MovieScheduleDTO;
import com.moco.movieSchedule.MovieScheduleService;

@Controller
@RequestMapping(value="/movieSchedule/**")
public class MovieScheduleController {

	@Autowired
	private MovieScheduleService movieScheduleService;
	
	@RequestMapping(value="movieScheduleTable", method=RequestMethod.GET)
	public void movieScheduleTable(){
		System.out.println("- movieScheduleController -> List");
	}
	
	@RequestMapping(value="movieScheduleTableShow", method=RequestMethod.GET)
	@ResponseBody
	public List<MovieScheduleDTO> movieScheduleTableShow(Model model){
		System.out.println("- movieScheduleController -> TableShow");
		
		List<MovieScheduleDTO> ar = null;
		
		try {
			ar = movieScheduleService.movieScheduleShow();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ar;
	}
	
	//////////////////////////////////////////////////////////////////////
	@RequestMapping(value="movieScheduleList", method=RequestMethod.GET)
	public void movieScheduleList(Integer curPage, @RequestParam(required=false)String search, Model model){
		System.out.println("- movieScheduleController -> ListShow");
		
		try {
			if(curPage == null){
				curPage = 1;
			}
			if(search == null){
				search="sysdate";
			}
			
			Map<String, Object> map = movieScheduleService.movieScheduleList(curPage, search);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageResult",map.get("pageResult"));
			model.addAttribute("curPage",curPage);
			model.addAttribute("search", search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	////////////////////////////////////////////////////////////////////

	@RequestMapping(value="movieScheduleAdd", method=RequestMethod.GET)
	public void movieScheduleAdd() {
		System.out.println("- movieScheduleController -> Add1");
	}
	
	@RequestMapping(value="movieScheduleAdd", method=RequestMethod.POST)
	public String movieScheduleAdd(MovieScheduleDTO movieScheduleDTO, RedirectAttributes redirectAttributes){
		System.out.println("- movieScheduleController -> Add2");
		
		int result = 0;
		String message = "등록 실패";
		
		try {
			result = movieScheduleService.movieScheduleAdd(movieScheduleDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "등록 성공";
		}
		
		redirectAttributes.addFlashAttribute("message",message);	
		
		return "/movieSchedule/movieScheduleList";
	}
	
	@RequestMapping(value="paidMovieCheck1", method=RequestMethod.POST)
	public String paidMovieCheck1(int pnum, Model model){
		System.out.println("- movieScheduleController -> paidMovieCheck1");
		
		String title = null;
		
		try {
			title = movieScheduleService.paidMovieCheck1(pnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(title == null){
			model.addAttribute("message", null);
		} else {
			model.addAttribute("message", title);
		}
		
		System.out.println("title : "+title);

		return "/movieSchedule/action/movieSearchResult";
	}
	
	@RequestMapping(value="paidMovieCheck2", method=RequestMethod.POST)
	public String paidMovieCheck2(Date moviedate, Model model){
		System.out.println("- movieScheduleController -> paidMovieCheck2");
		
		Date date = null;
		
		try {
			date = movieScheduleService.paidMovieCheck2(moviedate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(date == null){
			System.out.println("날짜가 중복되지 않습니다.");
		} else {
			System.out.println("날짜가 중복됩니다.");
		}

		model.addAttribute("message", date);
		System.out.println("Date : "+date);

		return "/movieSchedule/action/movieSearchResult";
	}
}

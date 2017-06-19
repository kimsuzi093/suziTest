package com.moco.finalProject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moco.movieAPI.movieSearch.SearchDTO;

@Controller
@RequestMapping(value="/movie/basicMovieSearch/")
public class BasicMovieController {
	
	@RequestMapping(value = "movieSearchHome", method = RequestMethod.GET)
	public void movieSearchHome(){
		
	}
	
	@RequestMapping(value = "movieSearch", method = RequestMethod.POST)
	public void movieSearch(SearchDTO searchDTO){
		System.out.println(searchDTO.getDirector());
	}
}

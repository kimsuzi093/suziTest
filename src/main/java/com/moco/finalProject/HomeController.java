package com.moco.finalProject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moco.directorBoard.invest.InvestService;
import com.moco.member.MemberDTO;
import com.moco.movieAPI.BasicMovieDTO;
import com.moco.movieAPI.BasicMovieService;
import com.moco.movieAPI.Json.JsonMain;
import com.moco.movieAPI.movieRecommend.weather.Getweather;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	JsonMain jsonMain;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );
		
		Getweather getweather = new Getweather();
		getweather.getWeather();
		
		return "home";
	}

	@RequestMapping(value = "/user/userHome", method = RequestMethod.GET)
	public void userHome(){

	}

	@RequestMapping(value = "/movie/movieHome", method = RequestMethod.GET)
	public void movieHome(){

	}

}

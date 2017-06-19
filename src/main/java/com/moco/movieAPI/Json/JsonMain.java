package com.moco.movieAPI.Json;

import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.DateFormat;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.moco.movieAPI.BasicMovieDTO;
import com.moco.movieAPI.BasicMovieService;

public class JsonMain {
	@Inject
	BasicMovieService basicMovieService;
	
	public void JsonMain(String movieTitle){

		try{
			String apikey = "644071ae8d09952c39344fc7b0f204b1";
			String q = URLEncoder.encode(movieTitle, "UTF-8");
			String requestURL = "https://apis.daum.net/contents/movie?apikey="+apikey+"&q="+q+"&output=json";
			URL url = new URL(requestURL);

			GetItems getItems = new GetItems();

			HashMap<String, Object> map = new ObjectMapper().readValue(url, HashMap.class);
			HashMap<String, Object> channel = (HashMap<String, Object>) map.get("channel");
			List<HashMap<String, Object>> itemList = (List<HashMap<String, Object>>) channel.get("item");
			for(int i=0; i<itemList.size(); i++){
				HashMap<String, Object> item = itemList.get(i);
				BasicMovieDTO dto = new BasicMovieDTO();

				List<String> thumbnail = getItems.getItem(item, "thumbnail");
				dto.setThumnail(thumbnail.get(0));
				List<String> title = getItems.getItem(item, "title");
				dto.setTitle(title.get(0));
				List<String> eng_title = getItems.getItem(item, "eng_title");
				dto.setEng_title(eng_title.get(0));
				List<String> keyword = getItems.getItem(item, "kword");
				String input_keyword = "";
				for(int k=0; k<keyword.size(); k++){
					input_keyword = input_keyword+keyword.get(k);
					if(k<keyword.size()-1){
						input_keyword = input_keyword+",";
					}
				}
				dto.setKeyword(input_keyword);
				List<String> year = getItems.getItem(item, "year");
				dto.setYear(Integer.parseInt(year.get(0)));
				List<String> trailer = getItems.getItem(item, "trailer");
				dto.setTrailer(trailer.get(0));
				List<String> director = getItems.getItem(item, "director");
				dto.setDirector(director.get(0));
				List<String> actor = getItems.getItem(item, "actor");
				String input_actor = "";
				for(int k=0; k<actor.size(); k++){
					input_actor = input_actor+actor.get(k);
					if(k<actor.size()-1){
						input_actor = input_actor+",";
					}
				}
				dto.setActor(input_actor);
				List<String> nation = getItems.getItem(item, "nation");
				dto.setNation(nation.get(0));
				List<String> genre = getItems.getItem(item, "genre");
				String input_genre = "";
				for(int k=0; k<genre.size(); k++){
					input_genre = input_genre+genre.get(k);
					if(k<genre.size()-1){
						input_genre = input_genre+",";
					}
				}
				dto.setGenre(input_genre);
				List<String> open_info = getItems.getItem(item, "open_info");
				String pub_date = open_info.get(0);
				String watching_rate = open_info.get(1);
				String play_time = open_info.get(2);
				String re_pub_date = pub_date.replace(".", "-");
				System.out.println(re_pub_date);
				Date date = Date.valueOf(re_pub_date);
				System.out.println(date);
				dto.setPub_date(date);
				System.out.println(dto.getPub_date());
				dto.setWatching_rate(watching_rate);
				dto.setPlay_time(play_time);
				
				basicMovieService.insert(dto);
			} 
		}catch(Exception e){

		}
	}
}

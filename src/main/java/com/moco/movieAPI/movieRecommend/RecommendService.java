package com.moco.movieAPI.movieRecommend;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.moco.movieAPI.BasicMovieDTO;

@Service
public class RecommendService {

	@Inject
	RecommendDAO recommendDAO;

	// 장르별 추천 영화
	public List<BasicMovieDTO> genreList(Map<String, Object> map) throws Exception {
		return recommendDAO.genreList(map);
	}

	// director list
	public List<DirectorDTO> directorList() throws Exception{
		return recommendDAO.directorList();
	}

}

package com.moco.movieAPI;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BasicMovieService {
	@Inject
	BasicMovieDAO basicMovieDAO;
	
	public int insert(BasicMovieDTO basicMovieDTO) throws Exception{
		return basicMovieDAO.insert(basicMovieDTO);
	}
}

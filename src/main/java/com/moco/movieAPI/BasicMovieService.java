package com.moco.movieAPI;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BasicMovieService {
	@Inject
	BasicMovieDAO basicMovieDAO;

	// 영화 INSERT
	public int insert(BasicMovieDTO basicMovieDTO) throws Exception{
		return basicMovieDAO.insert(basicMovieDTO);
	}
	// 영화 리스트 뽑아오기
	public List<BasicMovieDTO> list(Map<String, Object> map) throws Exception{
		return basicMovieDAO.list(map);
	}
	// NATION 리스트 뽑아오기
	public List<String> nationList() throws Exception{
		return basicMovieDAO.nationList();
	}
	// totalCount
	public int totalCount(Map<String, Object> map) throws Exception{
		return basicMovieDAO.totalCount(map);
	}
}

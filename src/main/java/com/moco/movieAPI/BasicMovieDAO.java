package com.moco.movieAPI;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component
public class BasicMovieDAO {
	@Inject
	SqlSession sqlSession;
	private final String MAPPER_NAME = "BasicMovieMapper.";
	
	public int insert(BasicMovieDTO basicMovieDTO) throws Exception{
		return sqlSession.insert(MAPPER_NAME+"insert", basicMovieDTO);
	}
}

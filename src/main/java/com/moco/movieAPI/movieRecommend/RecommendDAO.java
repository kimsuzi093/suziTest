package com.moco.movieAPI.movieRecommend;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moco.movieAPI.BasicMovieDTO;

@Repository
public class RecommendDAO {
	@Inject
	SqlSession sqlSession;
	private final String MAPPER_NAME = "BasicMovieRecommendMapper.";
	
	// 장르별 추천 영화
	public List<BasicMovieDTO> genreList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(MAPPER_NAME+"genreList", map);
	}
}

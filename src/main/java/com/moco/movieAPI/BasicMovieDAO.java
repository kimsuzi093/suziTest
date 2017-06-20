package com.moco.movieAPI;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component
public class BasicMovieDAO {
	@Inject
	SqlSession sqlSession;
	private final String MAPPER_NAME = "BasicMovieMapper.";
	
	// 영화 INSERT
	public int insert(BasicMovieDTO basicMovieDTO) throws Exception{
		return sqlSession.insert(MAPPER_NAME+"insert", basicMovieDTO);
	}
	// 영화 리스트 뽑아오기
	public List<BasicMovieDTO> list(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(MAPPER_NAME+"list", map);
	}
	// NATION 리스트 뽑아오기
	public List<String> nationList() throws Exception{
		return sqlSession.selectList(MAPPER_NAME+"nationList");
	}
	// totalCount
	public int totalCount(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne(MAPPER_NAME+"totalCount", map);
	}
	
}

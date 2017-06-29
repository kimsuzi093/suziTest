package com.moco.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moco.movieAPI.BasicMovieDTO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	private static final String NAMESPACE = "ReviewMapper.";
	
	//reviewCheck
	public ReviewDTO reviewCheck(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewCheck", reviewDTO);
	}
	// reviewSelectList
	public List<ReviewDTO> reviewSelectList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"reviewSelectList", map);
	}
	// reviewSelectOne
	public ReviewDTO reviewSelectOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewSelectOne", num);
	}
	// reviewInsert
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"reviewInsert", reviewDTO);
	}
	// reviewUpdate
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"reviewUpdate", reviewDTO);
	}
	// reviewDelete
	public int reviewDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"reviewDelete", num);
	}
	// reviewTotalCount
	public int reviewTotalCount(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewTotalCount", reviewDTO);
	}
	
	// reviewHuman
	public int reviewHuman(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewHuman", reviewDTO);
	}
	// reviewUserRating
	public List<Integer> reviewUserRating(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"reviewUserRating", reviewDTO);
	}
	// basicMovieUserRating
	public int basicMovieUserRating(BasicMovieDTO basicMovieDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"basicMovieUserRating", basicMovieDTO);
	}
	// lowPriceMovieUserRating
	/*public int lowPriceMovieUserRating(LowPriceMovieDTO lowPriceMovieDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"lowPriceMovieUserRating", lowPriceMovieDTO);
	}*/
	
}

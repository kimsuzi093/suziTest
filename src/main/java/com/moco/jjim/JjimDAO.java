package com.moco.jjim;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moco.movieAPI.BasicMovieDTO;

@Repository
public class JjimDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "JjimMapper.";
	
	// insert
	public int jjimInsert(JjimDTO jjimDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"jjimInsert", jjimDTO);
	}
	// delete
	public int jjimDelete(JjimDTO jjimDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"jjimDelete", jjimDTO);
	}
	// delete - 회원탈퇴 시
	public int jjimDeleteMember(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"jjimDeleteMember", id);
	}

	// jjimBnum
	public List<JjimDTO> jjimBnum(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"jjimBnum", id);
	}
	// jjimBasicOne
	public BasicMovieDTO jjimBasicOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"jjimBasicOne", num);
	}
	// jjimLnum
	public List<JjimDTO> jjimLnum(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"jjimLnum", id);
	}
	// jjimLowOne
	/*public LowPriceMovieDTO jjimLowOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"jjimLowOne", num);
	}*/
	// jjimCount
	public int jjimCount(int bnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"jjimCount");
	}
	
}

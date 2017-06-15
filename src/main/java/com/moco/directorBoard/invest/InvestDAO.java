package com.moco.directorBoard.invest;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class InvestDAO {
	@Inject
	SqlSession sqlSession;
	
	private final String MAPPER_NAME = "InvestMapper.";
	
	public int insert(InvestDTO investDTO) throws Exception{
		return sqlSession.insert(MAPPER_NAME+"insert", investDTO);
	}
	
	public int delete(InvestDTO investDTO) throws Exception{
		return sqlSession.delete(MAPPER_NAME+"delete", investDTO);
	}
	
	public int update(InvestDTO investDTO) throws Exception{
		return sqlSession.update(MAPPER_NAME+"update", investDTO);
	}
	
	public InvestDTO selectOne(InvestDTO investDTO) throws Exception{
		return sqlSession.selectOne(MAPPER_NAME+"selectOne", investDTO);
	}
	
	public List<InvestDTO> investorList(int pnum) throws Exception{
		return sqlSession.selectList(MAPPER_NAME+"investorList", pnum);
	}
	
	public int curPriceUpdate(InvestDTO investDTO) throws Exception{
		return sqlSession.update(MAPPER_NAME+"curPriceUpdate", investDTO);
	}
	
	public int reInvest(InvestDTO investDTO) throws Exception{
		return sqlSession.update(MAPPER_NAME+"reInvest", investDTO);
	}
	
	public int countInvestors() throws Exception{
		return sqlSession.selectOne(MAPPER_NAME+"countInvestors");
	}
	
	public int myInvestMoney(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne(MAPPER_NAME+"myInvestMoney", map);
	}
	
	public int avaliableLikesUpdate(Map<String, Object> map) throws Exception{
		return sqlSession.update(MAPPER_NAME+"avaliableLikesUpdate", map);
	}
	
	public List<InvestDTO> checkPnum(int pnum) throws Exception{
		return sqlSession.selectList(MAPPER_NAME+"checkPnum", pnum);
	}
	
	public int totalMoney(int pnum) throws Exception{
		return sqlSession.selectOne(MAPPER_NAME+"totalMoney", pnum);
	}
}

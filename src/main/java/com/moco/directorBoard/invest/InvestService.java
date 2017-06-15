package com.moco.directorBoard.invest;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class InvestService {
	@Inject
	InvestDAO investDAO;
	
	public int insert(InvestDTO investDTO) throws Exception{
		return investDAO.insert(investDTO);
	}
	
	public int delete(InvestDTO investDTO) throws Exception{
		return investDAO.delete(investDTO);
	}
	
	public int update(InvestDTO investDTO) throws Exception{
		return investDAO.update(investDTO);
	}
	
	public InvestDTO selectOne(InvestDTO investDTO) throws Exception{
		return investDAO.selectOne(investDTO);
	}
	
	public List<InvestDTO> investorList(int pnum) throws Exception{
		return investDAO.investorList(pnum);
	}
	
	public int curPriceUpdate(InvestDTO investDTO) throws Exception{
		return investDAO.curPriceUpdate(investDTO);
	}
	
	public int reInvest(InvestDTO investDTO) throws Exception{
		return investDAO.reInvest(investDTO);
	}
	
	public int countInvestors() throws Exception{
		return investDAO.countInvestors();
	}
	
	public int myInvestMoney(Map<String, Object> map) throws Exception{
		return investDAO.myInvestMoney(map);
	}
	
	public int avaliableLikesUpdate(Map<String, Object> map) throws Exception{
		return investDAO.avaliableLikesUpdate(map);
	}
	
	public List<InvestDTO> checkPnum(int pnum) throws Exception{
		return investDAO.checkPnum(pnum);
	}
	
	public int totalMoney(int pnum) throws Exception{
		return investDAO.totalMoney(pnum);
	}
}
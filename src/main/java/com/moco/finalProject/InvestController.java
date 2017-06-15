package com.moco.finalProject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moco.directorBoard.invest.InvestDTO;
import com.moco.directorBoard.invest.InvestService;
import com.moco.member.MemberDTO;

@Controller
public class InvestController {
	@Inject
	InvestService investService;
	
	@RequestMapping(value="/user/directorBoard/investInsert", method=RequestMethod.POST)
	public String investInsert(InvestDTO investDTO){
		int result = 0;
		try {
			result = investService.insert(investDTO);
			investService.curPriceUpdate(investDTO);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("kind", "investor");
			map.put("flag", "minus");
			map.put("money", investDTO.getMoney());
			map.put("id", investDTO.getId());
			investService.avaliableLikesUpdate(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:directorBoardView?num="+investDTO.getPnum();
	}
	
	@RequestMapping(value="/user/directorBoard/investorList", method=RequestMethod.GET)
	public void investorList(int pnum, Model model) {
		int countInvestors = 0;
		List<InvestDTO> investorList = new ArrayList<InvestDTO>();
		ArrayList<Map<String, Object>> ar = new ArrayList<Map<String,Object>>();
		try {
			countInvestors = investService.countInvestors(pnum);
			investorList = investService.investorList(pnum);
			for(InvestDTO investDTO : investorList){
				Map<String, Object> map = new HashMap<String, Object>();
				MemberDTO memberDTO = new MemberDTO();
				memberDTO = investService.investorInfo(investDTO.getId());
				map.put("memberDTO", memberDTO);
				map.put("money", investDTO.getMoney());
				ar.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(ar.size()==0){
			model.addAttribute("noList", "NO LIST");
		}
		model.addAttribute("countInvestors", countInvestors)
		.addAttribute("list", ar);
	}
}

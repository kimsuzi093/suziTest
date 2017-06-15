package com.moco.finalProject;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moco.directorBoard.invest.InvestDTO;
import com.moco.directorBoard.invest.InvestService;

@Controller
public class InvestController {
	@Inject
	InvestService investService;
	
	@RequestMapping(value="/user/directorBoard/investInsert", method=RequestMethod.POST)
	public String investInsert(InvestDTO investDTO){
		investDTO.setId("test_writer");
		int result = 0;
		try {
			result = investService.insert(investDTO);
			investService.curPriceUpdate(investDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:directorBoardView?num="+investDTO.getPnum();
	}
}

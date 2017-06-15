package com.moco.finalProject;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.moco.board.BoardDTO;
import com.moco.directorBoard.DirectorBoardDTO;
import com.moco.directorBoard.DirectorBoardService;
import com.moco.directorBoard.invest.InvestDTO;
import com.moco.directorBoard.invest.InvestService;
import com.moco.fileTest.FileSaver;

@Controller
@RequestMapping(value="/user/directorBoard/")
public class DirectorBoardController {
	@Inject
	DirectorBoardService directorBoardService;
	@Inject
	InvestService investService;
	
	// 양식 다운로드
	@RequestMapping(value="download")
	public ModelAndView fileDownload(String fileName, HttpSession session){
		String filepath = session.getServletContext().getRealPath("resources/upload/directorBoardUpload");
		File file = new File(filepath, fileName);
		ModelAndView mv = new ModelAndView("download", "downloadFile", file);
		return mv;
	}
	
	@RequestMapping(value="directorBoardList", method=RequestMethod.GET)
	public void listMain(){
		
	}

	@RequestMapping(value="directorBoardList_ajax", method=RequestMethod.GET)
	public void list(Model model, String chked_val, Integer chked_state, Integer sRow){
		List<BoardDTO> ar = new ArrayList<BoardDTO>();
		int totalCount = 0;
		int startRow = 0;
		int lastRow = 0;
		int state = 0;
		
		System.out.println("chked_val : "+ chked_val);
		System.out.println("chked_state :"+chked_state);
		System.out.println("sRow : "+sRow);
		System.out.println("----------------------------------------------");
		
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> genreList = new ArrayList<String>();
		
		// genre
		try{
			String[] checked_genre = chked_val.split(","); 
			for(int i=1; i<checked_genre.length; i++){
				genreList.add(checked_genre[i]);
			}
		}catch(Exception e){
			genreList.add("%");
			System.out.println("genre exception");
		}
		
		// state
		try{
			state = chked_state;
		}catch(Exception e){
			state = 2;
		}
		
		// row
		try{
			startRow = sRow;
			lastRow = startRow+2;
		}catch(Exception e){
			startRow = 1;
			lastRow = 3;
		}
		
		map.put("genreList", genreList);
		map.put("state", state);
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		
		System.out.println("genreList : "+genreList.get(0));
		System.out.println("state : "+state);
		System.out.println("startRow : "+startRow);
		System.out.println("lastRow : "+ lastRow);
		System.out.println("totalCount : "+totalCount);
		System.out.println("----------------------------");
		
		model.addAttribute("list", ar).addAttribute("lastRow", startRow+2)
		.addAttribute("totalCount", totalCount);
	}
	
	@RequestMapping(value="directorBoardWrite", method=RequestMethod.GET)
	public void writeForm(){
		
	}
	
	@RequestMapping(value="directorBoardWrite", method=RequestMethod.POST)
	public String write(DirectorBoardDTO directorBoardDTO, MultipartFile multipartFile,
			HttpSession session){
		FileSaver fileSaver = new FileSaver();
		String path = session.getServletContext().getRealPath("resources/upload/directorBoardUpload");
		
		int result = 0;
		try {
			directorBoardDTO.setFname(fileSaver.saver(multipartFile, path));
			directorBoardDTO.setOname(multipartFile.getOriginalFilename());
			result = directorBoardService.write(directorBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/directorBoard/directorBoardList";
	}
	
	@RequestMapping(value="directorBoardView", method=RequestMethod.GET)
	public void view(int num, Model model, HttpSession session){
		DirectorBoardDTO directorBoardDTO = null;
		int countInvestors = 0;
		int myInvestMoney = 0;
		try {
			directorBoardDTO = (DirectorBoardDTO) directorBoardService.view(num);
			countInvestors = investService.countInvestors();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", "suzi");
			map.put("pnum", num);
			myInvestMoney = investService.myInvestMoney(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("boardDTO", directorBoardDTO)
		.addAttribute("countInvestors", countInvestors)
		.addAttribute("myInvestMoney", myInvestMoney);
	}
}

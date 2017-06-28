package com.moco.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moco.member.MemberDTO;
import com.moco.util.PageMaker;
import com.moco.util.PageResult;
import com.moco.util.RowMaker;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	// DTO set
	public ReviewDTO reviewDTOSet(String boardKind, int boardNum) throws Exception{
		ReviewDTO reviewDTO = new ReviewDTO();
		if(boardKind.equals("basicMovie")){
			reviewDTO.setbNum(boardNum);
			reviewDTO.setlNum(0);
		}else{
			reviewDTO.setbNum(0);
			reviewDTO.setlNum(boardNum);
		}
		return reviewDTO;
	}
	
	// 페이징
	public PageResult pageing(Integer curPage, Integer perPage, String boardKind, int boardNum) throws Exception{
		// 페이징 처리
		PageMaker pageMaker = new PageMaker(curPage, perPage);
		// totalCount method를 호출 하기 위해서 ReviewDTO를 생성
		ReviewDTO reviewDTO = this.reviewDTOSet(boardKind, boardNum);
		int totalCount = this.reviewTotalCount(reviewDTO);
		System.out.println("ReviewService>> totalCount : "+totalCount);
		PageResult pageResult = pageMaker.paging(totalCount);
		return pageResult;
	}
	
	//reviewCheck
	public boolean reviewCheck(HttpSession session, String boardKind, int boardNum) throws Exception{
		// 후기를 안남겼다면 false, 남겼다면 true
		boolean check = false;
		// DTO 셋팅
		// bnum, lnum
		ReviewDTO reviewDTO = this.reviewDTOSet(boardKind, boardNum);
		// id
		String writer = ((MemberDTO)session.getAttribute("memberDTO")).getId();
		reviewDTO.setWriter(writer);
		
		// check!
		reviewDTO = reviewDAO.reviewCheck(reviewDTO);
		
		if(reviewDTO != null){
			check = !check;
		}
		
		return check;
	}
	
	// reviewSelectList
	public List<ReviewDTO> reviewSelectList(Integer curPage, String boardKind, int boardNum) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		// basicMovie인지 lowPriceMovie인지 판별
		if(boardKind.equals("basicMovie")){
			map.put("bNum", boardNum);
			map.put("lNum", 0);
		}else{
			map.put("bNum", 0);
			map.put("lNum", boardNum);
		}
		
		RowMaker rowMaker = new RowMaker();
		rowMaker.makeRow(curPage, 5);
		map.put("row", rowMaker);

		return reviewDAO.reviewSelectList(map);
	}
	// reviewSelectOne
	public ReviewDTO reviewSelectOne(int num) throws Exception{
		return reviewDAO.reviewSelectOne(num);
	}
	// reviewInsert
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.reviewInsert(reviewDTO);
	}
	// reviewUpdate
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.reviewUpdate(reviewDTO);
	}
	// reviewDelete
	public int reviewDelete(int num) throws Exception{
		return reviewDAO.reviewDelete(num);
	}
	// reviewTotalCount
	public int reviewTotalCount(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.reviewTotalCount(reviewDTO);
	}
}

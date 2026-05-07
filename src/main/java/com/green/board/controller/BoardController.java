package com.green.board.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.green.BoardApplication;
import com.green.board.dto.BoardDto;
import com.green.board.mapper.BoardMapper;
import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {

    private final BoardApplication boardApplication;
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private BoardMapper boardMapper;

    BoardController(BoardApplication boardApplication) {
        this.boardApplication = boardApplication;
    }
	
	// /Board/List?menu_id=MENU01
	@RequestMapping("/List")
	public  ModelAndView list( MenuDTO menuDto  ) {
		
		// 메뉴 전체목록 조회 - menus.jsp
		List<MenuDTO> menuList = menuMapper.getMenuList();
		System.out.println("menuList : " + menuList);
		
		// 게시물 목록 조회 - list.jsp
		List<BoardDto>  boardList  =  boardMapper.getBoardList( menuDto );
		
		ModelAndView  mv  =  new  ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("menuList", menuList);
		mv.addObject("bList", boardList);
		return  mv;
	}
	
	// /Board/View?idx=1
	@RequestMapping("/View")
	public ModelAndView view(BoardDto boardDto) {
		
		// 메뉴 목록 조회
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// idx 글의 조회수를 1 증가
		boardMapper.incHit(boardDto);
		
		
		// idx 로 조회한 게시글
		BoardDto board = boardMapper.getBoard(boardDto);
		System.out.println("board : " + board);
		// board : BoardDto [idx=3, menu_id=MENU01, title=JAVA2, writer=JAVA, regdate=2026-05-06 12:07:50, hit=0]
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("menuList", menuList);
		mv.addObject("board", board);
		
		return mv;
	}
	
	// /Board/WriteForm?menu_id=MENU01
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(BoardDto boardDto) {
		System.out.println("/Board/WriteForm 의 boardDto : " + boardDto);
		
		String menu_id = boardDto.getMenu_id();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/write");
		mv.addObject("menu_id", menu_id);
		return mv;
	}
	
	// /Board/Write?menu_id=MENU01&title=a&content=a&writer=a
	@RequestMapping("/Write")
	public ModelAndView write(BoardDto boardDto) {
		
		//db 저장
		String menu_id = boardDto.getMenu_id();
		
		// 페이지 이동
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		
		return mv;
	}
	
	
}












package com.study.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.study.springboot.dao.IBoardDao;
import com.study.springboot.dao.IClassLikeManagerDao;
import com.study.springboot.dao.IClassManagerDao;
import com.study.springboot.dao.IUserDao;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ClassLikeManagerDto;

@Service
public class MypageService implements IMypageService{
	@Autowired
	IUserDao userdao;
	@Autowired
	IBoardDao boarddao;
	@Autowired
	IClassManagerDao classdao;
	@Autowired
	IClassLikeManagerDao classlikedao;
	
	public ModelAndView goMypage() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;        
        String userid = userDetails.getUsername();
        
		ModelAndView mv=new ModelAndView();
		//회원정보조회
		mv.addObject("userinfo", userdao.getUserInfo(userid));	
		//신청한 클래스 개수
		mv.addObject("joinclass", classdao.countJoinClassDao(userid));
		//좋아요한 클래스 개수
		mv.addObject("likecount", classlikedao.userLikeCountCheckDao(userid));
		//개설한 클래스 개수
		mv.addObject("openclass", boarddao.countOpenClassDao(userid));
		
		mv.setViewName("mypage/mypage");
		
		return mv;
	}
	public ModelAndView getLikeClassInfo(){
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;        
        String userid = userDetails.getUsername();
		
		ModelAndView mv=new ModelAndView();
		
		List<ClassLikeManagerDto> list=new ArrayList<>();
		list=classlikedao.getLikeClassInfoDao(userid);
		System.out.println("좋아요 list: "+list);
		System.out.println("좋아요 list.size() : "+ list.size());
		
		List<BoardDto> classinfo=new ArrayList<BoardDto>();
		
		for(int i=0; i<list.size();i++ ) {
			classinfo.add(boarddao.getClassInfoDao(list.get(i).getClassid()));
		}
		System.out.println(classinfo);
		
		mv.addObject("likeclassinfo",classinfo);
		return mv;	
	}
	public ModelAndView getOpenClassInfo(){
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;        
        String userid = userDetails.getUsername();
		
		ModelAndView mv=new ModelAndView();

		mv.addObject("openclassinfo",boarddao.getOpenClassInfoDao(userid));
		return mv;	
	}
	
	public ModelAndView doDeleteClass(String tid) {
		int classid=Integer.parseInt(tid);
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("classinfo", boarddao.getClassInfoDao(classid));
		mv.addObject("memberinfo", classdao.getApplyMemberDao(classid));
		mv.addObject("countmem", classdao.countNowmemDao(classid));

		return mv;		
	}
}

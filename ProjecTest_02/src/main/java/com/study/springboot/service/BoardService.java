package com.study.springboot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.study.springboot.dao.IBoardDao;
import com.study.springboot.dao.IClassLikeManagerDao;
import com.study.springboot.dao.IClassManagerDao;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ClassManagerDto;
@Service
public class BoardService implements IBoardService{

	@Autowired
	IBoardDao boardDao;
	@Autowired
	IClassManagerDao classDao;
	@Autowired
	IClassLikeManagerDao classlikeDao;
	
	@Override
	public int countJoinClass() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;        
        String userid = userDetails.getUsername();
        
		int joinclass=classDao.countJoinClassDao(userid);
		return joinclass;
	}
	@Override
	public ModelAndView AllBoardInfo(){
		
		ModelAndView mv=new ModelAndView();
//		System.out.println(boardDao.AllBoardInfoDao());
		mv.addObject("rblist", boardDao.AllBoardInfoDao());
		
		return mv;
	}
	@Override
	public ModelAndView viewClassInfo(String tid){
		System.out.println("BS > viewClassInfo");
		int classid=Integer.parseInt(tid);
		
		ModelAndView mv=new ModelAndView();
		BoardDto dto=new BoardDto();
		dto=boardDao.viewClassInfoDao(classid);
		//클래스 신청 가능인원 구하기
		int memnum=dto.getTmemnum();
		int nownum=dto.getTnownum();
		System.out.println("memnum ; "+memnum+", nownum : "+nownum);
		
		int availnum=memnum-nownum;
		System.out.println("신청가능한 인원수 : "+ availnum);
		
		//클래스 가입 멤버 list 뽑아오기		???
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;        
        String userid = userDetails.getUsername();
        System.out.println("session userid: "+userid);
        
        Map<String, Object> map=new HashMap<String, Object>();
		map.put("classid", classid);
		map.put("userid", userid);
		int checkuser=classDao.getClassMemberDao(map);
		System.out.println("checkuser: "+checkuser +", session userid : "+userid);
		
		//클래스정 뽑아오기		
		ArrayList<ClassManagerDto> list = classDao.getClassInfo(classid);
		
		//lat, lon뽑아오기
		Double minLat = 500000.0;
		for(int i = 0; i < list.size(); i++)
		{
			Double lat = Double.parseDouble(list.get(i).getLat());
			if(lat<minLat)
				minLat = lat;
						
		}
		System.out.println(minLat);
		
		Double maxLat = 0.0;
		for(int i = 0; i < list.size(); i++)
		{
			Double lon = Double.parseDouble(list.get(i).getLat());
			if(lon>maxLat)
				maxLat= lon;
						
		}
		System.out.println(maxLat);
		
		Double minLon = 500000.0;
		for(int i = 0; i < list.size(); i++)
		{
			Double lat = Double.parseDouble(list.get(i).getLon());
			if(lat<minLon)
				minLon = lat;
						
		}
		System.out.println(minLon);
		
		Double maxLon = 0.0;
		for(int i = 0; i < list.size(); i++)
		{
			Double lon = Double.parseDouble(list.get(i).getLon());
			if(lon>maxLon)
				maxLon= lon;
						
		}
		System.out.println(maxLon);
		
		Double centerX = minLat + ((maxLat - minLat) / 2);
		Double centerY = minLon + ((maxLon - minLon) / 2);
		
		System.out.println(centerX + ", " + centerY);
		
		//좋아요 수 확인
		int likecount=classlikeDao.likeCountDao(classid);
		//userid 좋아요 여부 확인
		int likecheck=classlikeDao.likeCheckDao(classid, userid);
		System.out.println("좋아요 수 : "+likecount+", 좋아요 여부 : "+likecheck);
		
		mv.addObject("classinfo", dto);
		mv.addObject("availnum", availnum);
		mv.addObject("checkuser", checkuser);
		mv.addObject("list", list);
		mv.addObject("lat", centerX);
		mv.addObject("lon", centerY);
		mv.addObject("likecount", likecount);
		mv.addObject("likecheck", likecheck);
		mv.setViewName("view/contentview");
		
		return mv;
	}
	@Override
	public int meetUpWrite(String tUserID, String tCategory, String mName, String mTel, String mEmail, String title,
			String tIntro, String tContent, String tFile, String classStartDate, String classEndDate,
			String regStartDate, String regEndDate, String tSpaceType, String tSpace, String tMemnum, String tPayment, String tPrice) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;        
        tUserID = userDetails.getUsername();
        
		int nResult=boardDao.meetupwrite(tUserID, tCategory, mName, mTel, mEmail, title, tIntro, tContent, tFile, classStartDate,
				classEndDate, regStartDate, regEndDate, tSpaceType, tSpace, Integer.parseInt(tMemnum), tPayment, Integer.parseInt(tPrice));
		System.out.println("클래스 게시글 insert 결과 nResult: "+nResult);
		return nResult;
	}
	@Override
	public int fixaddress(String tid, String address) {
		boardDao.fixaddress(Integer.parseInt(tid), address);
		return 0;
	}

	
}

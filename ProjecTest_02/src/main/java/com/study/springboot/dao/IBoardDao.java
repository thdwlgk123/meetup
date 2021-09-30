package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ClassLikeManagerDto;
import com.study.springboot.dto.ClassManagerDto;

@Mapper
public interface IBoardDao {
	ArrayList<BoardDto> AllBoardInfoDao();
	BoardDto viewClassInfoDao(int tid);
	BoardDto getClassInfoDao(int tid);	
	public int addMemnumDao(int tid);
	public int deleteMemnumDao(int tid);
	ArrayList<BoardDto> getOpenClassInfoDao(String userid);
	public int countOpenClassDao(String userid);
	public int meetupwrite(String tUserID, String tCategory, String mName, String mTel, String mEmail, String title,
			String tIntro, String tContent, String tFile, String classStartDate, String classEndDate,
			String regStartDate, String regEndDate, String tSpaceType, String tSpace, int tMemnum, String tPayment, int tPrice);
	public int fixaddress(int tid, String address);
	public String checkManIdDao(int classid);
}

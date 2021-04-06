package com.pet.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.MyPageMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PointVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;

	@Override
	public BoardVO getBoard(String board_id) {
		log.info("getBoard()");
		return myPageMapper.getBoard(board_id);
	}

	@Override
	public PointVO getPoint(String member_id) {
		log.info("getPoint()");
		return myPageMapper.getPoint(member_id);
	}

}

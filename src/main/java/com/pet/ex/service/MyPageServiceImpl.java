package com.pet.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.MyPageMapper;
import com.pet.ex.vo.BoardVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;

	@Override
	public BoardVO getBoard(String board_id) {

		return myPageMapper.getBoard(board_id);
	}

}

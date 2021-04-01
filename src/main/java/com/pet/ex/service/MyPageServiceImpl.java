package com.pet.ex.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.MyPageMapper;
import com.pet.ex.vo.BoardVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper myPageMapper;

	@Override
	public BoardVO getBoard(int board_id) {

		return myPageMapper.getBoard(board_id);
	}

}

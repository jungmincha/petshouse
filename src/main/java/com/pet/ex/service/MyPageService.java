package com.pet.ex.service;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PointVO;

public interface MyPageService {

	BoardVO getBoard(String board_id);

	PointVO getPoint(String member_id);

}

package com.pet.ex.service;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.MyhomeMapper;

import com.pet.ex.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class MyhomeServiceImpl implements MyhomeService {

	private MyhomeMapper mapper;

	@Override
	public MemberVO getNicknameInfo(String nickname) {

		return mapper.getNicknameInfo(nickname);
	}

	@Override
	public MemberVO getUser(String nickname) {

		return mapper.getUser(nickname);
	}

}

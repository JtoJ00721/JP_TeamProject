package com.biz.big.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.biz.big.model.IoVO;

@Service
@Qualifier("ioServV1")
public class IoServiceImplV1 implements IoService{

	@Override
	public List<IoVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public IoVO findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(IoVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(IoVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public IoVO selectByProductName(String productName) {
		// TODO Auto-generated method stub
		return null;
	}

}

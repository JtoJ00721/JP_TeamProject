package com.biz.big.service;

import java.util.List;

import com.biz.big.model.IoVO;

public interface IoService extends GenericService<IoVO, Long> {

	public List<IoVO> allIn();

	public List<IoVO> allOut();

}

package com.biz.big.service;

import com.biz.big.model.IoVO;

public interface IoService extends GenericService<IoVO, Long> {
	
	public IoVO selectByProductName(String productName);
	
}

package com.biz.big.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.biz.big.mapper.ProductDao;
import com.biz.big.model.ProductVO;

@Service
@Qualifier("productServV1")
public class ProductServiceImplV1 implements ProductService{
	
	@Autowired
	private ProductDao proDao;

	@Override
	public List<ProductVO> selectAll() {
		return proDao.selectAll();
	}

	@Override
	public ProductVO findById(String id) {
		return proDao.findById(id);
	}

	@Override
	public int insert(ProductVO vo) {
		int ret = proDao.insert(vo);
		return ret;
	}

	@Override
	public int update(ProductVO vo) {
		int ret = proDao.update(vo);
		return ret;
	}

	@Override
	public int delete(String id) {
		int ret = proDao.delete(id);
		return ret;
	}

	public String getNextNum() {
		String p_seq = (String)proDao.getNextNum();
		long long_p_seq = Long.valueOf(p_seq);
		
		String return_p_seq = "P" + String.format("%012d", long_p_seq);
		return return_p_seq;
	}

}

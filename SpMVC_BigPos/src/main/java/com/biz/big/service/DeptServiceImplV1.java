package com.biz.big.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.biz.big.mapper.DeptDao;
import com.biz.big.model.DeptVO;

@Service
@Qualifier("deptServV1")
public class DeptServiceImplV1 implements DeptService {

	@Autowired
	private DeptDao deptDao;

	@Override
	public List<DeptVO> selectAll() {
		return deptDao.selectAll();
	}

	@Override
	public DeptVO findById(String id) {
		return deptDao.findById(id);
	}

	@Override
	public int insert(DeptVO vo) {
		int ret = deptDao.insert(vo);
		return ret;
	}

	@Override
	public int update(DeptVO vo) {
		int ret = deptDao.update(vo);
		return ret;
	}

	@Override
	public int delete(String id) {
		int ret = deptDao.delete(id);
		return ret;
	}

	@Override
	public String getNextNum() {
		String seq = (String)deptDao.getNextNum();
		long long_seq = Long.valueOf(seq);
		String return_seq = "D" + String.format("%04d", long_seq);
		
		return return_seq;
	}

}

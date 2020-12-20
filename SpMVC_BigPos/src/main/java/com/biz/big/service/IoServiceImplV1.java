package com.biz.big.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.biz.big.mapper.IoDao;
import com.biz.big.model.IoVO;

@Service
@Qualifier("ioServV1")
public class IoServiceImplV1 implements IoService {

	@Autowired
	private IoDao ioDao;

	@Override
	public List<IoVO> selectAll() {

		return ioDao.selectAll();
	}

	@Override
	public IoVO findById(Long id) {

		ioDao.findById(id);
		return null;
	}

	@Override
	public int insert(IoVO vo) {

		int ret = ioDao.insert(vo);
		return ret;
	}

	@Override
	public int update(IoVO vo) {

		int ret = ioDao.update(vo);
		return ret;
	}

	@Override
	public int delete(Long id) {

		int ret = ioDao.delete(id);
		return ret;
	}

	@Override
	public List<IoVO> allIn() {
		return ioDao.AllIn();
	}

	@Override
	public List<IoVO> allOut() {
		return ioDao.allOut();
	}

}

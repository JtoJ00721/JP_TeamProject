package com.biz.big.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.biz.big.model.IoVO;

public interface IoDao extends GenericDao<IoVO, Long> {

	@Override
	@Select("SELECT * FROM tbl_iolist")
	public List<IoVO> selectAll();

	@Override
	@Select("SELECT * FROM tbl_iolist WHERE io_seq = #{id}")
	public IoVO findById(Long id);

	@Override
	@Delete("DELETE FROM tbl_iolist WHERE io_seq = #{id}")
	public int delete(Long id);

	public IoVO selectByProductName(String productName);

}

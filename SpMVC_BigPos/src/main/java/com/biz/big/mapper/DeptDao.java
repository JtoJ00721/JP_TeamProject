package com.biz.big.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.biz.big.model.DeptVO;

public interface DeptDao extends GenericDao<DeptVO, String>{

	@Override
	@Select("SELECT * FROM tbl_dept")
	public List<DeptVO> selectAll();

	@Override
	@Select("SELECT * FROM tbl_dept WHERE d_code = #{id}")
	public DeptVO findById(String id);

	@Override
	@Delete("DELETE FROM tbl_dept WHERE d_code = #{id}")
	public int delete(String id);

}

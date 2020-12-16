package com.biz.big.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.biz.big.model.IoVO;
import com.biz.big.sql.IoSQL;

public interface IoDao extends GenericDao<IoVO, Long> {

	@Override
	@Select("SELECT * FROM tbl_iolist ORDER BY io_seq DESC")
	public List<IoVO> selectAll();

	@Override
	@Select("SELECT * FROM tbl_iolist WHERE io_seq = #{id}")
	public IoVO findById(Long id);

	@Override
	@Delete("DELETE FROM tbl_iolist WHERE io_seq = #{id}")
	public int delete(Long id);

	@SelectProvider(type = IoSQL.class, method = "allIn")
	public List<IoVO> AllIn();

	@SelectProvider(type = IoSQL.class, method = "selectInByProduct")
	public List<IoVO> selectInByProduct(String pcode);

	@SelectProvider(type = IoSQL.class, method = "allOut")
	public List<IoVO> allOut();

	@SelectProvider(type = IoSQL.class, method = "selectOutByProduct")
	public List<IoVO> selectOutByProduct(String pcode);

}

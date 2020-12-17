package com.biz.big.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.biz.big.model.ProductVO;

public interface ProductDao extends GenericDao<ProductVO, String> {

	@Override
	@Select("SELECT * FROM tbl_product")
	public List<ProductVO> selectAll();

	@Override
	@Select("SELECT * FROM tbl_product WHERE p_code = #{id}")
	public ProductVO findById(String id);
	
	@Select("SELECT seq_p.NEXTVAL FROM DUAL")
	public String getNextNum();

	@Override
	@Delete("DELETE FROM tbl_product WHERE p_code = #{id}")
	public int delete(String id);

}

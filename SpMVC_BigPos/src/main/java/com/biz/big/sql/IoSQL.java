package com.biz.big.sql;

import org.apache.ibatis.jdbc.SQL;

public class IoSQL {

	public String allIn() {

		SQL sql = new SQL();
		sql.SELECT("*").FROM("tbl_iolist").WHERE("io_inout = '1'");
		return sql.toString();
	}

	public String selectInByProduct() {

		SQL sql = new SQL();
		sql.SELECT("*").FROM("tbl_iolist").WHERE("io_inout = '1' AND io_dcode = #{dcode}");
		return sql.toString();
	}

	public String allOut() {

		SQL sql = new SQL();
		sql.SELECT("*").FROM("tbl_iolist").WHERE("io_inout = '2'");
		return sql.toString();
	}

	public String selectOutByProduct() {

		SQL sql = new SQL();
		sql.SELECT("*").FROM("tbl_iolist").WHERE("io_inout = '2' AND io_dcode = #{dcode}");
		return sql.toString();
	}

}

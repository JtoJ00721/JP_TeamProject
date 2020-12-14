package com.biz.big.model;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductVO {

	private String p_code;
	private String p_name;
	private String p_item;
	private String p_menuf;
	private String p_dcode;
	private String p_vat;
	private long p_iprice;
	private long p_oprice;
}

package com.biz.big.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class IoVO {
	private long io_seq;
	private String io_date;
	private String io_time;
	private String io_dcode;
	private String io_inout;
	private String io_pcode;
	private String io_vat;
	private long io_qty;
	private long io_price;
	private long io_amt;
	private long io_tax;
	private long io_total;
}

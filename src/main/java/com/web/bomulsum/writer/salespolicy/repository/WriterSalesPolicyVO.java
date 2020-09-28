package com.web.bomulsum.writer.salespolicy.repository;

public class WriterSalesPolicyVO {
	private String writerPayment;
	private int writerSendPrice;
	private int writerPlusPrice;
	private String writerSendfreeCase;
	private String writerRefund;
	private String writerPolicyAbout;
	private String writerCodeSeq;
	
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}

	public String getWriterPayment() {
		return writerPayment;
	}
	public void setWriterPayment(String writerPayment) {
		this.writerPayment = writerPayment;
	}
	public int getWriterSendPrice() {
		return writerSendPrice;
	}
	public void setWriterSendPrice(int writerSendPrice) {
		this.writerSendPrice = writerSendPrice;
	}
	public int getWriterPlusPrice() {
		return writerPlusPrice;
	}
	public void setWriterPlusPrice(int writerPlusPrice) {
		this.writerPlusPrice = writerPlusPrice;
	}
	public String getWriterSendfreeCase() {
		return writerSendfreeCase;
	}
	public void setWriterSendfreeCase(String writerSendfreeCase) {
		this.writerSendfreeCase = writerSendfreeCase;
	}
	public String getWriterRefund() {
		return writerRefund;
	}
	public void setWriterRefund(String writerRefund) {
		this.writerRefund = writerRefund;
	}
	public String getWriterPolicyAbout() {
		return writerPolicyAbout;
	}
	public void setWriterPolicyAbout(String writerPolicyAbout) {
		this.writerPolicyAbout = writerPolicyAbout;
	}
	@Override
	public String toString() {
		return "WriterSalesPolicyVO [writerCodeSeq=" + writerCodeSeq + ", writerPayment=" + writerPayment
				+ ", writerSendPrice=" + writerSendPrice + ", writerPlusPrice=" + writerPlusPrice
				+ ", writerSendfreeCase=" + writerSendfreeCase + ", writerRefund=" + writerRefund
				+ ", writerPolicyAbout=" + writerPolicyAbout + "]";
	}


	
}

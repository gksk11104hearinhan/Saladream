package saladream;

public class SelCustomDTO {

	private int scNo;
	private String  scStep01,  scStep02, scStep03, scStep04, scStep05, scStep06;


	public int getScNo() {
		return scNo;
	}

	public void setScNo(int scNo) {
		this.scNo = scNo;
	}

	public String getScStep01() {
		return scStep01;
	}

	public void setScStep01(String scStep01) {
		this.scStep01 = scStep01;
	}

	public String getScStep02() {
		return scStep02;
	}

	public void setScStep02(String scStep02) {
		this.scStep02 = scStep02;
	}

	public String getScStep03() {
		return scStep03;
	}

	public void setScStep03(String scStep03) {
		this.scStep03 = scStep03;
	}

	public String getScStep04() {
		return scStep04;
	}

	public void setScStep04(String scStep04) {
		this.scStep04 = scStep04;
	}

	public String getScStep05() {
		return scStep05;
	}

	public void setScStep05(String scStep05) {
		this.scStep05 = scStep05;
	}

	public String getScStep06() {
		return scStep06;
	}

	public void setScStep06(String scStep06) {
		this.scStep06 = scStep06;
	}

	@Override
	public String toString() {
		return "SelCustomDTO [scNo=" + scNo + ", scStep01=" + scStep01 + ", scStep02=" + scStep02 + ", scStep03="
				+ scStep03 + ", scStep04=" + scStep04 + ", scStep05=" + scStep05 + ", scStep06=" + scStep06 + "]";
	}
	
	
	
}

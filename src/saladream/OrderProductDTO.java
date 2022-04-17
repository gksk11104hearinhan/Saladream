package saladream;

public class OrderProductDTO {

	private String ono;
	private String pno;
	private int oproductNum;
	
	public OrderProductDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderProductDTO(String ono, String pno, int oproductNum) {
		super();
		this.ono = ono;
		this.pno = pno;
		this.oproductNum = oproductNum;
	}
	
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public int getOproductNum() {
		return oproductNum;
	}
	public void setOproductNum(int oproductNum) {
		this.oproductNum = oproductNum;
	}

	@Override
	public String toString() {
		return "OrderProductDTO [ono=" + ono + ", pno=" + pno + ", oproductNum=" + oproductNum + "]";
	}
	
	
}

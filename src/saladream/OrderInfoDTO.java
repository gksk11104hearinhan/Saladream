package saladream;

public class OrderInfoDTO {

	private String ono;
	private String id;
	private String odate;
	private String ordrecv;
	private String ordrecvaddr;
	private String ordrecvtel01, ordrecvtel02;
	private int opay;
	private String obank;
	private String ocardNum;
	private String ocardPassword;
	
	public OrderInfoDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getOrdrecv() {
		return ordrecv;
	}
	public void setOrdrecv(String ordrecv) {
		this.ordrecv = ordrecv;
	}
	public String getOrdrecvaddr() {
		return ordrecvaddr;
	}
	public void setOrdrecvaddr(String ordrecvaddr) {
		this.ordrecvaddr = ordrecvaddr;
	}
	public String getOrdrecvtel01() {
		return ordrecvtel01;
	}
	public void setOrdrecvtel01(String ordrecvtel01) {
		this.ordrecvtel01 = ordrecvtel01;
	}
	public String getOrdrecvtel02() {
		return ordrecvtel02;
	}
	public void setOrdrecvtel02(String ordrecvtel02) {
		this.ordrecvtel02 = ordrecvtel02;
	}
	
	public String getObank() {
		return obank;
	}
	public void setObank(String obank) {
		this.obank = obank;
	}
	public String getOcardNum() {
		return ocardNum;
	}
	public void setOcardNum(String ocardNum) {
		this.ocardNum = ocardNum;
	}
	public String getOcardPassword() {
		return ocardPassword;
	}
	public void setOcardPassword(String ocardPassword) {
		this.ocardPassword = ocardPassword;
	}

	public int getOpay() {
		return opay;
	}

	public void setOpay(int opay) {
		this.opay = opay;
	}

	public OrderInfoDTO(String ono, String id, String odate, String ordrecv, String ordrecvaddr, String ordrecvtel01,
			String ordrecvtel02, int opay, String obank, String ocardNum, String ocardPassword) {
		super();
		this.ono = ono;
		this.id = id;
		this.odate = odate;
		this.ordrecv = ordrecv;
		this.ordrecvaddr = ordrecvaddr;
		this.ordrecvtel01 = ordrecvtel01;
		this.ordrecvtel02 = ordrecvtel02;
		this.opay = opay;
		this.obank = obank;
		this.ocardNum = ocardNum;
		this.ocardPassword = ocardPassword;
	}

	@Override
	public String toString() {
		return "OrderInfoDTO [ono=" + ono + ", id=" + id + ", odate=" + odate + ", ordrecv=" + ordrecv
				+ ", ordrecvaddr=" + ordrecvaddr + ", ordrecvtel01=" + ordrecvtel01 + ", ordrecvtel02=" + ordrecvtel02
				+ ", opay=" + opay + ", obank=" + obank + ", ocardNum=" + ocardNum + ", ocardPassword=" + ocardPassword
				+ "]";
	}
	
	
}

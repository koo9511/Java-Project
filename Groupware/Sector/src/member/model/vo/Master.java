package member.model.vo;

public class Master {
	private int masterComNo;
	private String masterId;
	private String masterPwd;
	private String masterName;
	private String masterComName;
//	private String masterNo;
	private String masterPhone;
	private String masterEmail;
	private String master;
	
	private static final long serialVersionUID = 1000L;
	
	public Master() {}

	public Master(int masterComNo, String masterId, String masterPwd, String masterName, String masterComName,
			String masterNo, String masterPhone, String masterEmail, String master) {
		super();
		this.masterComNo = masterComNo;
		this.masterId = masterId;
		this.masterPwd = masterPwd;
		this.masterName = masterName;
		this.masterComName = masterComName;
//		this.masterNo = masterNo;
		this.masterPhone = masterPhone;
		this.masterEmail = masterEmail;
		this.master = master;
	}

	public int getMasterComNo() {
		return masterComNo;
	}

	public void setMasterComNo(int masterComNo) {
		this.masterComNo = masterComNo;
	}

	public String getMasterId() {
		return masterId;
	}

	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}

	public String getMasterPwd() {
		return masterPwd;
	}

	public void setMasterPwd(String masterPwd) {
		this.masterPwd = masterPwd;
	}

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	public String getMasterComName() {
		return masterComName;
	}

	public void setMasterComName(String masterComName) {
		this.masterComName = masterComName;
	}

//	public String getMasterNo() {
//		return masterNo;
//	}
//
//	public void setMasterNo(String masterNo) {
//		this.masterNo = masterNo;
//	}

	public String getMasterPhone() {
		return masterPhone;
	}

	public void setMasterPhone(String masterPhone) {
		this.masterPhone = masterPhone;
	}

	public String getMasterEmail() {
		return masterEmail;
	}

	public void setMasterEmail(String masterEmail) {
		this.masterEmail = masterEmail;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Master [masterComNo=" + masterComNo + ", masterId=" + masterId + ", masterPwd=" + masterPwd
				+ ", masterName=" + masterName + ", masterComName=" + masterComName + ", masterPhone=" + masterPhone + ", masterEmail=" + masterEmail + ", master=" + master + "]";
	}
	
	
}
//MASTER_COM_NO
//MASTER_ID
//MASTER_PWD
//MASTER_NAME
//MASTER_COM_NAME
//MASTER_NO
//MASTER_PHONE
//MASTER_EMAIL
//MASTER
package registration.model;

public class RegistrationDTO {

	private String membership_email;
	private String membership_password;
	private String membership_salt;
	private String membership_another_name;
	private String membership_point;
	private String membership_loss_email;
	private String remark;

	public String getMembership_email() {
		return membership_email;
	}

	public void setMembership_email(String membership_email) {
		this.membership_email = membership_email;
	}

	public String getMembership_password() {
		return membership_password;
	}

	public void setMembership_password(String membership_password) {
		this.membership_password = membership_password;
	}

	public String getMembership_salt() {
		return membership_salt;
	}

	public void setMembership_salt(String membership_salt) {
		this.membership_salt = membership_salt;
	}

	public String getMembership_another_name() {
		return membership_another_name;
	}

	public void setMembership_another_name(String membership_another_name) {
		this.membership_another_name = membership_another_name;
	}

	public String getMembership_point() {
		return membership_point;
	}

	public void setMembership_point(String membership_point) {
		this.membership_point = membership_point;
	}

	public String getMembership_loss_email() {
		return membership_loss_email;
	}

	public void setMembership_loss_email(String membership_loss_email) {
		this.membership_loss_email = membership_loss_email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}

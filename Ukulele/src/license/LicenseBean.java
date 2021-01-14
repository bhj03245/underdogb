package license;

public class LicenseBean {
	private String name;
	private String tel;
	private String license_email;
	private String license_id;
	@Override
	public String toString() {
		return "LicenseBean [name=" + name + ", tel=" + tel + ", license_email=" + license_email + ", license_id="
				+ license_id + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLicense_email() {
		return license_email;
	}
	public void setLicense_email(String license_email) {
		this.license_email = license_email;
	}
	public String getLicense_id() {
		return license_id;
	}
	public void setLicense_id(String license_id) {
		this.license_id = license_id;
	}
}

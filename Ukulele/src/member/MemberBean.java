package member;

public class MemberBean {
	private String id;
	private String pw;
	private String email;
	private int trackingProgress;
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", email=" + email + ", trackingProgress=" + trackingProgress
				+ "]";
	}
	public int getTrackingProgress() {
		return trackingProgress;
	}
	public void setTrackingProgress(int trackingProgress) {
		this.trackingProgress = trackingProgress;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}

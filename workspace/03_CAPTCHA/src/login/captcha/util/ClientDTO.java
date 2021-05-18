package login.captcha.util;

public class ClientDTO {

	private String id;
	private String pw;
	
	public ClientDTO() { }
	public ClientDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
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
	
}

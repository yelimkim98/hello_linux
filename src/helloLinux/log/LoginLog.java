package helloLinux.log;

import java.sql.Date;

public class LoginLog {
	private String email;
	private Date date;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
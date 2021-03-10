package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class Wrapper extends HttpServletRequestWrapper {

	public Wrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String getParameter(String key) {
		String value="";
		
		if(key != null && key.equals("userpwd")) {
			value = super.getParameter("userpwd");
			value = getSha512(value);
		}
		else {
			value = super.getParameter(key);
		}
		return value;
	}


	public static String getSha512(String userpwd) {
		String encPwd = "";
		
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch(Exception e) { 
			e.printStackTrace(); 
		}
		
		byte[] bytes = userpwd.getBytes(Charset.forName("UTF-8"));
		
		md.update(bytes);
		
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		return encPwd;
	}

}

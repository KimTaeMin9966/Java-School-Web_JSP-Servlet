package util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	public Cookie getCookie(String id) {
		return cookieMap.get(id);
	}
	
	public String getValue(String id) throws UnsupportedEncodingException {
		Cookie cookie = cookieMap.get(id);
		if (cookie != null) {
			return URLDecoder.decode(cookie.getValue(), "UTF-8");
		} else {
			return null;
		}
	}
	
	public static Cookie createCookie(String id, String value, int maxAge) {
		Cookie cookie = new Cookie(id, value);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	public void removeCookie(String id, HttpServletRequest req, HttpServletResponse res) {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = new Cookie(id, "");
				cookie.setMaxAge(0);
				res.addCookie(cookie);
				cookieMap.remove(id);
			}
		}
	}

	public boolean exists(String id) {
		return cookieMap.get(id) != null;
	}
	
}

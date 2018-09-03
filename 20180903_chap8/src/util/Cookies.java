package util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
	
	Map<String, Cookie> cookieMap = new HashMap<>();
	
	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
				
			}
		}
	}
	
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	public String getValue(String name) throws UnsupportedEncodingException {
		Cookie cookie = cookieMap.get(name);
		if(cookie == null) {
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "UTF-8");
	}
	
	public boolean exists(String name) {
		return cookieMap.get(name) != null;
	}
	
	public static Cookie createCookie(String name, String value) throws UnsupportedEncodingException {
		return new Cookie(name, URLEncoder.encode(value, "UTF-8"));
	}
	
	public static Cookie createCookie(String name, String value, int maxAge) throws UnsupportedEncodingException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
}

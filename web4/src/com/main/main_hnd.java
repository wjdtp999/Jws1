package com.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface main_hnd {
	public abstract String action(
			HttpServletRequest request,
			HttpServletResponse response);
}

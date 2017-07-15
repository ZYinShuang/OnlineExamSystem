package com.jereh.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
/**
 * 统一异常处理
 * @author Administrator
 *
 */
public class HandlerException implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		// TODO Auto-generated method stub
		//定位到一个新页面
		ModelAndView view=new ModelAndView();
		view.setViewName("excep");
		ex.printStackTrace();
		return view;
	}

}

package com.test.util;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.test.model.User;

public class logininter extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {

		Map session = (Map) arg0.getInvocationContext().getSession();
		User user = (User) session.get("user");
		if (user == null) {
			Map request = (Map) arg0.getInvocationContext().get("request");
			request.put("msg", "请先登录");
			return Action.LOGIN;
		}

		return arg0.invoke();
	}

}

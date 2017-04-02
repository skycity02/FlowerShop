package com.test.util;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.test.action.userAction;
import com.test.dao.impl.UserDAO;
import com.test.model.Guashi;
import com.test.service.IUserService;
import com.test.service.impl.UserService;

public class guashiInter extends AbstractInterceptor {

	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub

		userAction userAction = (com.test.action.userAction) arg0.getAction();

		String username = userAction.getUser().getUsername();

		List list = userService.getGuashi();
		for (int i = 0; i < list.size(); i++) {
			if (((Guashi) list.get(i)).getUser().getUsername().equals(username))

			{
				System.out.println(((Guashi) list.get(i)).getUser().getUsername());
				Map request = (Map) arg0.getInvocationContext().get("request");
				request.put("msg", "对不起，您的账号已挂失！！");
				System.out.println("sorry");
				return Action.ERROR;

			}

		}

		return arg0.invoke();
	}

}

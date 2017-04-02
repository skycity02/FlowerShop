package com.test.service.impl;

import java.util.List;

import com.test.dao.IUserDAO;
import com.test.model.User;
import com.test.service.IUserService;

public class UserService implements IUserService {
private IUserDAO userDAO;

public IUserDAO getUserDAO() {
	return userDAO;
}

public void setUserDAO(IUserDAO userDAO) {
	this.userDAO = userDAO;
}

public boolean addOrUpdateUser(User user) {
	// TODO Auto-generated method stub
	return userDAO.addOrUpdateUser(user);
}
public User checkUser(User user) {
	// TODO Auto-generated method stub
	return userDAO.checkUser(user);
}
public boolean guashiUser(int id) {
	// TODO Auto-generated method stub
	return userDAO.guashiUser(id);
}

@Override
public boolean jieguaUser(int id) {
	// TODO Auto-generated method stub
	return userDAO.jieguaUser(id);
}
public List getGuashi() {
	// TODO Auto-generated method stub
	return userDAO.getGuashi();
}
}

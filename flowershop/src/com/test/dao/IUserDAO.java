package com.test.dao;

import java.util.List;

import com.test.model.User;

public interface IUserDAO {

	public boolean addOrUpdateUser(User user);
	public User checkUser(User user);
	public boolean guashiUser(int id);
	public boolean jieguaUser(int id);
	public List getGuashi();
}

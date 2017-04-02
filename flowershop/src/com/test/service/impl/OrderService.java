package com.test.service.impl;


import com.test.dao.IOrderDAO;
import com.test.dao.impl.OrderDAO;
import com.test.model.Orders;
import com.test.service.IOrderService;

public class OrderService implements IOrderService{
private IOrderDAO orderDAO;

	
	public IOrderDAO getOrderDAO() {
	return orderDAO;
}


public void setOrderDAO(IOrderDAO orderDAO) {
	this.orderDAO = orderDAO;
}


	@Override
	public Orders saveOrder(Orders order) {
		// TODO Auto-generated method stub
		return orderDAO.saveOrder(order);
	}

}

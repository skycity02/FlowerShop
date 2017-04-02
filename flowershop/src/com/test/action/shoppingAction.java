package com.test.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.test.model.Flower;
import com.test.model.Orderitem;
import com.test.service.IFlowerService;
import com.test.service.impl.FlowerService;
import com.test.tool.Cart;

public class shoppingAction extends ActionSupport {
	private int id;
	private int quantity;
	private IFlowerService flowerService;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public IFlowerService getFlowerService() {
		return flowerService;
	}

	public void setFlowerService(IFlowerService flowerService) {
		this.flowerService = flowerService;
	}

	public String addToCart() throws Exception {
		Flower flower = flowerService.getFlowerById(id);
		Orderitem orderitem = new Orderitem();
		orderitem.setFlower(flower);
		orderitem.setQuantity(quantity);
		Map session = (Map) ActionContext.getContext().getSession();

		Cart cart = (Cart) session.get("cart");
		if (cart == null)
			cart = new Cart();
		cart.addFlower(id, orderitem);
		session.put("cart", cart);
		// System.out.println(cart.getItems().size());
		return SUCCESS;
	}

	public String updateCart() throws Exception {
		Map session = (Map) ActionContext.getContext().getSession();

		Cart cart = (Cart) session.get("cart");
		cart.updateCart(id, quantity);
		session.put("cart", cart);
		return SUCCESS;
	}

	public String checkout() throws Exception {
		Map session = (Map) ActionContext.getContext().getSession();

		Cart cart = (Cart) session.get("cart");
		cart.updateCart(id, quantity);
		session.put("cart", cart);
		return SUCCESS;
	}
}

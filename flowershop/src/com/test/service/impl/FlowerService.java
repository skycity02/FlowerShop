package com.test.service.impl;

import java.util.List;

import com.test.dao.IFlowerDAO;
import com.test.model.Flower;
import com.test.service.IFlowerService;

public class FlowerService implements IFlowerService {
	
	private IFlowerDAO flowerDAO;
	
	
	public IFlowerDAO getFlowerDAO() {
		return flowerDAO;
	}


	public void setFlowerDAO(IFlowerDAO flowerDAO) {
		this.flowerDAO = flowerDAO;
	}


	public List getNewFlower() {
		// TODO Auto-generated method stub
		return flowerDAO.getNewFlower();
	}

	public List getFlowerByCatalogidPaging(int catalogid, int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		return flowerDAO.getFlowerByCatalogidPaging(catalogid, currentPage, pageSize);
	}
	public int getTotalByCatalog(int catalogid){
		
		return flowerDAO.getTotalByCatalog(catalogid);
	}
	public Flower getFlowerById(int id) {
		// TODO Auto-generated method stub
		return flowerDAO.getFlowerById(id);
	}
	public boolean addOrUpdateFlower(Flower flower) {
		// TODO Auto-generated method stub
		return flowerDAO.addOrUpdateFlower(flower);
	}
	public List getAllFlower() {
		// TODO Auto-generated method stub
		return flowerDAO.getAllFlower();
	}
	public boolean deleteFlowerById(int id) {
		// TODO Auto-generated method stub
		return flowerDAO.deleteFlowerById(id);
	}
}

package com.test.dao;

import java.util.List;

public interface IFlowerDAO {
	
	public List getNewFlower();
	public List getFlowerByCatalogidPaging(int catalogid,int currentPage,int pageSize);
	public int getTotalByCatalog(int catalogid);
}

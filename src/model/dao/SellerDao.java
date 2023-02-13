package model.dao;

import java.util.List;

import model.entities.Seller;
import model.entities.Seller;

public interface SellerDao {

	void insert(Seller obj);
	void update(Seller obj);
	void deleById(Integer id);
	List<Seller> findAll();
	Seller findById(Integer id);
	
	
}

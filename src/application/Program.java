package application;

import java.util.Date;
import java.util.List;
import java.util.Scanner;

import model.dao.DaoFactory;
import model.dao.SellerDao;
import model.entities.Department;
import model.entities.Seller;

public class Program {

	public static void main(String[] args) {
		
		
		
		SellerDao sellerDao = DaoFactory.createSellerDao();
	
		
			System.out.println("Rodando seller findbyId");
			Seller seller = new Seller();
			seller = sellerDao.findById(3);
			System.out.println(seller);
			
			System.out.println("Rodando seller findbyDepartment");
			Department department = new Department(2, null);
			List<Seller> list = sellerDao.findByDepartment(department);
			for(Seller obj : list) {
				System.out.println(obj);
			}
		
			System.out.println("Rodando teste 3,  seller findAll");
			list = sellerDao.findAll();
			for(Seller obj : list) {
				System.out.println(obj);
			}
			System.out.println("Rodando teste 4,  seller findAll");
			Seller sel = new Seller(null,"ELi","ELi@gmail.com",new Date(), 400.0, department);
			sellerDao.insert(sel);
			System.out.println(sel.getId());
			
			seller = sellerDao.findById(1);
			seller.setName("MArtha waine");
			sellerDao.update(seller);
			System.out.println("Update completed");
			
			System.out.println("Rodando teste 6,  seller findAll");
			System.out.println("id");
			Scanner ler = new Scanner(System.in);
			int id = ler.nextInt();
			sellerDao.deleById(id);
			System.out.println("DELETE");
				
			}
			
			
	}



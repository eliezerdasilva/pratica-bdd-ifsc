package model.dao;

import java.util.List;

import model.entities.Department;

public interface DepartmentDao {
	
	void insert(Department obj);
	void update(Department obj);
	void deleById(Integer id);
	Department findByIf(Integer id);
	List<Department> findAll();
	
	

}

package com.web.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.SupplierDao;
import com.web.domain.Customer;
import com.web.domain.CustomerDeliveryContact;
import com.web.domain.Supplier;
import com.web.exception.ParameterException;

@Service
public class SupplierService {
	Logger log = Logger.getLogger(SupplierService.class);

	@Autowired
	private SupplierDao supplierDao;
	
	public List loadSupplierList() {
		return supplierDao.fetchSupplierList();
	}
	
	public List filterByKeyword(String keyword) {
		return supplierDao.fetchSupplierListByKeyword(keyword);
	}

	public Supplier loadSupplier(String id) {
		Supplier supplier = new Supplier();
		if (id != null && !id.equals("0")) {
			try {
				supplier = supplierDao.fetchSupplier(Integer.parseInt(id));
			} catch (ParameterException e) {
				throw e;
			}
		}
		return supplier;
	}
	
	public boolean checkDuplicateSupplierName(String name) {
		boolean exist_name = false;
		Supplier supplier = new Supplier();
		log.debug("service checkDuplicateSupplierName " + supplier);
		try {
			supplier = supplierDao.fetchSupplierByName(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (supplier.getId() > 0) { //ID 存在意思是客户名字已经存在不能在用这个名字注册了
			exist_name = true;
		}
		return exist_name;
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void saveSupplier(Supplier supplier){
		if (supplier.getId() == null ||supplier.getId() == 0) {
			supplierDao.saveSupplier(supplier);
		} else {
			supplierDao.updateSupplier(supplier);
		}
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void deleteSupplier(String id) {
		supplierDao.deleteSupplier(Integer.parseInt(id));
	}
}

package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.MenuDao;
import com.web.domain.Menu;
import com.web.domain.MenuCategory;
import com.web.domain.MenuItem;
import com.web.domain.MenuItemGroup;

@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao;
	
	/************************ Menu Category *********************************/
	public List loadMenuCategoryList() {
		return menuDao.fetchMenuCategoryList();
	}
	
	public MenuCategory loadMenuCategory(int id) {
		return menuDao.fetchMenuCategory(id);
	}
	
	@Transactional
	public void saveMenuCategory(MenuCategory menuCategory) {
		if (menuCategory.getId() == 0) {
			menuDao.saveMenuCategory(menuCategory);
		}else {
			menuDao.updateMenuCategory(menuCategory);
		}
		
	}
	/************************ Menu Category *********************************/
	
	/************************ Menu *********************************/
	public List loadMenuList() {
		return menuDao.fetchMenuList();
	}
	@Transactional
	public void saveMenu(Menu menu) {
		if(menu.getId() == 0) {
			menuDao.saveMenu(menu);
		} else menuDao.updateMenu(menu);
		
	}
	/************************ Menu *********************************/
	
	/************************ MenuItemGroup *********************************/
	public List loadMenuItemGroupList() {
		return menuDao.fetchMenuItemGroupList();
	}
	
	public MenuItemGroup loadMenuItemGroup(int id) {
		return menuDao.fetcMenuItemGroup(id);
	}
	
	@Transactional
	public void saveMenuItemGroup(MenuItemGroup menuItemGroup) {
		if (menuItemGroup.getId() == 0) {
			menuDao.saveMenuItemGroup(menuItemGroup);
		}else {
			menuDao.updateMenuItemGroup(menuItemGroup);
		}
		
	}
	@Transactional
	public void deleteMenuItemGroup(String id) {
		if (id != null && !id.equals("0")) {
			menuDao.deleteMenuItemGroup(Integer.parseInt(id));
		}
	}
	/************************ MenuItemGroup *********************************/
	
	/************************ Menu Item *********************************/
	public List loadMenuItemList() {
		return menuDao.fetchMenuItemList();
	}
	
	public MenuItem loadMenuItem(int id) {
		return menuDao.fetchMenuItem(id);
	}
	
	@Transactional
	public void saveMenuItem(MenuItem menuItem) {
		menuDao.saveMenuItem(menuItem);;
	}
	@Transactional
	public void deleteMenuItem(String id) {
		if (id != null || !id.equals("0")) {
			menuDao.deleteMenuItem(Integer.parseInt(id));
		}
	}
	
	/************************ Menu Item *********************************/
	
}

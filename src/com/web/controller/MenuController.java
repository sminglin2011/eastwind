package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.Menu;
import com.web.domain.MenuCategory;
import com.web.domain.MenuItem;
import com.web.domain.MenuItemGroup;
import com.web.service.MenuService;
import com.web.service.StockService;

@Controller
public class MenuController {

	Logger log = Logger.getLogger(MenuController.class);
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private StockService stockService;
	
	@RequestMapping(value="/menuMain.htm")
	public ModelAndView menuMain() {
		log.debug("menuMain");
		List menuList = menuService.loadMenuList();
		List menuCategoryList = menuService.loadMenuCategoryList();
		Map model = new HashMap<>();
		model.put("menuList", menuList);
		model.put("menuCategoryList", menuCategoryList);
		return new ModelAndView("menu/menu_main", "model", model);
	}
	
	/************************* Menu Category ****************************/
	@RequestMapping(value="/menuCategoryMain.htm")
	public ModelAndView menuCategoryMain() {
		log.debug("menuCategoryMain");
		List list = menuService.loadMenuCategoryList();
		Map model = new HashMap<>();
		model.put("list", list);
		return new ModelAndView("menu/menu_category", "model", model);
	}
	
	@RequestMapping(value="/saveMenuCategory.htm")
	public String saveMenuCategory(MenuCategory menuCategory) {
		log.debug("saveMenuCategory" + menuCategory);
		menuService.saveMenuCategory(menuCategory);
		return "redirect:menuCategoryMain.htm";
	}
	/************************* Menu Category ****************************/
	
	/************************* Menu ****************************/
	@RequestMapping(value="/menuList.htm")
	public ModelAndView menuList() {
		log.debug("menuList" );
		List list = menuService.loadMenuList();
		List menuCategoryList = menuService.loadMenuCategoryList();
		Map model = new HashMap<>();
		model.put("list", list);
		model.put("menuCategoryList", menuCategoryList);
		return new ModelAndView("menu/menu_list", "model", model);
	}
	@RequestMapping(value="/saveMenu.htm")
	public String saveMenu(Menu menu) {
		log.debug("save menu");
		menuService.saveMenu(menu);
		
		return "redirect:menuList.htm";
	}
	/************************* Menu ****************************/
	
	/************************* MenuItemGroup ****************************/
	@RequestMapping(value="/menuItemGroupMain.htm")
	public ModelAndView menuItemGroupMain() {
		log.debug("menuItemGroupMain");
		List list = menuService.loadMenuItemGroupList();
		Map model = new HashMap<>();
		model.put("list", list);
		return new ModelAndView("menu/menuItem_group", "model", model);
	}
	
	@RequestMapping(value="/saveMenuItemGroup.htm")
	public String saveMenuItemGroup(MenuItemGroup menuItemGroup) {
		log.debug("saveMenuItemGroup" + menuItemGroup);
		menuService.saveMenuItemGroup(menuItemGroup);
		return "redirect:menuItemGroupMain.htm";
	}
	@RequestMapping(value="/deleteMenuItemGroup.htm")
	public String deleteMenuItemGroup(String id) {
		log.debug("deleteMenuItemGroup id = " + id);
		menuService.deleteMenuItemGroup(id);
		return "redirect:menuItemGroupMain.htm";
	}
	/************************* MenuItemGroup ****************************/
	
	/************************* Menu Item ****************************/
	@RequestMapping(value="/menuItemMain.htm")
	public ModelAndView menuItemMain() {
		log.debug("menuList" );
		List list = menuService.loadMenuItemList();
		List menuList = menuService.loadMenuList();
		List menuItemGroupList = menuService.loadMenuItemGroupList();
		List foodItemList = stockService.loadStockList();
		Map model = new HashMap<>();
		model.put("list", list);
		model.put("menuList", menuList);
		model.put("menuItemGroupList", menuItemGroupList);
		model.put("foodItemList", foodItemList);
		return new ModelAndView("menu/menu_item_main", "model", model);
	}
	
	@RequestMapping(value="saveMenuItem.htm")
	public String saveMenuItem(MenuItem menuItem) {
		log.debug("save menuItem = " + menuItem);
		menuService.saveMenuItem(menuItem);
		return "redirect:menuItemMain.htm"; 
	}
	@RequestMapping(value="deleteMenuItem.htm")
	public String deleteMenuItem(String id) {
		log.debug("deleteMenuItem = " + id);
		menuService.deleteMenuItem(id);
		return "redirect:menuItemMain.htm"; 
	}
	/************************* Menu Item ****************************/
}

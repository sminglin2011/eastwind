package com.web.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.web.domain.Menu;
import com.web.domain.MenuCategory;
import com.web.domain.MenuItem;
import com.web.domain.MenuItemGroup;
import com.web.domain.StockItem;

@Repository
public class MenuDao {

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/************************ Menu Category *****************************/
	public List fetchMenuCategoryList() {
		List list = null;
		list = jdbcTemplate.queryForList("select * from menuCategory");
		return list;
	}
	public void saveMenuCategory(MenuCategory menuCategory) {
		String sql = "insert into menuCategory (menuCategoryName, onlineShow) values (?, ?)";
		jdbcTemplate.update(sql, menuCategory.getMenuCategoryName(), menuCategory.isOnlineShow());
	}
	
	public void updateMenuCategory(MenuCategory menuCategory) {
		String sql = "update menuCategory set menuCategoryName = ?, onlineShow = ? where id = ?";
		jdbcTemplate.update(sql, menuCategory.getMenuCategoryName(), menuCategory.isOnlineShow(), menuCategory.getId());
	}
	
	public MenuCategory fetchMenuCategory(int id) {
		MenuCategory menuCategory = new MenuCategory();
		RowMapper<MenuCategory> rowMapper = new RowMapper<MenuCategory>() {
			public MenuCategory mapRow(ResultSet rs, int sowNum) throws SQLException {
				MenuCategory menucategory = new MenuCategory();
				menucategory.setId(rs.getInt("id"));
				menucategory.setMenuCategoryName(rs.getString("menuCategoryName"));
				menucategory.setOnlineShow(rs.getBoolean("onlineShow"));
				return menucategory;
			}
		};
		String sql = "select id, menuCategoryName, onlineShow from menuCategory where id = ?";
		menuCategory = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return menuCategory;
	}
	/************************ Menu Category *****************************/
	
	/************************ Menu *****************************/
	public List fetchMenuList() {
		List list = null;
		list = jdbcTemplate.queryForList("select m.id, m.menuCategoryId, mc.menuCategoryName, m.menuName, m.price, m.minPax"
				+ ", m.multipleDelivery, m.onlineShow from menu m left join menuCategory mc on m.menuCategoryId = mc.id");
		return list;
	}
	
	public void saveMenu(Menu menu) {
		String sql = "insert into menu (menuCategoryId, menuName, price, minPax, multipleDelivery, onlineShow) "
				+ "values (?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, menu.getMenuCategoryId(), menu.getMenuName(), menu.getPrice(), menu.getMinPax(),
				menu.getMultipleDelivery(), menu.isOnlineShow());
	}
	
	public void updateMenu(Menu menu) {
		String sql = "update menu set menuCategoryId = ?, menuName = ?, price =?, minPax =?, multipleDelivery =?, onlineShow = ? "
				+ " where id = ?";
		jdbcTemplate.update(sql, menu.getMenuCategoryId(), menu.getMenuName(), menu.getPrice(), menu.getMinPax(),
				menu.getMultipleDelivery(), menu.isOnlineShow(), menu.getId());
	}
	
	/***
	 * menu
	 * @param id
	 * @return
	 */
	public Menu fetchMenu(int id) {
		Menu menu = new Menu();
		RowMapper<Menu> rowMapper = new RowMapper<Menu>() {
			public Menu mapRow(ResultSet rs, int sowNum) throws SQLException {
				Menu menu = new Menu();
				menu.setId(rs.getInt("id"));
				menu.setCollectionTime(rs.getInt("collectionTime"));
				menu.setDeliveryTime(rs.getInt("deliveryTime"));
				menu.setKitchenTime(rs.getInt("kitchenTime"));
				menu.setMenuCategoryId(rs.getInt("menuCategoryId"));
				menu.setMenuName(rs.getString("menuName"));
				menu.setMinPax(rs.getInt("minPax"));
				menu.setMultipleDelivery(rs.getInt("multipleDelivery"));
				menu.setOnlineShow(rs.getBoolean("onlineShow"));
				menu.setPrice(rs.getDouble("price"));
				return menu;
			}
		};
		String sql = "select id, collectionTime, deliveryTime, kitchenTime, menuCategoryId, menuName,"
				+ " minPax, multipleDelivery, onlineShow, price from menu where id = ?";
		menu = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return menu;
	}
	/************************ Menu *****************************/
	
	/************************ MenuItem Group *****************************/
	public List fetchMenuItemGroupList() {
		List list = null;
		list = jdbcTemplate.queryForList("select * from menuItemGroup");
		return list;
	}
	public void saveMenuItemGroup(MenuItemGroup menuItemGroup) {
		String sql = "insert into menuItemGroup (menuItemGroupName) values (?)";
		jdbcTemplate.update(sql, menuItemGroup.getMenuItemGroupName());
	}
	
	public void updateMenuItemGroup(MenuItemGroup menuItemGroup) {
		String sql = "update MenuItemGroup set menuItemGroupName = ? where id = ?";
		jdbcTemplate.update(sql, menuItemGroup.getMenuItemGroupName(), menuItemGroup.getId());
	}
	
	public void deleteMenuItemGroup(int id) {
		String sql = "delete from MenuItemGroup  where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
	public MenuItemGroup fetcMenuItemGroup(int id) {
		MenuItemGroup menuItemGroup = new MenuItemGroup();
		RowMapper<MenuItemGroup> rowMapper = new RowMapper<MenuItemGroup>() {
			public MenuItemGroup mapRow(ResultSet rs, int sowNum) throws SQLException {
				MenuItemGroup menuItemGroup = new MenuItemGroup();
				menuItemGroup.setId(rs.getInt("id"));
				menuItemGroup.setMenuItemGroupName(rs.getString("menuItemGroupName"));
				return menuItemGroup;
			}
		};
		String sql = "select id, menuItemGroupName from menuItemGroup where id = ?";
		menuItemGroup = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return menuItemGroup;
	}
	/************************ Menu Category *****************************/
	
	/************************ Menu Item *****************************/
	public List fetchMenuItemList() {
		List list = null;
		list = jdbcTemplate.queryForList("select ni.id, ni.menuId, n.menuName, ni.menuItemGroupId, nig.menuItemGroupName, ni.onlineName, ni.stockId from menuItem ni "
				+ "left join menu n on ni.menuId = n.id left join menuItemGroup nig on nig.id = ni.menuItemGroupId");
		return list;
	}
	public void saveMenuItem(MenuItem menuItem) {
		String sql = "insert into menuItem (menuId, menuItemGroupId, stockId, onlineName) values (?, ?, ?, ?)";
		jdbcTemplate.update(sql, menuItem.getMenuId(), menuItem.getMenuItemGroupId(), menuItem.getStockId(), menuItem.getOnlineName());
	}
	
	public void updateMenuItem(MenuItem menuItem) {
		String sql = "update menuItem set menuId = ?, menuItemGroupId = ?, onlineName = ? where id = ?";
		jdbcTemplate.update(sql, menuItem.getMenuId(), menuItem.getMenuItemGroupId(),
				menuItem.getOnlineName(), menuItem.getId());
	}
	
	public void deleteMenuItem(int id) {
		String sql = "delete from menuItem where id = ?";
		jdbcTemplate.update(sql, id);
	}
	
	public MenuItem fetchMenuItem(int id) {
		MenuItem menuItem = new MenuItem();
		RowMapper<MenuItem> rowMapper = new RowMapper<MenuItem>() {
			public MenuItem mapRow(ResultSet rs, int sowNum) throws SQLException {
				MenuItem menuItem = new MenuItem();
				menuItem.setId(rs.getInt("id"));
				menuItem.setMenuId(rs.getInt("menuId"));
				menuItem.setMenuItemGroupId(rs.getInt("menuItemGroupId"));
				menuItem.setOnlineName(rs.getString("onlineName"));
				return menuItem;
			}
		};
		String sql = "select id, menuId, menuItemGroupId, onlineName from menuItem where id = ?";
		menuItem = jdbcTemplate.queryForObject(sql, rowMapper, id);
		return menuItem;
	}
	/************************ Menu Item *****************************/
	
}

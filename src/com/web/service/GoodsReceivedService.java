package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.web.Dao.GoodsReceivedDao;
import com.web.domain.GoodsReceived;

@Service
public class GoodsReceivedService {
	
	Logger log = Logger.getLogger(GoodsReceivedService.class);

	@Autowired
	private GoodsReceivedDao grDao;
	
	private Map<String, Object> map = new HashMap<>();
	
	public List loadGoodsReceivedList(ModelMap model) throws Exception {
		return grDao.fetchGoodsReceivedList();
	}
	
	public GoodsReceived loadGoodsReceived(ModelMap model, int id) throws Exception {
		return grDao.fetchGoodsReceived(id);
	}
	
	/**************************** Business function ***************************************/
}

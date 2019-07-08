package com.ecart.service;

import java.util.List;


import com.ecart.db.ECartDAO;
import com.ecart.entity.Member;
import com.ecart.entity.Order;
import com.ecart.entity.OrderItem;


public class ECartService {
	
	public static boolean create(Member member)
	{
		ECartDAO dao = new ECartDAO();
		return dao.create(member);
	}
	
	public static boolean loginCheck(String userName, String password)
	{
		ECartDAO dao = new ECartDAO();
		return dao.loginCheck(userName,password);
	}
	
	public static int addOrderDetails(Order o)
	{
		ECartDAO dao = new ECartDAO();
		return dao.addOrderDetails(o);
	}
	
	public static boolean addOrderItem(OrderItem o)
	{
		ECartDAO dao = new ECartDAO();
		return dao.addOrderItem(o);
	}
	
	public static List<Order> getOrderDetails(String user)
	{
		ECartDAO dao = new ECartDAO();
		return dao.getOrderDetails(user);
	}
	
	public static List<OrderItem> getOrderItems(int orderID)
	{
		ECartDAO dao = new ECartDAO();
		return dao.getOrderItems(orderID);
	}
}

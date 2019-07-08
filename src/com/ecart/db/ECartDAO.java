package com.ecart.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ecart.entity.Member;
import com.ecart.entity.Order;
import com.ecart.entity.OrderItem;



public class ECartDAO {
	
	//inserting values to register n login table
		public boolean create(Member member)
		{
			String sql0 = "select userName from register where userName = ?";
			String sql1 = "insert into register values(?,?,?,?,?)";
			String uName=null;
			int row = 0;
			try(Connection conn = DBConnectionManager.getConnection())
			{
				PreparedStatement ps0 = conn.prepareStatement(sql0);
				ps0.setString(1, member.getUserName());
				ResultSet rs = ps0.executeQuery();
				if(rs != null && rs.next())
				{
					uName = rs.getString(1);
				}
				if(uName != null && uName.equals(member.getUserName()))
				{
					System.out.println("Username already in use. Select another one");
					return false;
				}
				PreparedStatement ps1 = conn.prepareStatement(sql1);	
				ps1.setString(1, member.getUserName());
				ps1.setString(2, member.getPassword());
				ps1.setString(3, member.getName());
				ps1.setString(4, member.getPhNo());
				ps1.setString(5, member.getMailId());
				row = ps1.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return (row>0);
		}
		
		//login check
		public boolean loginCheck(String userName, String password)
		{
			
			boolean validate = false;
			String sql="select password from register where userName=?";
			String p = null;
			
			try(Connection conn = DBConnectionManager.getConnection()) {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, userName);
				ResultSet rs = ps.executeQuery();
				if(rs != null && rs.next())
				{
					p = rs.getString(1);
				}
				
				if(p != null && p.equals(password))
				{
					validate = true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return validate;
		}
		
		public boolean addOrderItem(OrderItem o)
		{
			int row = 0;
			String sql = "insert into orderitem values(?,?,?,?,?)";
			
			try(Connection conn = DBConnectionManager.getConnection())
			{
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, o.getOrderId());
				ps.setString(2, o.getProductId());
				ps.setString(3, o.getUserName());
				ps.setInt(4, o.getQuantity());
				ps.setFloat(5,o.getSubtotal());
				row = ps.executeUpdate();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}

			return row>0;
		}
		
		
		public int addOrderDetails(Order o)
		{
			@SuppressWarnings("unused")
			int row=0;
			String sql = "insert into orders values(default,?,?,?,?,?,?)";
			int orderID=0;
			int tax=18;
			java.sql.Date dlvDate = new java.sql.Date(o.getDlvDate().getTime());//another way of converting Date type from java.util.Date to java.sql.Date
			java.sql.Date orderDate = new java.sql.Date(o.getOrderDate().getTime());
			
			try(Connection conn = DBConnectionManager.getConnection())
			{
				PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				//ps.setString(1, o.getUser());
				//ps.setInt(1,orderID);
				ps.setFloat(1, o.getSubtotal());
				ps.setFloat(2,tax);
				ps.setFloat(3, o.getGrandtotal());
				ps.setDate(4, orderDate);
				ps.setDate(5, dlvDate);
				ps.setString(6, o.getStatus());
				row = ps.executeUpdate();
				ResultSet rs1 = ps.getGeneratedKeys(); 
	            rs1.next();
	            orderID = rs1.getInt(1);
	            
	            return orderID;
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			return 0;
		}
		
		public List<Order> getOrderDetails(String user)
		{
			String sql = "select o.orderId,o.subTotal,o.grandTotal,o.ordDate,o.dlvDate,o.status from orders o, orderitem ot where ot.userName = ? and o.orderId=ot.orderId";
			List<Order> orders = new ArrayList<>(); 
			float tax=18;
			try(Connection conn = DBConnectionManager.getConnection())
			{
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, user);
				ResultSet rs = ps.executeQuery();
				while(rs != null && rs.next())
				{
					orders.add(new Order(user, rs.getInt(1), rs.getFloat(2), tax, rs.getFloat(3), rs.getDate(4), rs.getDate(5), rs.getString(6)));
				}
				
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			return orders;
		}
		
		public List<OrderItem> getOrderItems(int orderID)
		{
			List<OrderItem> list = new ArrayList<>();
			String sql = "select productId,userName,quantity,sumOfItem from orderItem where orderId=?";
			
			try(Connection conn = DBConnectionManager.getConnection()){
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, orderID);
				ResultSet rs = ps.executeQuery();
				while(rs!=null && rs.next())
				{
					list.add(new OrderItem(orderID, rs.getString(1),rs.getString(2), rs.getInt(3), rs.getFloat(4)));
				}
				return list;
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			return list;
		}
}

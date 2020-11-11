package fit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;

public class DB {
	Connection con=null;

	public Connection getDbConnection() 
	{

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/investorgurudb","root","root");
			
			
			if(con!=null) {
				System.out.println("object created");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
	public int addCustomer(Customer customer)  {
		int n=0;
		try {
		Connection con = getDbConnection();
		PreparedStatement ps = con.prepareStatement("insert into "
				+ "customers(name,mobile,email,password) values(?,?,?,?)");
		ps.setString(1, customer.getName());
		ps.setLong(2, customer.getMobile());
		ps.setString(3, customer.getEmail());
		ps.setString(4, customer.getPassword());
		
		n = ps.executeUpdate();
		ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public boolean logincustomer(Customer customer) {
		try {
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customers where "
					+ "email='"+customer.getEmail()+"' and "
							+ "password='"+customer.getPassword()+"'");
			if(rs.next()) {
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
}

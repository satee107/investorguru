package fit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

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
							+ "password='"+customer.getPassword()+"' and status=1");
			if(rs.next()) {
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean changepwd(String email,String oldpwd,String newpwd) {
		try {
			Connection con = getDbConnection();
			PreparedStatement stmt = con.prepareStatement("update customers set password=? where email=? and password=?");
			stmt.setString(1, newpwd);
			stmt.setString(2, email);
			stmt.setString(3,oldpwd);
			int n = stmt.executeUpdate();
			if(n>0) {
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Customer getCustomet(String email) {
		Customer customer = new Customer();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customers where "
					+ "email='"+email+"'");
			if(rs.next()) {
				customer.setEmail(rs.getString("email"));
				customer.setMobile(rs.getLong("mobile"));
				customer.setName(rs.getString("name"));
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return customer;
	}
	
	
	public boolean updatecustprofile(String email,String name,long mobile) {
		try {
			Connection con = getDbConnection();
			PreparedStatement stmt = con.prepareStatement("update customers set name=?,mobile=? where email=? ");
			stmt.setString(1, name);
			stmt.setLong(2, mobile);
			stmt.setString(3,email);
			int n = stmt.executeUpdate();
			if(n>0) {
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean addFeedback(String email,String name,String message)  {
		int n=0;
		try {
		Connection con = getDbConnection();
		PreparedStatement ps = con.prepareStatement("insert into feedback(name,email,message) values(?,?,?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, message);
		System.out.println("in db method");
		n = ps.executeUpdate();
		System.out.println(n+" =======");
		if(n>0) {
			return true;
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean addidea(Idea idea)  {
		int n=0;
		try {
		Connection con = getDbConnection();
		PreparedStatement ps = con.prepareStatement("insert into ideas(title,description,domain,custemail) values(?,?,?,?)");
		ps.setString(1, idea.getTitle());
		ps.setString(2, idea.getDescription());
		ps.setString(3, idea.getDomain());
		ps.setString(4, idea.getCustemail());

		System.out.println("in db method");
		n = ps.executeUpdate();
		System.out.println(n+" =======");
		if(n>0) {
			return true;
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	public List<Idea> viewideas(String email) {
		List<Idea> list = new ArrayList<Idea>();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from ideas where "
					+ "custemail='"+email+"'");
			while(rs.next()) {
				Idea idea = new Idea();
				idea.setId(rs.getInt("id"));
				idea.setTitle(rs.getString("title"));
				idea.setDescription(rs.getString("description"));
				idea.setDomain(rs.getString("domain"));
				idea.setLikes(rs.getInt("likes"));
				idea.setDislikes(rs.getInt("dislikes"));
				idea.setCustemail(rs.getString("custemail"));
				idea.setPdate(rs.getString("pdate"));
				list.add(idea);
				
				
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean deleteidea(int id)  {
		int n=0;
		try {
		Connection con = getDbConnection();
		PreparedStatement ps = con.prepareStatement("delete from ideas where id=?");
		ps.setInt(1, id);
	

		System.out.println("in db method");
		n = ps.executeUpdate();
		System.out.println(n+" =======");
		if(n>0) {
			return true;
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
}

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
	
	
	public List<Idea> viewideasforinvestor() {
		List<Idea> list = new ArrayList<Idea>();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from ideas order by pdate desc");
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
	
	
	public List<Idea> viewideasforinvestorliked(String email) {
		List<Idea> list = new ArrayList<Idea>();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select i.id,i.title,i.description,i.domain,i.likes,i.dislikes,i.custemail,i.pdate from ideas i,likes l where i.id=l.ideaid and l.email='"+email+"' order by pdate desc");
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
	
	public List<Investor> viewinvestorliked(String email) {
		List<Investor> list = new ArrayList<Investor>();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select DISTINCT inv.email,inv.name,inv.mobile from investors inv,ideas i,likes l where i.custemail='"+email+"' and inv.email=l.email and i.id=l.ideaid");
			
			while(rs.next()) {
				Investor investor = new Investor();
				investor.setEmail(rs.getString("email"));
				investor.setName(rs.getString("name"));
				investor.setMobile(rs.getLong("mobile"));
				
				list.add(investor);
				
				
				
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
	
	
	public boolean updateidea(Idea idea) {
		try {
			Connection con = getDbConnection();
			PreparedStatement stmt = con.prepareStatement("update ideas set title=?,description=?,domain=? where id=? ");
			stmt.setString(1, idea.getTitle());
			stmt.setString(2, idea.getDescription());
			stmt.setString(3,idea.getDomain());
			stmt.setInt(4, idea.getId());
			int n = stmt.executeUpdate();
			if(n>0) {
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	public int addInvestor(Investor investor)  {
		int n=0;
		try {
		Connection con = getDbConnection();
		PreparedStatement ps = con.prepareStatement("insert into "
				+ "investors(name,mobile,email,password) values(?,?,?,?)");
		ps.setString(1, investor.getName());
		ps.setLong(2, investor.getMobile());
		ps.setString(3, investor.getEmail());
		ps.setString(4, investor.getPassword());
		
		n = ps.executeUpdate();
		ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public boolean loginInvestor(Investor investor) {
		try {
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from investors where "
					+ "email='"+investor.getEmail()+"' and "
							+ "password='"+investor.getPassword()+"' and status=1");
			if(rs.next()) {
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean changepwdinvestor(String email,String oldpwd,String newpwd) {
		try {
			Connection con = getDbConnection();
			PreparedStatement stmt = con.prepareStatement("update investors set password=? where email=? and password=?");
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
	
	
	public Investor getInvestor(String email) {
		Investor investor = new Investor();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from investors where "
					+ "email='"+email+"'");
			if(rs.next()) {
				investor.setEmail(rs.getString("email"));
				investor.setMobile(rs.getLong("mobile"));
				investor.setName(rs.getString("name"));
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return investor;
	}
	
	
	public boolean updateinvestorprofile(String email,String name,long mobile) {
		try {
			Connection con = getDbConnection();
			PreparedStatement stmt = con.prepareStatement("update investors set name=?,mobile=? where email=? ");
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
	
	public boolean idealike(int id,String email) {
		try {
			Connection con = getDbConnection();
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from likes where "
					+ "email='"+email+"' and "
							+ "ideaid='"+id+"'");
			if(rs.next()) {
				return false;
			}
			else {
			
			PreparedStatement stmt1 = con.prepareStatement("insert into likes(ideaid,email) values(?,?)");
			stmt1.setInt(1, id);
			stmt1.setString(2, email);
			int n = stmt1.executeUpdate();
			System.out.println(n+" n++++++++++");
			if(n>0) {
				
				PreparedStatement stmt2 = con.prepareStatement("update ideas set likes=likes+1 where id=?");
				stmt2.setInt(1, id);
				stmt2.executeUpdate();
				
				PreparedStatement stmt3 = con.prepareStatement("delete from dislikes where ideaid=? and email=?");
				stmt3.setInt(1, id);
				stmt3.setString(2, email);
				int m = stmt3.executeUpdate();
				System.out.println(m+" m++++++++++");

				if(m>0) {
					PreparedStatement stmt4 = con.prepareStatement("update ideas set dislikes=dislikes-1 where id=?");
					stmt4.setInt(1, id);
					stmt4.executeUpdate();
				}
				
				
				return true;
			}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean ideadislike(int id,String email) {
		try {
			Connection con = getDbConnection();
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from dislikes where "
					+ "email='"+email+"' and "
							+ "ideaid='"+id+"'");
			if(rs.next()) {
				return false;
			}
			else {
			
			PreparedStatement stmt1 = con.prepareStatement("insert into dislikes(ideaid,email) values(?,?)");
			stmt1.setInt(1, id);
			stmt1.setString(2, email);
			int n = stmt1.executeUpdate();
			if(n>0) {
				
				PreparedStatement stmt2 = con.prepareStatement("update ideas set dislikes=dislikes+1 where id=?");
				stmt2.setInt(1, id);
				stmt2.executeUpdate();
				
				PreparedStatement stmt3 = con.prepareStatement("delete from likes where ideaid=? and email=?");
				stmt3.setInt(1, id);
				stmt3.setString(2, email);
				int m = stmt3.executeUpdate();
				
				if(m>0) {
					PreparedStatement stmt4 = con.prepareStatement("update ideas set likes=likes-1 where id=?");
					stmt4.setInt(1, id);
					stmt4.executeUpdate();
				}
				
				return true;
			}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean adminlogin(String email,String password) {
		try {
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from admin where "
					+ "email='"+email+"' and "
							+ "password='"+password+"'");
			if(rs.next()) {
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean adminchangepwd(String email,String oldpwd,String newpwd) {
		try {
			Connection con = getDbConnection();
			PreparedStatement stmt = con.prepareStatement("update admin set password=? where email=? and password=?");
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
	
	
	public List<Investor> viewInvestors() {
		List<Investor> list = new ArrayList<Investor>();

		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from investors order by name");
			while(rs.next()) {
				Investor investor = new Investor();
				investor.setEmail(rs.getString("email"));
				investor.setMobile(rs.getLong("mobile"));
				investor.setName(rs.getString("name"));
				list.add(investor)
;				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<Idea> viewIdeas() {
		List<Idea> list = new ArrayList<Idea>();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from ideas order by pdate");
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
	
	public List<Customer> viewCustomers() {
		List<Customer> list = new ArrayList<Customer>();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customers order by name");
			while(rs.next()) {
				Customer customer = new Customer();
				customer.setEmail(rs.getString("email"));
				customer.setMobile(rs.getLong("mobile"));
				customer.setName(rs.getString("name"));
				list.add(customer);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Feedback> viewFeedback() {
		List<Feedback> list = new ArrayList<Feedback>();
		try {
			
			Connection con = getDbConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from feedback order by id");
			while(rs.next()) {
				Feedback feedback = new Feedback();
				feedback.setEmail(rs.getString("email"));
				feedback.setId(rs.getInt("id"));
				feedback.setName(rs.getString("name"));
				feedback.setMessage(rs.getString("message"));
				list.add(feedback);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
}

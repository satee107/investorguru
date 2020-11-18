
<header>
<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
  <a class="navbar-brand" href="#">Investor Guru</a>
   <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#"><i class="fa fa-mobile"></i> 9010990285</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="#"><i class="fa fa-envelope"></i> sateesh.itech@gmail.com</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="#"> <i class="fa fa-twitter"></i></a>
    </li>
  </ul>
  <%
  String email = (String)session.getAttribute("email");
  String type = (String)session.getAttribute("type");

	if(type==null) { 
  %>
  <ul class="navbar-nav ml-auto">
    <li class="nav-item active">
      <a class="nav-link" href="index.jsp">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="about.jsp">About</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="contact.jsp">Contact</a>
    </li>
  </ul>
  
  <%
	}
	else if(type.equals("customer")){
  %>
   <ul class="navbar-nav ml-auto">
    <li class="nav-item active">
      <a class="nav-link" href="customerhome.jsp">Home</a>
    </li>
   <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       Ideas
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="ideaadd.jsp">Idea Management</a>
        <a class="dropdown-item" href="logout.jsp">Investors</a>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="feedback.jsp">Feedback</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        My Account(<%= email %>)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="customerchangepwd.jsp">Change Password</a>
        <a class="dropdown-item" href="updateprofile.jsp">Update Profile</a>
        <a class="dropdown-item" href="logout.jsp">Logout</a>
      </div>
    </li>
  </ul>
   <%
	}
	else if(type.equals("investor")){
  %>
   <ul class="navbar-nav ml-auto">
    <li class="nav-item active">
      <a class="nav-link" href="invetsorhome.jsp">Home</a>
    </li>
   <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       Ideas
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="ideaview.jsp">View All Ideas</a>
        <a class="dropdown-item" href="idealike.jsp">View Liked Ideas</a>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="feedback.jsp">Feedback</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        My Account(<%= email %>)
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="investorchangepwd.jsp">Change Password</a>
        <a class="dropdown-item" href="investorupdateprofile.jsp">Update Profile</a>
        <a class="dropdown-item" href="logout.jsp">Logout</a>
      </div>
    </li>
  </ul>
  <%
	}
  %>
  
</nav>
<div class="m-1">

<img src="images/fitlogo.png" alt="Logo" height="150px" width="350px"/>
</div>
</header>
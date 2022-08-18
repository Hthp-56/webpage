<%@page import="java.util.Map"%>
<%@ page import="java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="Jpack.DbConfig" %>
<%@ page import="Jpack.UserTypes" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Log-In</title>
</head>
<style>
    .login-panel {
        margin-top: 150px;
        padding: 30px;
    }
</style>
<body background="images/tractor-385681_1920.jpg">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<div class="container">
    <div class="row">
        <div class="col-md-4"> </div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default bg-light">
                <div class="panel-heading">
                    <h3 class="panel-title">Log in as:</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="index.jsp">
                        <fieldset>
                            <div class="form-group">
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="user_type">
                                    <option value="<%out.print(UserTypes.FARMER);%>"selected>Farmer</option>
                                    <option value="<%out.print(UserTypes.SELLER);%>">Seller</option>
                                    <option value="<%out.print(UserTypes.CROP_BUYER);%>">CROP BUYER</option>
                                    <option value="<%out.print(UserTypes.ADMIN);%>">Administrator</option>
                                </select>
                             </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Phone" name="phone" type="tel" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="pass" type="password" required>
                            </div>
                            <input class="btn btn-md btn-success btn-block" type="submit" name="login_request" value="Login">
                            </br>
                            <a href="user-registration.jsp" class="btn btn-md btn-primary btn-block">Register</a>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
                                                    
</body>
</html>
 
 




<%
if( request.getParameterMap().containsKey("login_request") ){
        String user_type = request.getParameter("user_type");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            // SELECT `id`, `type`, `name`, `phone`, `pass`, `district`, `address` FROM `users` WHERE 1
       
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `users` WHERE type=? and phone=? and pass=?");//"select * from register where email=? and pass=?");
            ps.setString(1, user_type);
            ps.setString(2, phone);
            ps.setString(3, pass);
            ResultSet rs =ps.executeQuery();
            if(rs.next()){
                session.setAttribute("id", rs.getString("id"));
                session.setAttribute("type", rs.getString("type"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("phone", phone);
                session.setAttribute("district", rs.getString("district"));
                session.setAttribute("address", rs.getString("address"));
                %><script>window.open('user-account.jsp','_self')</script><%
            }
            else{
                %><script>alert('phone or password is incorrect!')</script>;<%
            }
        }catch(Exception e){
            out.print(e.toString());
        } 
}
%>

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
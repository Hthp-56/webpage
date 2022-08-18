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
    <title>Register</title>
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
                    <h3 class="panel-title">Register as:</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="user-registration.jsp">
                        <fieldset>
                            <div class="form-group">
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="user_type">
                                    <option value="<%out.print(UserTypes.FARMER);%>"selected>Farmer</option>
                                    <option value="<%out.print(UserTypes.SELLER);%>">Seller</option>
                                     <option value="<%out.print(UserTypes.CROP_BUYER);%>">CROP BUYER</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Name" name="name" type="name" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Phone" name="phone" type="tel" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="District" name="district" type="text" autofocus required>
                            </div>
                            <div class="form-group">
                                 <textarea class="form-control" placeholder="Address" name="address" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="pass" type="password" required>
                            </div>
                            <input class="btn btn-md btn-primary btn-block" type="submit" name="register_request" value="Register">
                            </br>
                            <h5>Already have account ?</h5>
                            <a href="index.jsp" class="btn btn-md btn-success btn-block">Login</a>
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
   
    if( request.getParameterMap().containsKey("register_request") ){
        
        String type = request.getParameter("user_type");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String district = request.getParameter("district");
        String address = request.getParameter("address");
       
        
       
       
         try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);   
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `users` WHERE type=? and phone=?");
            ps.setString(1, type);
            ps.setString(2, phone);
            ResultSet rs =ps.executeQuery();
            
            if(rs.next()){
                %><script>alert('Phone number already Exists!');</script>;<%   
            }            
            else{
                //INSERT INTO `users`(`id`, `type`, `name`, `phone`, `pass`, `district`, `address`)
                String sql2 = "INSERT INTO `users`(`type`, `name`, `phone`, `pass`, `district`, `address`) VALUES (?,?,?,?,?,?)";
                PreparedStatement ps2 =  conn.prepareStatement(sql2);

                ps2.setString(1, type);
                ps2.setString(2, name);
                ps2.setString(3, phone);
                ps2.setString(4, pass);
                ps2.setString(5, district);
                ps2.setString(6, address);

                boolean res = !ps2.execute();
                if(res){
                    %>
                    <script>alert('Registration Sucessfull!'); window.location.href = "index.jsp"; </script>;
                    <%
                }
                else{
                    %>
                    <script>alert('Registration Fail!'); //window.location.href = "register-new-user.jsp";</script>;
                    <%
                }

            }
 
            
         }catch(Exception e){
            out.print(e.toString());
         }
}
%>


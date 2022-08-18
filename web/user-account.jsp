<%
if(session.getAttribute("phone") == null){
    String site = new String("index.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);         
}
%>

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
    <title>User account</title>
</head>
<style>
    .login-panel {
        margin-top: 150px;
        padding: 30px;
    }
</style>
<body background="images/plantation-945400_1920.jpg">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<div class="container-fluid">
    </br>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="user-account.jsp">e-Farming</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
         <% String active = "farmer_account";  
            if(session.getAttribute("type") != null && session.getAttribute("type").equals("FARMER")) {
                if(request.getParameter("active") != null ){ active =  request.getParameter("active"); } %>
            <a class="nav-item nav-link <% if(active.equals("farmer_account")){%> active <% }%>" href="?active=farmer_account">Farmer Account<span class="sr-only"></span></a>
            <a class="nav-item nav-link <% if(active.equals("add_crop")){%> active <% }%>" href="?active=add_crop">Add Crop</a>
            <a class="nav-item nav-link <% if(active.equals("manage_crops")){%> active <% }%>" href="?active=manage_crops">Manage Crop</a>
            <a class="nav-item nav-link <% if(active.equals("buy_fertilizer")){%> active <% }%>" href="?active=buy_fertilizer">Buy fertilizer </a>
            <a class="nav-item nav-link <% if(active.equals("buy_pesticide")){%> active <% }%>" href="?active=buy_pesticide">Buy pesticide </a>
            <a class="nav-item nav-link <% if(active.equals("buy_seed")){%> active <% }%>" href="?active=buy_seed">Buy Seed</a>
            <a class="nav-item nav-link <% if(active.equals("update_password")){%> active <% }%>" href="?active=update_password">Update password</a>
         <% } 
            else if(session.getAttribute("type") != null && session.getAttribute("type").equals("SELLER")) {
                active = "seller_account";
                if(request.getParameter("active") != null ){ active =  request.getParameter("active"); } %>
            <a class="nav-item nav-link <% if(active.equals("seller_account")){%> active <% }%>" href="?active=seller_account">Seller Account<span class="sr-only"></span></a>
            <a class="nav-item nav-link <% if(active.equals("add_fertilizer")){%> active <% }%>" href="?active=add_fertilizer">Add Fertilizer</a>
            <a class="nav-item nav-link <% if(active.equals("manage_fertilizer")){%> active <% }%>" href="?active=manage_fertilizer">Manage Fertilizer</a>
            <a class="nav-item nav-link <% if(active.equals("add_pesticide")){%> active <% }%>" href="?active=add_pesticide">Add Pesticide</a>
            <a class="nav-item nav-link <% if(active.equals("manage_pesticide")){%> active <% }%>" href="?active=manage_pesticide">Manage Pesticide</a>
             <a class="nav-item nav-link <% if(active.equals("add_seed")){%> active <% }%>" href="?active=add_seed">Add Seed</a>
            <a class="nav-item nav-link <% if(active.equals("manage_seed")){%> active <% }%>" href="?active=manage_seed">Manage Seeds </a>
            <a class="nav-item nav-link <% if(active.equals("update_password")){%> active <% }%>" href="?active=update_password">Update password</a>
         <% } 
            else if(session.getAttribute("type") != null && session.getAttribute("type").equals("CROP_BUYER")) {
                active = "buyer_account";
                if(request.getParameter("active") != null ){ active =  request.getParameter("active"); } %>
            <a class="nav-item nav-link <% if(active.equals("buyer_account")){%> active <% }%>" href="?active=buyer_account">Buyer Account<span class="sr-only"></span></a>
            <a class="nav-item nav-link <% if(active.equals("buy_crops")){%> active <% }%>" href="?active=buy_crops">Buy Crops</a>
            <a class="nav-item nav-link <% if(active.equals("update_password")){%> active <% }%>" href="?active=update_password">Update password</a>
         <% } 
            else if(session.getAttribute("type") != null && session.getAttribute("type").equals("ADMIN")) {
                active = "admin_account";
                if(request.getParameter("active") != null ){ active =  request.getParameter("active"); } %>
            <a class="nav-item nav-link <% if(active.equals("admin_account")){%> active <% }%>" href="?active=admin_account">Admin Account<span class="sr-only"></span></a>
            <a class="nav-item nav-link <% if(active.equals("all_farmers")){%> active <% }%>" href="?active=all_farmers">All Farmers</a>
            <a class="nav-item nav-link <% if(active.equals("all_sellers")){%> active <% }%>" href="?active=all_sellers">All Sellers</a>
            <a class="nav-item nav-link <% if(active.equals("all_crops")){%> active <% }%>" href="?active=all_crops">All Crops</a>
            <a class="nav-item nav-link <% if(active.equals("all_buyers")){%> active <% }%>" href="?active=all_buyers">All Buyers</a>
            <a class="nav-item nav-link <% if(active.equals("all_fertilizers")){%> active <% }%>" href="?active=all_fertilizers">All Fertilizers</a>
            <a class="nav-item nav-link <% if(active.equals("all_pesticide")){%> active <% }%>" href="?active=all_pesticide">All Pesticide</a>
            <a class="nav-item nav-link <% if(active.equals("all_seeds")){%> active <% }%>" href="?active=all_seeds">All Seeds </a>
            <a class="nav-item nav-link <% if(active.equals("update_password")){%> active <% }%>" href="?active=update_password">Update password</a>
         <% } %>
            
          </div>
        </div>
         <span class="navbar-text">
             <a href="logout.jsp" class="text-danger" >Log-out</a>
         </span>
         
    </nav> 
</div>

         
         
         
         
         
         
         
         
         
<% if(active.equals("farmer_account") || active.equals("seller_account") || active.equals("buyer_account") || active.equals("admin_account")) {%>      
<div class="container">
    <div class="row">
        <div class="col-md-4"> </div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default bg-light">
                <div class="panel-heading">
                    <h3 class="panel-title">Profile type: <%out.print(session.getAttribute("type"));%> </h3>
                </div>
                <div class="panel-body">
                    <form role="form" >
                        <fieldset>
                            <div class="form-group">
                                <h6>Account Id:</h6>
                                <input class="form-control"  value="<%out.print(session.getAttribute("id"));%>" disabled required>
                            </div>
                            <div class="form-group">
                                <h6>Name:</h6>
                                <input class="form-control"  value="<%out.print(session.getAttribute("name"));%>" disabled required>
                            </div>
                            <div class="form-group">
                                <h6>Phone:</h6>
                                <input class="form-control"  value="<%out.print(session.getAttribute("phone"));%>" disabled required>
                            </div>
                            <div class="form-group">
                                  <h6>District:</h6>
                                <input class="form-control"  value="<%out.print(session.getAttribute("district"));%>" disabled required>
                            </div>
                            <div class="form-group">
                                  <h6>Address:</h6>
                                <input class="form-control"  value="<%out.print(session.getAttribute("address"));%>" disabled required>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>         
<%}%>  
               













<% if(active.equals("update_password")){%>   
<div class="container">
    <div class="row">
        <div class="col-md-4"> </div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default bg-light">
                <div class="panel-heading">
                    <h3 class="panel-title">Update Password</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="user-account.jsp?active=update_password">
                        <fieldset>
                            
                            <div class="form-group">
                                <input class="form-control" placeholder="Last Password" name="pass_last" type="password" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="new password" name="pass_new1" type="password" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="repeat password" name="pass_new2" type="password" required>
                            </div>
                            <input class="btn btn-md btn-warning btn-block" type="submit" name="password_update_request" value="UPDATE PASSWORD">                            
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%}%>  

<%
if( request.getParameterMap().containsKey("password_update_request") ){

    String phone = (String)session.getAttribute("phone");
    String type = (String)session.getAttribute("type");

    String pass_last = request.getParameter("pass_last");
    String pass_new1 = request.getParameter("pass_new1");
    String pass_new2 = request.getParameter("pass_new2");


    if(!pass_new1.equals(pass_new2)){
        %><script>alert('new passwords are not same!')</script>;<%
    }

    try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);   
       PreparedStatement ps =conn.prepareStatement("SELECT * FROM `users` WHERE type=? and phone=? and pass=?");
       ps.setString(1, type);
       ps.setString(2, phone);
       ps.setString(3, pass_last);
       ResultSet rs =ps.executeQuery();

       if(rs.next()){
            if(pass_last.equals(pass_new1)){
                %><script>alert('old passwsord not allowed please chose another!')</script>;<%
            }
            else{
                String sql = "UPDATE `users` SET `pass`=? WHERE type=? and phone=?" ;
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, pass_new1);
                pstmt.setString(2, type);
                pstmt.setString(3, phone);
                int updateCount = pstmt.executeUpdate();
                if(updateCount > 0){
                    %>
                    <script>alert('Password update successfully!'); window.location.href = "user-account.jsp" ;</script>;
                    <%
                }
                else{ %>
                    <script>alert('Fail to update password!');</script>;
                    <%
                }
            }
       }            
       else{
           %><script>alert('Last password did not match!')</script>;<%
       }
     }catch(Exception e){
        out.print(e.toString());
     }
}
%>











<% if(active.equals("add_crop")){%>   
<div class="container">
    <div class="row">
        <div class="col-md-4"> </div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default bg-light">
                <div class="panel-heading">
                    <h3 class="panel-title">Add Crop</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="user-account.jsp?active=add_crop">
                        <fieldset>
                            
                            <div class="form-group">
                                <input class="form-control" placeholder="Crop Name" name="product_name" type="name" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Price" name="price" type="number" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Qty" name="qty" type="text" autofocus required>
                            </div>
                            <input class="btn btn-md btn-warning btn-block" type="submit" name="add_product_request" value="Add Crop">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%}%>  





<% if(active.equals("add_fertilizer")){%>   
<div class="container">
    <div class="row">
        <div class="col-md-4"> </div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default bg-light">
                <div class="panel-heading">
                    <h3 class="panel-title">Add Fertilizer</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="user-account.jsp?active=add_fertilizer">
                        <fieldset>
                            
                            <div class="form-group">
                                <input class="form-control" placeholder="Fertilizer Name" name="product_name" type="name" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Price" name="price" type="number" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Qty" name="qty" type="text" autofocus required>
                            </div>
                            <input class="btn btn-md btn-warning btn-block" type="submit" name="add_product_request" value="Add Fertilizer">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%}%>  



<% if(active.equals("add_pesticide")){%>   
<div class="container">
    <div class="row">
        <div class="col-md-4"> </div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default bg-light">
                <div class="panel-heading">
                    <h3 class="panel-title">Add Pesticide</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="user-account.jsp?active=add_pesticide">
                        <fieldset>
                            
                            <div class="form-group">
                                <input class="form-control" placeholder="Pesticide Name" name="product_name" type="name" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Price" name="price" type="number" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Qty" name="qty" type="text" autofocus required>
                            </div>
                            <input class="btn btn-md btn-warning btn-block" type="submit" name="add_product_request" value="Add Pesticide">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%}%>  




<% if(active.equals("add_seed")){%>   
<div class="container">
    <div class="row">
        <div class="col-md-4"> </div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default bg-light">
                <div class="panel-heading">
                    <h3 class="panel-title">Add Seed</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="user-account.jsp?active=add_seed">
                        <fieldset>
                            
                            <div class="form-group">
                                <input class="form-control" placeholder="Seed Name" name="product_name" type="name" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Price" name="price" type="number" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Qty" name="qty" type="text" autofocus required>
                            </div>
                            <input class="btn btn-md btn-warning btn-block" type="submit" name="add_product_request" value="Add Seed">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%}%>  












<%
if(request.getParameterMap().containsKey("add_product_request") ){

    //String type = (String)session.getAttribute("type");
    
    String productType = "";
    
    if(active.equals("add_crop")){
        productType = "CROP";
    }
    else if(active.equals("add_fertilizer")){
        productType = "FERTILIZER";
    }
    else if(active.equals("add_pesticide")){
        productType = "PESTICIDE";
    }
    else if(active.equals("add_seed")){
         productType = "SEED";
    }
    
    
    String phone = (String)session.getAttribute("phone");
    String user_name = (String)session.getAttribute("name");
    String district = (String)session.getAttribute("district");
    String address = (String)session.getAttribute("address");
    String price = request.getParameter("price");
    String qty = request.getParameter("qty");
    String product_name = request.getParameter("product_name");
    String status = "";

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
        //`products` (`id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status`) 
        String sql2 = "INSERT INTO `products`(`type`, `product_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `status`) VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps2 =  conn.prepareStatement(sql2);

        ps2.setString(1, productType);
        ps2.setString(2, product_name);
        ps2.setString(3, price);
        ps2.setString(4, qty);
        ps2.setString(5, user_name);
        ps2.setString(6, phone);
        ps2.setString(7, address);
        ps2.setString(8, district);
        ps2.setString(9, status);
        boolean res = !ps2.execute();
        if(res){
            %>
            <script>alert('<%out.print(productType);%> added Sucessfull!'); </script>;
            <%
        }
        else{
            %>
            <script>alert('Fail to add <%out.print(productType);%>!');</script>;
            <%
        }
    }catch(Exception e){
        out.print(e.toString());
    }
}
%>


















<% if(active.equals("manage_crops")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center">Manage All Users</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Crop Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Status</th>
            </tr>
        </thead>

      <%
        try{
            
            String type_user = (String)session.getAttribute("type");
            if(type_user.equals("FARMER")){
                type_user = "CROP";
            }
            else if(type_user.equals("SELLER")){
                //getProductTypeParameter
            }
            String phone_user = (String)session.getAttribute("phone");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and phone=? ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, type_user);
            ps.setString(2, phone_user);
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <% if(status.equals("")) {%>
                <td><a href="soldout.jsp?id_sold=<%out.print(id);%>"><button class="btn btn-success">SELL-OUT</button></a></td> 
                <% } else { %>
                <td><h6 href=""><button class="btn btn-light">SOLD-OUT</button></h6></td> 
                <% } %>
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>









<% if(active.equals("manage_fertilizer")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                 <h1 align="center" class="text-light">Manage Fertilizer</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Fertilizer Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Status</th>
            </tr>
        </thead>

      <%
        try{
            
            String productType = "";
    
            if(active.equals("manage_fertilizer")){
                productType = "FERTILIZER";
            }
            String phone_user = (String)session.getAttribute("phone");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and phone=? ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, productType);
            ps.setString(2, phone_user);
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <% if(status.equals("")) {%>
                <td><a href="soldout.jsp?id_sold=<%out.print(id);%>"><button class="btn btn-success">SELL-OUT</button></a></td> 
                <% } else { %>
                <td><h6 href=""><button class="btn btn-light">SOLD-OUT</button></h6></td> 
                <% } %>
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>







<% if(active.equals("manage_pesticide")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">Manage Pesticides</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Pesticide Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Status</th>
            </tr>
        </thead>

      <%
        try{
            
            String productType = "";
    
            if(active.equals("manage_pesticide")){
                productType = "PESTICIDE";
            }
            String phone_user = (String)session.getAttribute("phone");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
           
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and phone=? ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, productType);
            ps.setString(2, phone_user);
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <% if(status.equals("")) {%>
                <td><a href="soldout.jsp?id_sold=<%out.print(id);%>"><button class="btn btn-success">SELL-OUT</button></a></td> 
                <% } else { %>
                <td><h6 href=""><button class="btn btn-light">SOLD-OUT</button></h6></td> 
                <% } %>
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>








<% if(active.equals("manage_seed")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">Manage Seeds</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Seed Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Status</th>
            </tr>
        </thead>

      <%
        try{
            
            String productType = "";
    
            if(active.equals("manage_seed")){
                productType = "SEED";
            }
            String phone_user = (String)session.getAttribute("phone");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and phone=? ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, productType);
            ps.setString(2, phone_user);
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <% if(status.equals("")) {%>
                <td><a href="soldout.jsp?id_sold=<%out.print(id);%>"><button class="btn btn-success">SELL-OUT</button></a></td> 
                <% } else { %>
                <td><h6 href=""><button class="btn btn-light">SOLD-OUT</button></h6></td> 
                <% } %>
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>












<% if(active.equals("buy_crops")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">All Crops</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Crop Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Farmer name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
            </tr>
        </thead>

      <%
        try{
            
            String type_user = (String)session.getAttribute("type");
            String district_buyer = (String)session.getAttribute("district");
            if(type_user.equals("FARMER")){
                
            }
            else if(type_user.equals("CROP_BUYER")){
                type_user = "CROP";
            }
            String phone_user = (String)session.getAttribute("phone");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and district=? and status=?  ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, type_user);
            ps.setString(2, district_buyer);
            ps.setString(3, "");
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>










<% if(active.equals("buy_fertilizer")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                 <h1 align="center" class="text-light">Buy Fertilizer</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Fertilizer Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Seller Name</th>
                <th>Phone</th>
                <!--<th>District</th> -->
                <th>Address</th>
            </tr>
        </thead>

      <%
        try{
            
            String productType = "";
    
            if(active.equals("buy_fertilizer")){
                productType = "FERTILIZER";
            }
            String phone_user = (String)session.getAttribute("phone");
            String district_user = (String)session.getAttribute("district");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and district=? ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, productType);
            ps.setString(2, district_user);
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                <!--<td><% out.print(district); %></td> -->
                <td><% out.print(address); %></td>
                
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>




<% if(active.equals("buy_pesticide")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                 <h1 align="center" class="text-light">Buy Pesticides</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Pesticide Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Seller Name</th>
                 <th>Phone</th>
                <!--<th>District</th> -->
                <th>Address</th>
            </tr>
        </thead>

      <%
        try{
            
            String productType = "";
    
            if(active.equals("buy_pesticide")){
                productType = "PESTICIDE";
            }
            String phone_user = (String)session.getAttribute("phone");
            String district_user = (String)session.getAttribute("district");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and district=? ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, productType);
            ps.setString(2, district_user);
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                 <!--<td><% out.print(district); %></td> -->
                <td><% out.print(address); %></td>
                
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>





<% if(active.equals("buy_seed")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                 <h1 align="center" class="text-light">Buy Seeds</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Seed Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Seller Name</th>
                <th>Phone</th>
               <!-- <th>District</th> -->
                <th>Address</th>
            </tr>
        </thead>

      <%
        try{
            
            String productType = "";
    
            if(active.equals("buy_seed")){
                productType = "SEED";
            }
            String phone_user = (String)session.getAttribute("phone");
            String district_user = (String)session.getAttribute("district");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type=? and district=? ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, productType);
            ps.setString(2, district_user);
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                <!-- <td><% out.print(district); %> </td> -->
                <td><% out.print(address); %></td>
                
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>



















<% if( session.getAttribute("type").equals("ADMIN") && active.equals("all_farmers")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">Manage All Farmers</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
                <th>Delete</th>
            </tr>
        </thead>

      <%
        try{
            
          
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `users` WHERE type=?");//"select * from register where email=? and pass=?");
            ps.setString(1, "FARMER");
           
            ResultSet rs =ps.executeQuery();
            while(rs.next()){
                //`id`, `type`, `name`, `phone`, `pass`, `district`, `address` FROM `users` WHERE 1
                String id = rs.getString("id");
                String type = rs.getString("type");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String district = rs.getString("district");
                String address = rs.getString("address");
               
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                <td><a href="delete.jsp?active=all_farmers&delete_user_id=<%out.print(id);%>"><button class="btn btn-danger">Delete Account</button></a></td> 
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>








<% if( session.getAttribute("type").equals("ADMIN") && active.equals("all_sellers")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">Manage All Sellers</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
                <th>Delete</th>
            </tr>
        </thead>

      <%
        try{
            
          
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `users` WHERE type=?");//"select * from register where email=? and pass=?");
            ps.setString(1, "SELLER");
           
            ResultSet rs =ps.executeQuery();
            while(rs.next()){
                //`id`, `type`, `name`, `phone`, `pass`, `district`, `address` FROM `users` WHERE 1
                String id = rs.getString("id");
                String type = rs.getString("type");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String district = rs.getString("district");
                String address = rs.getString("address");
               
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                <td><a href="delete.jsp?active=<%out.print(active);%>&delete_user_id=<%out.print(id);%>"><button class="btn btn-danger">Delete Account</button></a></td> 
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>








<% if( session.getAttribute("type").equals("ADMIN") && active.equals("all_buyers")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">Manage All Buyers</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
                <th>Delete</th>
            </tr>
        </thead>

      <%
        try{
            
          
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `users` WHERE type=?");//"select * from register where email=? and pass=?");
            ps.setString(1, "CROP_BUYER");
           
            ResultSet rs =ps.executeQuery();
            while(rs.next()){
                //`id`, `type`, `name`, `phone`, `pass`, `district`, `address` FROM `users` WHERE 1
                String id = rs.getString("id");
                String type = rs.getString("type");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String district = rs.getString("district");
                String address = rs.getString("address");
               
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                <td><a href="delete.jsp?active=<%out.print(active);%>&delete_user_id=<%out.print(id);%>"><button class="btn btn-danger">Delete Account</button></a></td> 
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>






<% if( session.getAttribute("type").equals("ADMIN") && active.equals("all_fertilizers")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">All Fertilizers</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Crop Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Farmer name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
                <th>Delete</th>
            </tr>
        </thead>

      <%
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type= ? and status=?  ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, "FERTILIZER");
            ps.setString(2, "");
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                <td><a href="delete.jsp?active=<%out.print(active);%>&delete_product_id=<%out.print(id);%>"><button class="btn btn-danger">Delete</button></a></td> 
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>







<% if( session.getAttribute("type").equals("ADMIN") && active.equals("all_crops")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">All Crops</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Crop Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Farmer name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
                <th>Delete</th>
            </tr>
        </thead>

      <%
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type= ? and status=?  ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, "CROP");
            ps.setString(2, "");
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                <td><a href="delete.jsp?active=<%out.print(active);%>&delete_product_id=<%out.print(id);%>"><button class="btn btn-danger">Delete</button></a></td> 
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>











<% if( session.getAttribute("type").equals("ADMIN") && active.equals("all_pesticide")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">All Pesticide</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Crop Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Farmer name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
                <th>Delete</th>
            </tr>
        </thead>

      <%
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type= ? and status=?  ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, "PESTICIDE");
            ps.setString(2, "");
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                <td><a href="delete.jsp?active=<%out.print(active);%>&delete_product_id=<%out.print(id);%>"><button class="btn btn-danger">Delete</button></a></td> 
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>








<% if( session.getAttribute("type").equals("ADMIN") && active.equals("all_seeds")){%>   

    <div class='page-header'>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h1 align="center" class="text-light">All Seeds</h1>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
	
    <div class="table-scrol bg-light text-center">
        <h1 align="center"></h1>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>id </th>
                <th>Crop Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date and Time</th>
                <th>Farmer name</th>
                <th>Phone</th>
                <th>District</th>
                <th>Address</th>
                <th>Delete</th>
            </tr>
        </thead>

      <%
        try{
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DbConfig.host,DbConfig.uName,DbConfig.uPass);
            Statement statement = conn.createStatement();
            // `id`, `type`, `crop_name`, `price`, `qty`, `user_name`, `phone`, `address`, `district`, `date_n_time`, `status` FROM `products`
            
            
            PreparedStatement ps =conn.prepareStatement("SELECT * FROM `products` WHERE type= ? and status=?  ORDER BY `date_n_time` DESC");//"select * from register where email=? and pass=?");
            ps.setString(1, "SEED");
            ps.setString(2, "");
            ResultSet resultSet = ps.executeQuery();
            
            while(resultSet.next()){
                
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                String product_name = resultSet.getString("product_name");
                String price = resultSet.getString("price");
                String qty = resultSet.getString("qty");
                String user_name = resultSet.getString("user_name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String district = resultSet.getString("district");
                String date_n_time = resultSet.getString("date_n_time");
                String status = resultSet.getString("status");
      %>
            <tr>
                <td><% out.print(id); %></td>
                <td><% out.print(product_name); %></td>
                <td><% out.print(price); %></td>
                <td><% out.print(qty); %></td>
                <td><% out.print(date_n_time); %></td>
                <td><% out.print(user_name); %></td>
                <td><% out.print(phone); %></td>
                <td><% out.print(district); %></td>
                <td><% out.print(address); %></td>
                <td><a href="delete.jsp?active=<%out.print(active);%>&delete_product_id=<%out.print(id);%>"><button class="btn btn-danger">Delete</button></a></td> 
            </tr>
      <%
            }
        }catch(Exception e){
            out.print(e.toString());
        }
      
      %>
        </table>
    </div>
      
<%}%>















                            
                            
</body>
</html>
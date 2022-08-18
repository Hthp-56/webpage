package Jpack;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DbConfig {
    
    public static final String host = "jdbc:mysql://localhost:3306/efarming";
    public static final String uName = "root" ;
    public static final String uPass = "" ;
     //Class.forName("com.mysql.jdbc.Driver");
}

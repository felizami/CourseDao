/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.coursedao.dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Anuz
 */
public class DBConnection {
    private Connection conn;
    public DBConnection(){
    }
    
    public void open() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");   
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanager", "root", "");
    }
    
    public int executeUpdate(String sql) throws SQLException{
        Statement stmt=conn.createStatement();
        return stmt.executeUpdate(sql);
    }
    
    public ResultSet executeQuery(String sql) throws SQLException{
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(sql);
    }
    
    public void close() throws SQLException{
        if(!conn.isClosed() && conn!=null){
        conn.close();
        conn=null;
        }
    }
    
    
    
}

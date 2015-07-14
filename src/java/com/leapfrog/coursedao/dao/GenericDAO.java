/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.coursedao.dao;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Anuz
 */
public interface GenericDAO<T>{
     int insert(T t) throws ClassNotFoundException,SQLException;
    int update(T t)  throws ClassNotFoundException,SQLException;
    int delete(int id) throws ClassNotFoundException,SQLException;
    List<T> getAll() throws ClassNotFoundException,SQLException;
    T getById(int id) throws ClassNotFoundException,SQLException;
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UI;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author PrasadFTS
 */
public class DBCon {
    Connection connection = null;
    public DBCon(){
        try{
        
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/membermanagement","root","");
        }catch(Exception ex){}
 
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nsrfashion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PrasadFTS
 */
public class LoyaltyCustomer {
        Connection connection;
        PreparedStatement pst;
        private ResultSet rs;
        double discount,loyaltyPoints,subTotal,TotalPrice,Balance;
        int saleID;
        public Connection getDbConnection()
        {
            Connection con=null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/loyaltycustomer","root","");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(LoyaltyCustomer.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(LoyaltyCustomer.class.getName()).log(Level.SEVERE, null, ex);
            }
            return con;
        }
        public double getLoyaltyPOints(String CustomeID)
        {
            String name = CustomeID;
            try {
                
                connection=getDbConnection();
                pst = connection.prepareStatement("select LoyaltyPoints from Customer where CustomerID=?");
                pst.setString(1, CustomeID);
                rs = pst.executeQuery();

                if(rs.next()==false)
                {
                    loyaltyPoints= 0;

                }
                else
                {
                    loyaltyPoints = Double.parseDouble(rs.getString("LoyaltyPoints"));

                }
            } catch (SQLException ex) {
                Logger.getLogger(LoyaltyCustomer.class.getName()).log(Level.SEVERE, null, ex);
            }
            return loyaltyPoints;
        }
        public void updateNewLoyaltyPoints(String Subtotal,boolean isSelected,String CustomerID,String currentPoints)
        {
            try {
                double gainedLoyalty=0.00;
                double CurrentPoints=Double.parseDouble(currentPoints);
                double total=Double.parseDouble(Subtotal);
                if(total<1000)
                {
                    gainedLoyalty=10;
                }
                else if(total>1000 && total<5000)
                {
                    gainedLoyalty=50;
                }
                else if(total>5000 && total<10000)
                {
                    gainedLoyalty=100;
                }
                else if(total>10000 && total<15000)
                {
                    gainedLoyalty=200;
                }
                else if(total>15000 && total<20000)
                {
                    gainedLoyalty=300;
                }
                else
                {
                    gainedLoyalty=500;
                }
                
                connection = getDbConnection();
                String queryUpdate=null;
                if(!isSelected)
                    queryUpdate = "UPDATE  customer SET LoyaltyPoints=LoyaltyPoints+'"+gainedLoyalty+"' WHERE CustomerID='"+CustomerID+"'";
                else
                    queryUpdate = "UPDATE  customer SET LoyaltyPoints=LoyaltyPoints+'"+gainedLoyalty+"'-'"+CurrentPoints+"' WHERE CustomerID='"+CustomerID+"'";
                PreparedStatement preparedStmt = connection.prepareStatement(queryUpdate);
                preparedStmt.execute();
            } catch (SQLException ex) {
                Logger.getLogger(LoyaltyCustomer.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
}

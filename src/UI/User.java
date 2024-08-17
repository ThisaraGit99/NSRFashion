/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UI;

/**
 *
 * @author PrasadFTS
 */
public class User {

    static String userName;
    static String category;
    
    public static String getUserName() {
        return userName;
    }

    public static String getCategory() {
        return category;
    }

    public static void setUserName(String userName) {
        User.userName = userName;
    }

    public static void setCategory(String category) {
        User.category = category;
    }
    
    
}

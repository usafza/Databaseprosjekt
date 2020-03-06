

import java.sql.*;

/**
 *
 * @author Svein Erik
 */
public class ResultCtrl extends DBConn {
    
    public void printTabell () {
       try {
           Statement stmt = conn.createStatement();
           String query = "select * from selskap;";
           //System.out.println(query);
           
           ResultSet rs = stmt.executeQuery(query);
          
           while (rs.next()) {
	    	//System.out.println(rs.getInt("SelskapsID")+"   "+ rs.getString("URL"));
        	System.out.println(rs.getInt("SelskapsID")+"   "+ rs.getString("URL"));
	    }
            
     	} catch (Exception e) {
            System.out.println("db error during select of loper = "+e);
    	}

    }
    public void RolleGittSkuespiller (String Navn) {
    	try {
    		Statement stmt = conn.createStatement();
    		String query = "select Rolle from skuespiller natural join bidragsyter natural join skuespilleriproduksjon where navn =" + Navn + ";";
    		
    		ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
 	    	//System.out.println(rs.getInt("SelskapsID")+"   "+ rs.getString("URL"));
            System.out.println(rs.getString("Rolle"));
    	}
    	}
    	catch (Exception e) {
    		System.out.println("db error during select of loper = "+e);
    	}

    }
    public void FilmGittSkuespiller (String Navn) {
    	try {
    		Statement stmt = conn.createStatement();
    		String query = "select tittel from film natural join medieproduksjon natural join skuespilleriproduksjon natural join (skuespiller natural join bidragsyter) where navn =" + Navn + ";";
    		
    		ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
 	    	//System.out.println(rs.getInt("SelskapsID")+"   "+ rs.getString("URL"));
            System.out.println(rs.getString("tittel"));
    	}
    	}
    	catch (Exception e) {
    		System.out.println("db error during select of loper = "+e);
    	}
    }
    public void FlimselskapMedFlestISjanger () {
    	
    	
    			 
    	try {
    		Statement stmt = conn.createStatement();
    		String query = "Select Navn,URL,nr from (SELECT sjanger.Navn,selskap.URL,count(\"sjangerID\") as nr from film natural join medieproduksjon natural join sjangeriproduksjon natural join sjanger natural join selskapiproduksjon natural join selskap\r\n" + 
    				"    			 group by sjanger.Navn, selskap.URL\r\n" + 
    				"    			 order by sjanger.Navn,nr Desc) as test \r\n" + 
    				"    			 group by Navn";
    		
    		ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
 	    	//System.out.println(rs.getInt("SelskapsID")+"   "+ rs.getString("URL"));
            System.out.println(rs.getString("Navn") + rs.getString("URL"));
    	}
    	}
    	catch (Exception e) {
    		System.out.println("db error during select of loper = "+e);
    	}
    }
    
    public void printAlleKlasserStrekktid2 () {

    }
    
    public void printAlleKlasserStrekktid3 () {

    }
    
    public void printAlleKlasserStrekktid4 () {

    }
}
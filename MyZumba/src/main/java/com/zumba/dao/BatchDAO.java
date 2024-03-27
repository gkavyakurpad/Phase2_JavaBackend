package com.zumba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zumba.db.DBConnection;
import com.zumba.model.BatchModel;
import com.zumba.model.ParticipantModel;

public class BatchDAO {
	
	Connection con;
	
	public int insertIntoBatch(BatchModel batch)
	{
		try {
			con = DBConnection.getDbConn();
			
			if(con!=null)
			{
			
				String sql = "INSERT INTO Batch (batch_name, batch_description, batch_timing, batch_startDate) VALUES (?,?,?,?)";
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, batch.getBatch_name());
				ps.setString(2, batch.getBatch_description());
				ps.setTime(3, java.sql.Time.valueOf(batch.getBatch_timing()));
				ps.setDate(4, java.sql.Date.valueOf(batch.getBatch_startDate()));
				
				int row = ps.executeUpdate();
				return row;
				
			}else {
				System.out.println("Db Connection failed");
	            return 0; // Return 0 to indicate failure
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// Handle exceptions (print or log the error)
	        e.printStackTrace();
	        return 0; // Return 0 to indicate failure
		}finally {
	        // Close resources (if needed)
	        // Example: con.close();
	    }
	}
	
	public List<BatchModel> displayParticipant(){
		List<BatchModel> list = new ArrayList<>();
		try {
			con = DBConnection.getDbConn();
			
			if(con!=null)
			{
			
				String sql = "select * from Batch";
				
				PreparedStatement ps = con.prepareStatement(sql);
				
			
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					BatchModel batch = new BatchModel();
					batch.setBatch_id(rs.getInt("batch_id"));
					batch.setBatch_name(rs.getString("batch_name"));
					batch.setBatch_description(rs.getString("batch_description"));
					batch.setBatch_timing(rs.getString("batch_timing"));
					batch.setBatch_startDate(rs.getString("batch_startDate"));
					
					list.add(batch);
				}
				
				return list;	
				
			}else {
				System.out.println("Db Connection failed");
	            
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// Handle exceptions (print or log the error)
	        e.printStackTrace();
	  
		}finally {
	        // Close resources (if needed)
	        // Example: con.close();
	    }
		return list; // Return the list of participants
		
	}
	
	public BatchModel displayBatchById(int batchId) {
		BatchModel batch = null;
	    
	    try {
	        con = DBConnection.getDbConn();
	        if (con != null) {
	            String sql = "SELECT * FROM Batch WHERE batch_id = ?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setInt(1, batchId);
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	            	batch = new BatchModel();
	            	batch.setBatch_id(rs.getInt("batch_id"));
	            	batch.setBatch_name(rs.getString("batch_name"));
	            	batch.setBatch_description(rs.getString("batch_description"));
	            	batch.setBatch_timing(rs.getString("batch_timing"));
	            	batch.setBatch_startDate(rs.getString("batch_startDate"));
	                // Set other properties as needed
	            }
	        } else {
	            System.out.println("Db Connection failed");
	            // Handle the case when the DB connection fails
	            // Consider throwing an exception or returning null
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        // Handle exceptions (print or log the error)
	        e.printStackTrace();
	        // Consider throwing an exception or returning null
	    } finally {
	        // Close resources if needed
	        // Example: con.close();
	    }
	    
	    return batch; // Return the participant object or null if not found/error occurs
	}
	
	public int editBatch(int batch_id,String batch_name, String batch_description, String batch_timing, String batch_startDate) throws ClassNotFoundException, SQLException{
		 try {
		        con = DBConnection.getDbConn();
		        if (con != null) {
		        	String sql = "update Batch set batch_name=?,batch_description=?,batch_timing=?,batch_startDate=? where batch_id=?";
		    		
		    		PreparedStatement ps = con.prepareStatement(sql);
		    		
		    		ps.setString(1, batch_name);
		    		ps.setString(2, batch_description);
		    		ps.setString(3, batch_timing);
		    		ps.setString(4, batch_startDate);
		    		ps.setInt(5, batch_id);
		    		
		    		int row = ps.executeUpdate();
					return row;
		        } else {
		        	System.out.println("Db Connection failed");
		            return 0; // Return 0 to indicate failure
		        }
		    } catch (ClassNotFoundException | SQLException e) {
		    	// Handle exceptions (print or log the error)
		        e.printStackTrace();
		        return 0; // Return 0 to indicate failure
		    } finally {
		        // Close resources if needed
		        // Example: con.close();
		    }
						
	}
	
	public int deleteBatch(int id) throws ClassNotFoundException, SQLException{
		
		try {
	        con = DBConnection.getDbConn();
	        if (con != null) {
	        	String sql = "delete from Batch where batch_id = ?";
	    		
	    		PreparedStatement ps = con.prepareStatement(sql);
	    		
	    		ps.setInt(1, id);
	    		
	    		int row = ps.executeUpdate();
				return row;
	        } else {
	        	System.out.println("Db Connection failed");
	            return 0; // Return 0 to indicate failure
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	    	// Handle exceptions (print or log the error)
	        e.printStackTrace();
	        return 0; // Return 0 to indicate failure
	    } finally {
	        // Close resources if needed
	        // Example: con.close();
	    }
	
	}
	
}

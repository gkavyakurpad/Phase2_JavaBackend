package com.zumba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zumba.db.DBConnection;
import com.zumba.model.AdminData;
import com.zumba.model.BatchModel;
import com.zumba.model.ParticipantBatchModel;
import com.zumba.model.ParticipantData;
import com.zumba.model.ParticipantModel;

public class ParticipantDAO {

	Connection con;
	
	// INSERT INTO DATABASE
	public int insertIntoParticipant(ParticipantModel participant)
	{
		try {
			con = DBConnection.getDbConn();
			
			if(con!=null)
			{
			
				String sql = "INSERT INTO Participants (participant_name, participant_email, participant_dob, participant_password) VALUES (?,?,?,?)";
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, participant.getParticipant_name());
				ps.setString(2, participant.getParticipant_email());
				ps.setString(3, participant.getParticipant_dob());
				ps.setString(4, participant.getParticipant_password());
				
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
	
	public List<ParticipantModel> displayParticipant(){
		List<ParticipantModel> list = new ArrayList<>();
		try {
			con = DBConnection.getDbConn();
			
			if(con!=null)
			{
			
				String sql = "select * from Participants";
				
				PreparedStatement ps = con.prepareStatement(sql);
				
			
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					ParticipantModel participant = new ParticipantModel();
					participant.setId(rs.getInt("participant_id"));
					participant.setParticipant_name(rs.getString("participant_name"));
					participant.setParticipant_email(rs.getString("participant_email"));
					participant.setParticipant_dob(rs.getString("participant_dob"));
					
					list.add(participant);
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
	
	public ParticipantModel displayParticipantById(int participantId) {
	    ParticipantModel participant = null;
	    
	    try {
	        con = DBConnection.getDbConn();
	        if (con != null) {
	            String sql = "SELECT * FROM Participants WHERE participant_id = ?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setInt(1, participantId);
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                participant = new ParticipantModel();
	                participant.setId(rs.getInt("participant_id"));
	                participant.setParticipant_name(rs.getString("participant_name"));
	                participant.setParticipant_email(rs.getString("participant_email"));
	                participant.setParticipant_dob(rs.getString("participant_dob"));
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
	    
	    return participant; // Return the participant object or null if not found/error occurs
	}
	
	public int editParticipant(int id,String participant_name, String participant_email, String participant_dob) throws ClassNotFoundException, SQLException{
		 try {
		        con = DBConnection.getDbConn();
		        if (con != null) {
		        	String sql = "update Participants set participant_name=?,participant_email=?,participant_dob=? where participant_id=?";
		    		
		    		PreparedStatement ps = con.prepareStatement(sql);
		    		
		    		ps.setString(1, participant_name);
		    		ps.setString(2, participant_email);
		    		ps.setString(3, participant_dob);
		    		ps.setInt(4, id);
		    		
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
	
	public int deleteParticipant(int id) throws ClassNotFoundException, SQLException{
		
		try {
	        con = DBConnection.getDbConn();
	        if (con != null) {
	        	String sql = "delete from Participants where participant_id = ?";
	    		
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
	
	
	public List<ParticipantData> loginParticipant (String username, String password)
	{
		List<ParticipantData> userList = new ArrayList<ParticipantData>();
		
		try {
			con = DBConnection.getDbConn();
			
			if(con!=null)
			{
				String sql = "select * from Participants where participant_name=? and participant_password=?";
				
				PreparedStatement ps;
				
				ps = con.prepareStatement(sql);
				ps.setString(1, username);
				ps.setString(2, password);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					ParticipantData participant = new ParticipantData();
					participant.setParticipant_id(rs.getInt("participant_id"));
					participant.setParticipant_name(rs.getString("participant_name"));
					participant.setParticipant_name(rs.getString("participant_name"));
					participant.setParticipant_password(rs.getString("participant_password"));
					
					userList.add(participant);
				}
				
			}else {
				System.out.println("Db Connection failed");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userList;
	}
	
	public int insertIntoParticipantBatch(ParticipantBatchModel pb)
	{
		try {
			con = DBConnection.getDbConn();
			
			if(con!=null)
			{
			
				String sql = "INSERT INTO Participant_Batch (participant_id, batch_id) VALUES (?,?)";
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, pb.getParticipant_id());
				ps.setInt(2, pb.getBatch_id());
				
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
	
}

	





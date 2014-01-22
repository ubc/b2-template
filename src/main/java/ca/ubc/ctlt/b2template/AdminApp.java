package ca.ubc.ctlt.b2template;

import java.util.HashMap;

import javax.ws.rs.GET;
import javax.ws.rs.InternalServerErrorException;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

import blackboard.data.user.User;
import blackboard.persist.KeyNotFoundException;
import blackboard.persist.PersistenceException;
import blackboard.persist.user.UserDbLoader;
import blackboard.platform.context.Context;
import blackboard.platform.context.ContextManagerFactory;


// add admin to the path, the complete path would now be /api/admin/<path>
@Path("admin")
// we expect to return JSON content, so set the content-type header to JSON
@Produces(MediaType.APPLICATION_JSON)
public class AdminApp extends Application
{
	private final static Logger logger = LoggerFactory.getLogger(AdminApp.class);
	// basic user data retrieval, id, username, name, email, student id
	// basic data submission, take username
	
	@GET
	public String getDefaultUserInfo()
	{
		Context ctx = ContextManagerFactory.getInstance().getContext();
		User user = ctx.getUser();
		return getUserInfoByUsername(user.getUserName());
	}
	
	@GET
	@Path("{username}")
	public String getUserInfoByUsername(@PathParam("username") String username)
	{
		User user;
		try
		{
			UserDbLoader userloader;
			userloader = UserDbLoader.Default.getInstance();
			user = userloader.loadByUserName(username);
		} catch (KeyNotFoundException e)
		{
			throw new NotFoundException("User not found.");
		} catch (PersistenceException e)
		{
			logger.debug("Unable to load user loader.", e);
			throw new InternalServerErrorException("Unable to load user.");
		}
		
		HashMap<String,String> userInfo = new HashMap<String,String>();
		userInfo.put("id", user.getId().toExternalString());
		userInfo.put("username", user.getUserName());
		userInfo.put("name", user.getGivenName() + " " + user.getFamilyName());
		userInfo.put("email", user.getEmailAddress());
		userInfo.put("studentid", user.getStudentId());
		
		Gson gson = new Gson();
		
		return gson.toJson(userInfo);
	}
}

package ca.ubc.ctlt;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;

@Path("hello")
@Produces(MediaType.APPLICATION_JSON)
public class HelloWorld extends Application
{
	@GET
	public String getHello()
	{
		return "1";
	}

	@GET @Path("/list")
	public String getHelloList()
	{
		return "[1,2,3]";
	}
}

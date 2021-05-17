package com.app.resources;

import com.data.db.JPA;
import com.data.model.Agent;
import com.google.gson.Gson;
import org.jboss.resteasy.spi.HttpRequest;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

/**
 * Code written by: Tony (Zongzheng) Li
 * Last modified on (DD/MM/YY): 05/14/21
 */

@Path("/agent")
public class AgentResource {

    /**
     * Attempts to retrieve all agents from the database.
     * @return Response containing JSON string of agents.
     */
    //URI: [domain]/api/agent
    @GET
    @Path("")
    @Produces("application/json")
    public Response GetAll() {
        List<Agent> resultList = (List<Agent>) JPA.GetAll(Agent.class, "Agent");
        for (Agent agent:resultList) {
            if (agent.getAgtMiddleInitial() == null) {
                agent.setAgtMiddleInitial("");
            }
        }

        String result = new Gson().toJson(resultList);
        return Response.status(Response.Status.OK).entity(result).build();
    }

    /**
     * Attempts to retrieve an agent based on AgentId from the database,
     * @param agentId Specified AgentId.
     * @return Response containing JSON string of specified agent, if they exist.
     */
    //URI: [domain]/api/agent/{id}
    @GET
    @Path("{id}")
    @Produces("application/json")
    public Response GetOne(@PathParam("id") int agentId) {
        Agent currentAgent = (Agent) JPA.GetOne(Agent.class, agentId);
        if (currentAgent.getAgtMiddleInitial() == null) {
            currentAgent.setAgtMiddleInitial("");
        }

        String result = new Gson().toJson(currentAgent);
        return Response.status(Response.Status.OK).entity(result).build();
    }

    @POST
    @Path("")
    @Consumes("application/json")
    @Produces("text/plain")
    public Response AddAgent(String body) {

        Agent newAgent;
        //Since only primary key is needed, you can technically send an empty string and create a new object.
        //GSON will throw an error if it tries to convert an empty string to an Integer.
        try {
            newAgent = new Gson().fromJson(body, Agent.class);
        } catch (Exception err) {
            System.out.println("Error: " + err.getMessage());
            newAgent = new Agent();
        }

        newAgent.setAgentId(0); //Primary key must be manually entered. Using 0 to auto-increment.

        if (JPA.AddOne(newAgent)) {
            return Response.status(Response.Status.CREATED).entity("Request processed.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }

    //URI: [domain]/api/agent/{id}
    @DELETE
    @Path("{id}")
    @Produces("text/plain")
    public Response DeleteAgent(@PathParam("id") int agentId) {
        if (JPA.DeleteOne(Agent.class, agentId)) {
            return Response.status(Response.Status.ACCEPTED).entity("Delete accepted.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }

    //URI: [domain]/api/agent/{id}
    @PUT
    @Path("{id}")
    @Consumes("application/json")
    @Produces("text/plain")
    public Response UpdateAgent(@PathParam("id") int agentId, String body) {
        Agent newAgent;
        //Since only primary key is needed, you can technically send an empty string and create a new object.
        //GSON will throw an error if it tries to convert an empty string to an Integer.
        try {
            newAgent = new Gson().fromJson(body, Agent.class);
        } catch (Exception err) {
            System.out.println("Error: " + err.getMessage());
            newAgent = new Agent();
        }

        if (JPA.UpdateOne(newAgent)) {
            return Response.status(Response.Status.ACCEPTED).entity("Request processed.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }
}
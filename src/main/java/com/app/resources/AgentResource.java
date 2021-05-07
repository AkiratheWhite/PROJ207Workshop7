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
 * Last modified on:
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
        List<?> resultList = (List<?>) JPA.GetAll(Agent.class, "Agent");
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
        String result = new Gson().toJson(JPA.GetOne(Agent.class, agentId));
        return Response.status(Response.Status.OK).entity(result).build();
    }

    @POST
    @Path("")
    @Consumes("application/json")
    @Produces("text/plain")
    public Response AddAgent(String body) {
        Agent newAgent = new Gson().fromJson(body, Agent.class);
        newAgent.setAgentId(0); //Primary key must be manually entered. Using 0 to auto-increment.

        if (JPA.AddOne(newAgent)) {
            return Response.status(Response.Status.CREATED).entity("Request processed.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }
}
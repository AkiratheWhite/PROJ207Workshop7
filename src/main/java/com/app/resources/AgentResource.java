package com.app.resources;

import com.data.db.JPA;
import com.data.model.Agent;
import com.google.gson.Gson;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import java.util.List;

/**
 * Code written by: Tony (Zongzheng) Li
 * Last modified on:
 */

@Path("/agent")
public class AgentResource {

    /**
     * Attempts to retrieve all agents from the database.
     * @return JSON string of agents.
     */
    //URI: [domain]/api/agent
    @GET
    @Produces("application/json")
    public String GetAll() {
        List<?> resultList = (List<?>) JPA.GetAll(Agent.class, "Agent");
        return new Gson().toJson(resultList);
    }

    /**
     * Attempts to retrieve an agent based on AgentId from the database,
     * @param agentId Specified AgentId.
     * @return JSON string of specified agent, if they exist.
     */
    //URI: [domain]/api/agent/{id}
    @GET
    @Path("{id}")
    @Produces("application/json")
    public String GetOne(@PathParam("id") int agentId) {
        return new Gson().toJson(JPA.GetOne(Agent.class, agentId));
    }
}
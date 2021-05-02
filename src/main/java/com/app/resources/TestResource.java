package com.app.resources;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/")
public class TestResource {
    @GET
    @Produces("text/plain")
    public String hello() {
        return "This is a test resource.";
    }
}
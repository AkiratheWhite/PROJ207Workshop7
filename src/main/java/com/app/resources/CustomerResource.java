package com.app.resources;

import com.data.db.JPA;
import com.data.model.Customer;
import com.google.gson.Gson;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/customer")
public class CustomerResource {
    @GET
    @Path("")
    @Produces("application/json")
    public Response GetAll(){
        List<Customer> resultList = (List<Customer>) JPA.GetAll(Customer.class, "Customer");
        String result = new Gson().toJson(resultList);
        return Response.status(Response.Status.OK).entity(result).build();
    }//...GetAll

    @GET
    @Path("{id}")
    @Produces("application/json")
    public Response GetOne(@PathParam("id") int customerId) {
        String result = new Gson().toJson(JPA.GetOne(Customer.class, customerId));
        return Response.status(Response.Status.OK).entity(result).build();
    }//...GetOne

    @POST
    @Path("")
    @Consumes("application/json")
    @Produces("text/plain")
    public Response AddCustomer(String body) {
        Customer newCustomer = new Gson().fromJson(body, Customer.class);
        newCustomer.setCustomerId(0); //Primary key must be manually entered. Using 0 to auto-increment.

        if (JPA.AddOne(newCustomer)) {
            return Response.status(Response.Status.CREATED).entity("Request processed.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }//...AddCustomer

    @DELETE
    @Path("{id}")
    @Produces("text/plain")
    public Response DeleteCustomer(@PathParam("id") int customerId) {
        if (JPA.DeleteOne(Customer.class, customerId)) {
            return Response.status(Response.Status.ACCEPTED).entity("Delete accepted.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }//...DeleteCustomer

    @PUT
    @Path("{id}")
    @Consumes("application/json")
    @Produces("text/plain")
    public Response UpdateCustomer(@PathParam("id") int customerId, String body) {
        Customer newCustomer;
        //Since only primary key is needed, you can technically send an empty string and create a new object.
        //GSON will throw an error if it tries to convert an empty string to an Integer.
        try {
            newCustomer = new Gson().fromJson(body, Customer.class);
        } catch (Exception err) {
            System.out.println("Error: " + err.getMessage());
            newCustomer = new Customer();
        }

        if (JPA.UpdateOne(newCustomer)) {
            return Response.status(Response.Status.ACCEPTED).entity("Request processed.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }//...UpdateCustomer

}//class CustomerResource

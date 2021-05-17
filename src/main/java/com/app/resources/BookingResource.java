package com.app.resources;

import com.data.db.JPA;
import com.data.model.Agent;
import com.data.model.Bookingdetails;
import com.google.gson.Gson;
import org.jboss.resteasy.spi.HttpRequest;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

/**
 * Code written by: Dhaval shah
 * Last modified on:05/14/21
 */


@Path("/booking")
public class BookingResource {
    //URI: [domain]/api/booking
    @GET
    @Path("")
    @Produces("application/json")
    public Response GetAll() {
        List<?> resultList = (List<?>) JPA.GetAll(Bookingdetails.class, "Bookingdetails");
        String result = new Gson().toJson(resultList);

        return Response.status(Response.Status.OK).entity(result).build();
    }
    //URI: [domain]/api/booking/{id}
    @GET
    @Path("{id}")
    @Produces("application/json")
    public Response GetOne(@PathParam("id") int bId) {
        String result = new Gson().toJson(JPA.GetOne(Bookingdetails.class, bId));
        return Response.status(Response.Status.OK).entity(result).build();
    }

    @POST
    @Path("")
    @Consumes("application/json")
    @Produces("text/plain")
    public Response AddBooking(String body) {

        Bookingdetails newBooking;
        //Since only primary key is needed, you can technically send an empty string and create a new object.
        //GSON will throw an error if it tries to convert an empty string to an Integer.
        try {
            newBooking = new Gson().fromJson(body, Bookingdetails.class);
        } catch (Exception err) {
            System.out.println("Error: " + err.getMessage());
            newBooking = new Bookingdetails();
        }

        newBooking.setBookingDetailId(0); //Primary key must be manually entered. Using 0 to auto-increment.

        if (JPA.AddOne(newBooking)) {
            return Response.status(Response.Status.CREATED).entity("Request processed.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }
    //URI: [domain]/api/booking/{id}
    @DELETE
    @Path("{id}")
    @Produces("text/plain")
    public Response DeleteBooking(@PathParam("id") int bookingId) {
        if (JPA.DeleteOne(Bookingdetails.class, bookingId)) {
            return Response.status(Response.Status.ACCEPTED).entity("Delete accepted.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }

    //URI: [domain]/api/booking/{id}
    @PUT
    @Path("{id}")
    @Consumes("application/json")
    @Produces("text/plain")
    public Response UpdateBooking(@PathParam("id") int BookigId, String body) {
        Bookingdetails nb;
        //Since only primary key is needed, you can technically send an empty string and create a new object.
        //GSON will throw an error if it tries to convert an empty string to an Integer.
        try {
            nb = new Gson().fromJson(body, Bookingdetails.class);
        } catch (Exception err) {
            System.out.println("Error: " + err.getMessage());
            nb = new Bookingdetails();
        }

        if (JPA.UpdateOne(nb)) {
            return Response.status(Response.Status.ACCEPTED).entity("Request processed.").build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }
}
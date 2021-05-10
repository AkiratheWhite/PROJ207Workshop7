package com.app.resources;

import com.data.db.JPA;
import com.data.model.PackagesEntity;
import com.google.gson.Gson;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;


/**
 *
 * Coded by: Texin D. Otinguey
 *
 */

@Path("/package")
public class PackageResource {

    /**
     *
     * Retrieves all Packages from the Travel Experts Database.
     * @return Returns response containing JSON string of all Packages.
     *
     */
    @GET
    @Path("/get-all-packages")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllPackages() {

        try {
            // Get the Packages from Database and put it on a List Collection
            List<?> resultList = (List<?>) JPA.GetAll(PackagesEntity.class, "PackagesEntity");

            // Instantiate "result" to a GSON Object
            // Serialize the result to JSON
            // Assign the JSON Object to a String value
            String result = new Gson().toJson(resultList);

            // Print Response
            System.out.println("[RESULT - getAllPackages] " + result);

            // Return Response
            return Response.status(Response.Status.OK).entity(result).build();

        } catch (Exception e){
            // Catch Errors and Print
            System.out.println("[ERROR]: " + e.getMessage());

            // Return failed Response.
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }

    /**
     *
     * Retrieves a Package based on the Package ID from the Travel Experts Database.
     * @param packageId Specified Package ID.
     * @return Returns response containing JSON string of specified Package.
     *
     */
    @GET
    @Path("/get-package-by-id/{packageId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPackage(@PathParam("packageId") int packageId) {

        try {
            // Put the result in a String
            String result = new Gson().toJson(JPA.GetOne(PackagesEntity.class, packageId));

            // Print Response
            System.out.println("[RESULT - getPackage] " + result);

            // Return Response
            return Response.status(Response.Status.OK).entity(result).build();

        } catch (Exception e){
            // Catch Errors and Print
            System.out.println("[ERROR]: " + e.getMessage());

            // Return failed Response.
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }

    /**
     *
     * Attempts to add a Package to the Travel Experts Database.
     * @param body Specified Package ID.
     * @return Returns response containing JSON string of specified Package.
     *
     */
    @POST
    @Path("/add-package")
    @Consumes("application/json")
    @Produces(MediaType.APPLICATION_JSON)
    public Response addPackage(String body) {

        try {
            // Construct GSON object and put it on a Package Entity Object
            PackagesEntity new_Package = new Gson().fromJson(body, PackagesEntity.class);

            // If Statements to process the Response
            if (JPA.AddOne(new_Package)) {
                return Response.status(Response.Status.CREATED).entity("Request processed.").build();
            } else {
                return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
            }
        } catch (Exception e){
            // Catch Errors and Print
            System.out.println("[ERROR]: " + e.getMessage());

            // Return failed Response.
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Request failed.").build();
        }
    }
}

<%--
  Created by IntelliJ IDEA.
  User: Dhaval shah
  Date: 5/10/2021
  Time: 1:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="BookingDetailForm" onsubmit="HandleSubmitBookings(event)">
  <div class="d-flex flex-column col-12 col-md-6 m-auto">
    <input class="form-control" type="text" id="ItineraryNo" name="ItineraryNo" placeholder="Itinerary Number">
    <input class="form-control" type="text" id="TripStart" name="TripStart" placeholder="Trip Start Date">
    <input class="form-control" type="text" id="TripEnd" name="TripEnd" placeholder="Trip End Date">
    <input class="form-control" type="text" id="Description" name="Description" placeholder="Description">
    <input class="form-control" type="text" id="Destination"  name="Destination" placeholder="Destination">
    <input class="form-control" type="text" id="BasePrice" name="BasePrice" placeholder="Base Price">
    <input class="form-control" type="text" id="AgencyCommission" name="AgencyCommission" placeholder="Agency Commission">
    <input class="form-control" type="text" id="BookingId" name="BookingId" placeholder="Booking Id">
    <input class="form-control" type="text" id="RegionId" name="RegionId" placeholder="Region Id">
    <input class="form-control" type="text" id="ClassId" name="ClassId" placeholder="Class Id">
    <input class="form-control" type="text" id="FeeId" name="FeeId" placeholder="Fee Id">
    <input class="form-control" type="text" id="ProductSupplierId" name="ProductSupplierId" placeholder="Product Supplier Id">
    <button id="btnSubmit" class="btn btn-primary" type="submit">Submit</button>
    <div id="statusMessage" class="form-control"></div>
  </div>
</form>

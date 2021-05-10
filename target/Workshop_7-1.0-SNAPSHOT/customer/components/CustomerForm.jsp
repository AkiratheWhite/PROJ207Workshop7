<%--
  Created by IntelliJ IDEA.
  User: Chester
  Date: 5/10/2021
  Time: 9:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="CustomerForm" onsubmit="HandleSubmit(event)">
    <div>
        <input class="form-control" type="text" name="CustFirstName" placeholder="First Name">
        <input class="form-control" type="text" name="CustLastName" placeholder="Last Name">
        <input class="form-control" type="text" name="CustAddress" placeholder="Address">
        <input class="form-control" type="text" name="CustCity" placeholder="City">
        <input class="form-control" type="text" name="CustProv" placeholder="Province">
        <input class="form-control" type="text" name="CustPostal" placeholder="Postal">
        <input class="form-control" type="text" name="CustCountry" placeholder="Country">
        <input class="form-control" type="text" name="CustHomePhone" placeholder="Home Phone">
        <input class="form-control" type="text" name="CusBusPhone" placeholder="Business Phone">
        <input class="form-control" type="text" name="CustEmail" placeholder="Email">
        <input class="form-control" type="text" name="AgentId" placeholder="Agent ID">
        <button id="btnSubmit" class="btn btn-primary" type="submit">Submit</button>
        <div id="statusMessage" class="form-control"></div>
    </div>
</form>

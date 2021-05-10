<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2021-05-09
  Time: 7:28 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="AgentForm" onsubmit="HandleSubmit(event)">
    <div class="d-flex flex-column col-12 col-md-6 m-auto">
        <input class="form-control" type="text" id="AgtFirstName" name="AgtFirstName" placeholder="First Name">
        <input class="form-control" type="text" id="AgtMiddleInitial" name="AgtMiddleInitial" placeholder="Middle Initial">
        <input class="form-control" type="text" id="AgtLastName" name="AgtLastName" placeholder="Last Name">
        <input class="form-control" type="text" id="AgtBusPhone" name="AgtBusPhone" placeholder="Phone Number">
        <input class="form-control" type="text" id="AgtEmail"  name="AgtEmail" placeholder="Email">
        <input class="form-control" type="text" id="AgtPosition" name="AgtPosition" placeholder="Position">
        <input class="form-control" type="text" id="AgencyId" name="AgencyId" placeholder="Agency ID">
        <button id="btnSubmit" class="btn btn-primary" type="submit">Submit</button>
        <div id="statusMessage" class="form-control"></div>
    </div>
</form>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Agent</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">
    <form id="AgentForm" onsubmit="AddAgent(event)">
        <div class="d-flex flex-column col-12 col-md-6 m-auto">
            <h2 class="text-center">Add New Agent</h2>
            <input class="form-control" type="text" name="AgtFirstName" placeholder="First Name">
            <input class="form-control" type="text" name="AgtMiddleInitial" placeholder="Middle Initial">
            <input class="form-control" type="text" name="AgtLastName" placeholder="Last Name">
            <input class="form-control" type="text" name="AgtBusPhone" placeholder="Phone Number">
            <input class="form-control" type="text" name="AgtEmail" placeholder="Email">
            <input class="form-control" type="text" name="AgtPosition" placeholder="Position">
            <input class="form-control" type="text" name="AgencyId" placeholder="Agency ID">
            <button id="btnSubmit" class="btn btn-primary" type="submit">Submit</button>
            <div id="statusMessage" class="form-control"></div>
        </div>
    </form>
</div>
<script>
    function AddAgent(event) {
        event.preventDefault();
        $("#btnSubmit").attr("disabled", "");
        $("#btnSubmit").removeAttr("type");

        const formData = $("#AgentForm").serializeArray();

        var formObject = {};

        for (let i = 0; i < formData.length; i++){
            formObject[formData[i]['name']] = formData[i]['value'];
        }

        const formJSON = JSON.stringify(formObject)

        $.ajax({
            type: "POST",
            url: "http://localhost:8080/Workshop_7_war_exploded/api/agent",
            data: formJSON,
            dataType: "text",
            contentType: "application/json",
            beforeSend: function() { $("#statusMessage").html("Awaiting response...")},
            success: function(data) { $("#statusMessage").html(data);}
        });
    }
</script>
</body>
</html>

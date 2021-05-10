$(document).ready(function (){

    /**
     *
     * Get Method to Populate Table List for Packages
     *
     */
    $.ajax({
        type: "GET",
        async: true,
        url: "api/package/get-all-packages",
        dataType: "json",
        success: function (data){
            let packages = data;

            // Get ID of Table and put it on a variable
            let table_Packages = $("#travel-packages-table");

            // Print the total data received on the Browser Console
            console.log("Package/s Length: " + packages.length)

            // For Loop to Populate Table List
            $.each(data, function (){
                table_Packages.append($("<tr/>").attr('id', this.PackageId).append(
                    $("<td>").text(this.PkgName),
                    $("<td>").text(this.PkgStartDate),
                    $("<td>").text(this.PkgEndDate),
                    $("<td>").text(this.PkgDesc),
                    $("<td>").text(this.PkgBasePrice),
                    $("<td>").text(this.PkgAgencyCommission),
                    $("<td>").append($("<button/>")
                        .button(true)
                        .prop('id', this.PackageId)
                        .prop('class', "btn btn-danger m-2 p-2")
                        .text("Delete"))
                )).appendTo(table_Packages);
            });
        }
    });

});

/**
 *
 * Add Travel Package Function
 * @constructor To add a new Travel Package to the Travel Experts Database
 *
 */
function AddTravelPackage() {

    // Put Submit Button ID to a variable
    let submit_Button = $("#btnSubmit");

    // Set the Submit Buttons Attributes to disable.
    submit_Button.attr("disabled", "");
    submit_Button.removeAttr("type");

    // Serialize the Data received from the Form
    const formData = $("#TravelPackageForm").serializeArray();

    // Create Empty Array Object
    let formObject = {};

    // For Loop to loop the formData and put it in the formObject Array
    $.each(formData, function (index){
        formObject[formData[index]["name"]] = formData[index]["value"];
    });

    // Convert formObject to JSON String
    const formJSON = JSON.stringify(formObject);

    // Print the JSON to the browser console.
    console.log("[POST RESPONSE] " + formJSON);

    /**
     *
     * Post Method to add a new Travel Package
     *
     */
    $.ajax({
        type: "POST",
        url: "api/package/add-package",
        data: formJSON,
        dataType: "json",
        contentType: "application/json",

        beforeSend: function() { $("#statusMessage").html("Awaiting response...")},

        success: function(data) { $("#statusMessage").html(data);}

    });
}
/**
 *
 * Coded by: Texin Otinguey
 *
 */

/**
 *
 * Function to Populate Table List for Packages
 *
 */
function createTravelPackagesList() {

    // Clears the Travel Package Table
    $("#travel-packages-table tbody").empty();

    /**
     *
     * Get Method to Populate Table List for Packages
     *
     */
    $.ajax({
        type: "GET",
        async: true,
        url: "/Workshop_7_war_exploded/api/package/get-all-packages",
        dataType: "json",
        success: function (data) {
            let packages = data;

            // Get ID of Table TBody and put it on a variable
            let table_Packages = $("#travel-packages-table tbody");

            // Print the total data received on the Browser Console
            console.log("Package/s Length: " + packages.length)

            // For Loop to Populate Table List
            $.each(packages, function () {
                /**
                 * @param this.PackageId Package ID -
                 * @param this.PkgName Package Name -
                 * @param this.PkgStartDate Package Start Date -
                 * @param this.PkgEndDate Package End Date -
                 * @param this.PkgDesc Package Description -
                 * @param this.PkgBasePrice Package Base Price -
                 * @param this.PkgAgencyCommission Package Agency Commission -
                 *
                 */
                table_Packages.append($("<tr/>").attr('id', this.PackageId).append(
                    $("<td>").text(this.PkgName),
                    $("<td>").text(this.PkgStartDate),
                    $("<td>").text(this.PkgEndDate),
                    $("<td>").text(this.PkgDesc),
                    $("<td>").text(this.PkgBasePrice),
                    $("<td>").text(this.PkgAgencyCommission),
                    $("<td>").append($("<a/>")
                        .prop('href', "/Workshop_7_war_exploded/travel-package/edit-travel-package/" + this.PackageId)
                        .append($("<button/>")
                            .prop('id', "Package" + this.PackageId)
                            .prop('class', "btn btn-primary mx-1 btnEdit")
                            .text("Edit")
                            .val(this.PackageId))),
                    $("<td>").append($("<button/>")
                        .prop("id", "Package" + this.PackageId)
                        .prop('class', "btn btn-danger mx-1 btnDelete")
                        .text("Delete")
                        .val(this.PackageId)
                )).appendTo(table_Packages));
            });

            // Removes the loading symbol from the webpage.
            $("#loadingSpinner").remove();

            /**
             *
             * On Click Listener Event for all the delete buttons.
             *
             */
            $("button.btnDelete").click(function (){
                // Set Package ID variable
                let packageId = ($(this).val());

                console.log("[SELECTED PACKAGE ID]: " + packageId)
                deletePackage(parseInt(packageId));
            });

            /**
             *
             * On Click Listener Event for all the edit buttons.
             *
             */
            $("button.btnEdit").click(function (){
                // Set Package ID variable
                let packageId = ($(this).val());

                // Put Package ID in a cookie
                bakeCookie(packageId, "PackageID");

                console.log("[SELECTED PACKAGE ID]: " + packageId)
            });
        },

        error: function(data) {
            $("#statusMessage").html(data);
        }
    });
}

/**
 *
 * Function to send a DELETE request to the API.
 *
 */
function deletePackage(packageId){

    // If the user confirms the delete, then a DELETE request is sent to the server.
    if (confirm("Are you sure you want to delete this entry?")) {
        $.ajax({
            type: "DELETE",
            async: true,
            url: "/Workshop_7_war_exploded/api/package/delete-package/" + packageId.toString(),
            dataType: "text",
            success: function(data) {
                // Alerts the user of the result of the DELETE request, and refreshes the table list.
                alert(data);
                createTravelPackagesList();
                window.location.replace("/Workshop_7_war_exploded/travel-package");
            },

            error: function (){
                alert("Delete Failed, check the IDE Console.");
                console.log("[ERROR]: Check IDE Console.")
            }
        });
    }

    else  {alert("Delete Cancelled.") } // Do nothing if the user cancels the delete request.
}

/**
 *
 * Put JSON String in a Cookie
 * - To be passed in the EditTravelPackage page.
 * And make a JSON Cookie necklace...
 *
 */
function bakeCookie(value, name){
    // Set Date to Now
    let now = new Date();
    let time = now.getTime();

    // Set Expiration Time
    // - 1 minute Expiration
    // - So you better eat dat fast
    let expire = (time + (3600 * 1000));
    now.setTime(expire);

    // Encode value in order to escape semicolons, commas, and whitespace
    let cookie = name + "=" + encodeURIComponent(value);

    if(typeof expire === "number") {
        /* Sets the max-age attribute so that the cookie expires
        after the specified number of days */
        cookie += "; max-age=" + (expire);

        document.cookie = cookie;
    }
}


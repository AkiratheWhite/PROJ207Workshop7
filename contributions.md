[1]: src/main/java/com/app/resources
[2]: src/main/java/com/data/model
[3]: src/main/webapp
[4]: src/main/resources/META-INF
[5]: src/main/webapp/package/javascript
[6]: src/main/webapp/WEB-INF
[7]: src/main
[8]: src/main/webapp/package/javascript
[001]: src/main/java/com/app/resources/PackageResource.java
[002]: src/main/java/com/data/model/PackagesEntity.java
[003]: src/main/webapp/package/TravelPackages.jsp
[008]: src/main/webapp/package/AddTravelPackage.jsp
[009]: src/main/webapp/package/EditTravelPackage.jsp
[004]: src/main/resources/META-INF/persistence.xml
[005]: src/main/webapp/package/javascript/AddTravelPackageJS.js
[006]: src/main/webapp/WEB-INF/web.xml
[007]: src/main/webapp/package
[010]: src/main/webapp/package/javascript/TravelPackagesJS.js
[011]: src/main/webapp/package/javascript/AddTravelPackageJS.js
[012]: src/main/webapp/package/javascript/EditTravelPackage.js

##Texin D. Otinguey
- Added [PackageResource][001] Java file in the [app.resources][1] package directory.
- Generated [PackageEntity][002] class Model in the [model][2] package directory.
- Added [Travel Package directory][007] file in the [webapp][3] package directory.
     - Added [Travel Package JSP][003] file in the [Travel Package directory][007].
          - Created [Travel Package JavaScript][010] file in the [javascript][8] package directory of the [Travel Package directory][007].
     - Added [Edit Travel Package JSP][009] file in the [Travel Package directory][007].
          - Created [Edit Travel Package JavaScript][011] file in the [javascript][8] package directory of the [Travel Package directory][007].
     - Added [Add Travel Package JSP][009] file in the [Travel Package directory][007].
          - Created [Add Travel Package JavaScript][012] file in the [javascript][8] package directory of the [Travel Package directory][007].
- Added [PackageEntity][002] class Model in the [persistence.xml][004] file in the [META-INF][4] package directory.
- Added Travel Package Servlet Mapping inside the [web.xml][006] file in the [WEB-INF][6] package directory.
- Added [AddTravelPackageJS.js][005] JavaScript file in the [javascript][5] package directory.
    -  Added GET, POST, PUT, DELETE HTTP Requests Methods
        - Get all Packages
        - Get a Package by ID
        - Post a New Package
        - Put(Update) a Package
        - Delete a Package

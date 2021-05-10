[1]: src/main/java/com/app/resources
[2]: src/main/java/com/data/model
[3]: src/main/webapp
[4]: src/main/resources/META-INF
[5]: src/main/webapp/javascript
[6]: src/main/webapp/WEB-INF
[001]: src/main/java/com/app/resources/PackageResource.java
[002]: src/main/java/com/data/model/PackagesEntity.java
[003]: src/main/webapp/package.jsp
[004]: src/main/resources/META-INF/persistence.xml
[005]: src/main/webapp/javascript/package.js
[006]: src/main/webapp/WEB-INF/web.xml

##Texin D. Otinguey
- Added [PackageResource][001] Java file in the [app.resources][1] package directory.
- Generated [PackageEntity][002] class Model in the [model][2] package directory.
- Added [Package JSP][003] file in the [webapp][3] package directory.
- Added [PackageEntity][002] class Model in the [persistence.xml][004] file in the [META-INF][4] package directory.
- Added Travel Package Servlet Mapping inside the [web.xml][006] file in the [WEB-INF][6] package directory.
- Added [package.js][005] JavaScript file in the [javascript][5] package directory.
    -  Added GET, POST, PUT, DELETE HTTP Requests Methods
        - Get all Packages
        - Get a Package by ID
        - Post a New Package
        - Put(Update) a Package
        - Delete a Package

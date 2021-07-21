<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <c:forEach items="${posts}" var="p">
            <div>
                <h1>a<c:out value="${p.creador}"/></h1>
                <ul>
                    <li><c:out value="${p.cuerpo}"/></li>
                    <li>
                        <fmt:formatDate pattern="EEEE dd" value="${p.createdAt}"/> de
                        <fmt:formatDate pattern="MMMM, yyyy" value="${p.createdAt}"/>
                        <fmt:formatDate pattern="hh:mm" value="${p.createdAt}"/>.
                    </li>
                </ul>
            </div>
        </c:forEach>
    </div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    boolean isCorrect = (Boolean) request.getAttribute("isCorrect");
%>
<html>
<head><title>Result</title></head>
<body>
    <h2><%= isCorrect ? "Correct!" : "Incorrect! The correct answer was Japan." %></h2>
    <a href="index.jsp">Try Again</a>
</body>
</html>

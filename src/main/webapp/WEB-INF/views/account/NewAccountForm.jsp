<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>JPetStore Demo</title>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <meta http-equiv="Cache-Control" content="max-age=0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="Pragma" content="no-cache" />
</head>

<body>


    <div id="Menu">
        <div id="MenuContent">
            <sec:authorize access="!isAuthenticated()">
                <a href="${pageContext.request.contextPath}/account/signonForm">Sign In</a>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <a href="${pageContext.request.contextPath}/account/signoff">Sign Out</a>
            </sec:authorize>
        </div>
    </div>




    <div id="Catalog">
        <form:form modelAttribute="accountForm"
                   action="${pageContext.request.contextPath}/account/newAccount">

            <h3>User Information</h3>

            <table>
                <tr>
                    <td>User ID:</td>
                    <td><form:input path="username" /></td>
                </tr>
                <tr>
                    <td>New password:</td>
                    <td><form:password path="password" /></td>
                </tr>
                <tr>
                    <td>Repeat password:</td>
                    <td><form:password path="repeatedPassword" /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><form:input size="40" path="email" /></td>
                </tr>
            </table>

            <input type="submit" name="newAccount"
                   value="Save Account Information" />
        </form:form>
    </div>

</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<div id="Catalog">
    <c:if test="${not empty param.error}">
        <div class="alert alert-error">
            <h4 class="alert-heading">Login error!</h4>
                ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>

    <form action='${pageContext.request.contextPath}/account/signon'
          method="POST">

        <p>Please enter your username and password.</p>
        <p>
            Username: <input type='text' name='j_username' value='admin'>
            <br />
            Password: <input type='password' name='j_password' value="j" />
        </p>
        <input name="submit" type="submit" value="Login" />
    </form>

    Need a user name and password? <a
        href="${pageContext.request.contextPath}/account/newAccountForm">Register
    Now!</a>

</div>


</body>
</html>


<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <form:form modelAttribute="caselistForm"
               action="${pageContext.request.contextPath}/caselist/newCaselist">

        <h3>User Information</h3>

        <table>
            <tr>
                <td>casename</td>
                <td><form:input path="casename" /></td>
            </tr>
            <tr>
                <td>belongmodulea</td>
                <td><form:input path="belongmodulea" /></td>
            </tr>
            <tr>
                <td>belongmoduleb</td>
                <td><form:input path="belongmoduleb" /></td>
            </tr>
            <tr>
                <td>belongmodulec</td>
                <td><form:input path="belongmodulec" /></td>
            </tr>
            <tr>
                <td>priority</td>
                <td><form:input path="priority" /></td>
            </tr>
            <tr>
                <td>casestep</td>
                <td><form:textarea path="casestep" /></td>
            </tr>
            <tr>
                <td>reviewed</td>
                <td><form:checkbox path="reviewed" checked="true" /></td>
            </tr>
            <tr>
                <td>automated</td>
                <td><form:checkbox path="automated" checked="true"/></td>
            </tr>


            <input type="submit" name="newCaselist" value="Save Caselist Information" />
    </form:form>
</div>

</body>
</html>
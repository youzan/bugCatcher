<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div>
    <form:form action="${pageContext.request.contextPath}/caselist/taskcase">
        <table>
            <tr>
                <th><b>caseid</b></th>
                <th><b>casename</b></th>
                <th><b>belongmodulea</b></th>
                <th><b>belongmoduleb</b></th>
                <th><b>belongmodulec</b></th>
                <th><b>casestep</b></th>
                <th><b>reviewed</b></th>
                <th><b>automated</b></th>
                <th><b>creator</b></th>
                <th><b>modifier</b></th>
                <th><b>打钩</b></th>
            </tr>
            <c:forEach var="caselist" items="${allCaselist}">
                <tr>
                    <td>${caselist.caseid}</td>
                    <td>${caselist.casename}</td>
                    <td>${caselist.belongmodulea}</td>
                    <td>${caselist.belongmoduleb}</td>
                    <td>${caselist.belongmodulec}</td>
                    <td>${caselist.casestep}</td>
                    <td>${caselist.reviewed}</td>
                    <td>${caselist.automated}</td>
                    <td>${caselist.creator}</td>
                    <td>${caselist.modifier}</td>
                    <td>
                        <input type = "checkbox" name = "caseids" value = "${caselist.caseid}" checked = "checked" />
                    </td>
                </tr>
            </c:forEach>

            <input type="submit" name="newCaselist" value="Save Caselist Information" />
        </table>
    </form:form>
</div>



</body>
</html>
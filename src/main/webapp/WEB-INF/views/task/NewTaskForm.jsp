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
  <form:form modelAttribute="taskForm"
             action="${pageContext.request.contextPath}/task/newTask">

  <h3>User Information</h3>

  <table>
    <tr>
      <td>taskname</td>
      <td><form:input path="taskname" /></td>
    </tr>


    <%-- TODO:owner从account表查询, role='kf' --%>
    <tr>
      <td>owner</td>
      <td><form:input path="owner" /></td>
    </tr>


    <input type="submit" name="newTask" value="Save Task Information" />
    </form:form>
</div>

</body>
</html>
<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/EditTaskForm.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>

<div id="Content" class="container">
  <form:form class="form-newtask" modelAttribute="task" action="${pageContext.request.contextPath}/task/editTask">
    <h2 class="form-newtask-heading">任务信息</h2>

    <label for="taskid" class="sr-only">任务id</label>
    <form:errors path="taskid" cssClass="error" />
    <form:input path="taskid" id="taskid" class="form-control" placeholder="任务id" value="${task.taskid}" required="true" readonly="true" />
    <label for="taskname" class="sr-only">任务名称</label>
    <form:errors path="taskname" cssClass="error" />
    <form:input path="taskname" id="taskname" class="form-control" placeholder="任务名称 (中英文/下划线)" value="${task.taskname}" required="true" autofocus="true" />
    <label for="owner" class="sr-only">任务执行人</label>
    <form:errors path="owner" cssClass="error" />
    <div>
      <span class="description">执行人:</span>
      <form:select path="owner" id="owner" class="form-control" required="true">
        <c:forEach var="KFAccount" items="${KFAccounts}">
          <c:choose>
            <c:when test="${KFAccount.username == task.owner}">
              <option value="${KFAccount.username}" selected="true">${KFAccount.username}</option>
            </c:when>
            <c:otherwise>
              <option value="${KFAccount.username}">${KFAccount.username}</option>
            </c:otherwise>
          </c:choose>
      </c:forEach>
      </form:select>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
  </form:form>
</div> <!-- /container -->


<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>

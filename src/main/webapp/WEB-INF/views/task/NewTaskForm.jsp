<%@ include file="../common/IncludeHead.jsp"%>
    <link href="../css/NewTaskForm.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>


<div id="Content" class="container">
    <form:form class="form-newtask" modelAttribute="taskForm"
             action="${pageContext.request.contextPath}/task/newTask">
      <h2 class="form-newtask-heading">新建任务</h2>

      <label for="taskname" class="sr-only">任务名称</label>
        <form:errors path="taskname" cssClass="error" />
      <form:input path="taskname" id="taskname" class="form-control" placeholder="任务名称 (中英文/下划线)" required="true" autofocus="true" />
      <label for="owner" class="sr-only">任务执行人</label>
        <form:errors path="owner" cssClass="error" />
      <div>
        <span class="description">执行人:</span>
        <form:select path="owner" id="owner" class="form-control" required="true">
          <c:forEach var="KFAccount" items="${KFAccounts}">
            <form:option value="${KFAccount.username}">${KFAccount.username}</form:option>
          </c:forEach>
        </form:select>
      </div>

      <button class="btn btn-lg btn-primary btn-block" type="submit">创建</button>
    </form:form>
</div> <!-- /container -->


<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>
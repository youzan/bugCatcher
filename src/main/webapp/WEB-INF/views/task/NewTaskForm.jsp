<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
  <form:form modelAttribute="taskForm"
             action="${pageContext.request.contextPath}/task/newTask">

  <h3>任务信息</h3>

  <table>
    <tr>
      <td>任务名称:</td>
      <td><form:input path="taskname" /></td>
    </tr>


    <%-- TODO:owner从account表查询, role='kf' --%>
    <tr>
      <td>任务执行人:</td>
      <td><form:input path="owner" /></td>
    </tr>


    <input type="submit" name="newTask" value="提交" />
    </form:form>
</div>




<%@ include file="../common/IncludeBottom.jsp"%>
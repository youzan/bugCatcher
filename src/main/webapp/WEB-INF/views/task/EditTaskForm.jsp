<%@ include file="../common/IncludeHead.jsp"%>
<%@ include file="../common/IncludeNavbar.jsp"%>

<div id="Content">
  <div id="Catalog">
    <form:form modelAttribute="task"
               action="${pageContext.request.contextPath}/task/editTask">
      <p>${action}</p>

      <h3>任务信息</h3>

      <table>
        <tr>
          <td>任务id:</td>
          <td><form:input path="taskid" value="${task.taskid}" /></td>
        </tr>
        <tr>
          <td>任务名称:</td>
          <td><form:input path="taskname" value="${task.taskname}" /></td>
        </tr>
        <tr>
          <td>执行人:</td>
          <td>
            <form:select path="owner">
              <c:forEach var="KFAccount" items="${KFAccounts}">
                <form:option value="${KFAccount.username}">${KFAccount.username}</form:option>
              </c:forEach>
            </form:select>
          </td>
        </tr>


        <input type="submit" name="editTask" value="提交" />
      </table>
    </form:form>
  </div>
</div>

<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>
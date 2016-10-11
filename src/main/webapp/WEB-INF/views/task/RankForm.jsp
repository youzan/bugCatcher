<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/RankForm.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>


<div id="Content" class="container">
  <sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.account" var="account" />
    <c:if test="${account.role == 'cs' || account.role == 'admin'}">
      <form:form class="form-newtask" modelAttribute="rank"
                 action="${pageContext.request.contextPath}/task/rank">
        <h2 class="form-newtask-heading">華山論劍</h2>

        <label for="taskname" class="sr-only">任务名称</label>
        <form:errors path="taskname" cssClass="error" />
        <form:input path="taskname" id="taskname" class="form-control" placeholder="任务名称 (中英文/下划线)" required="true" autofocus="true" />

        <label for="owner" class="sr-only">任务执行人</label>
        <form:errors path="owner" cssClass="error" />
        <div>
          <span class="description">执行人:</span>
          <form:select path="owner" id="owner" class="form-control select-item" required="true">
            <c:forEach var="KFAccount" items="${KFAccounts}">
              <form:option value="${KFAccount.username}">${KFAccount.username}</form:option>
            </c:forEach>
          </form:select>
        </div>

        <label for="score" class="sr-only">评分</label>
        <form:errors path="score" cssClass="error" />
        <div class="score">
          <span class="description">评分:</span>
          <form:select path="score" id="score" class="form-control select-item" required="true">
            <form:option value="20">A</form:option>
            <form:option value="10" selected="true">B</form:option>
            <form:option value="-10">C</form:option>
          </form:select>
        </div>

        <label for="reason" class="sr-only">评分理由</label>
        <form:errors path="reason" cssClass="error" />
        <form:textarea path="reason" id="reason" class="form-control" placeholder="评分理由" required="true" />

        <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
      </form:form>
    </c:if>
  </sec:authorize>
  
  <div class="rank">
    <table class="table table-hover">
      <tr>
        <th><b>执行人</b></th>
        <th><b>积分排名</b></th>
        <th><b>执行次数</b></th>
      </tr>
      <c:forEach var="totalScore" items="${totalScores}">
          <tr>
            <c:forEach items="${totalScore}" var="entry">
                <c:if test="${entry.key == 'owner'}">
                  <td>${entry.value}</td>
                </c:if>
                <c:if test="${entry.key == 'totalscores'}">
                  <%--<td>${entry.value}</td>--%>
                  <td class="rank-td">
                    <div class="rank-div">
                    <span style="vertical-align: middle;width: 150px;display: inline-block;height: 15px;border-radius: 2px;border: #0099FF 1px solid;">
                      <div class="rank-bar">
                        <span style="width: ${(entry.value + 30)*100/300}%;display: inline-block;height: 15px;background: #0099FF;">
                        </span>
                      </div>
                    </span>
                    <span style=" line-height: 15px;height: 15px;vertical-align: middle;margin-left: 10px;">
                        ${entry.value}
                    </span>
                    </div>
                  </td>


                </c:if>
                <c:if test="${entry.key == 'exetimes'}">
                  <td>${entry.value}</td>
                </c:if>
            </c:forEach>
          </tr>
      </c:forEach>
    </table>

    <%--<table class="table table-hover">--%>
      <%--<tr>--%>
        <%--<th><b>执行人</b></th>--%>
        <%--<th><b>执行次数</b></th>--%>
      <%--</tr>--%>
      <%--<c:forEach var="exeTime" items="${exeTimes}">--%>
        <%--<tr>--%>
          <%--<c:forEach items="${exeTime}" var="entry">--%>
            <%--<c:if test="${entry.key == 'owner'}">--%>
              <%--<td>${entry.value}</td>--%>
            <%--</c:if>--%>
            <%--<c:if test="${entry.key == 'exetimes'}">--%>
              <%--<td>${entry.value}</td>--%>
            <%--</c:if>--%>
          <%--</c:forEach>--%>
        <%--</tr>--%>
      <%--</c:forEach>--%>
    <%--</table>--%>
  </div>
</div> <!-- /container -->


<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>
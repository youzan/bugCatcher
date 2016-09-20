<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/EditCaselistForm.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>


<div id="Content" class="container">
  <form:form class="form-newtask" modelAttribute="caselist" action="${pageContext.request.contextPath}/caselist/editCaselist">
    <h2 class="form-newtask-heading">用例信息</h2>

    <label for="caseid" class="sr-only">用例id</label>
    <form:errors path="caseid" cssClass="error" />
    <form:input path="caseid" id="caseid" class="form-control" placeholder="用例id" value="${caselist.caseid}" required="true" readonly="true"/>
    <label for="casename" class="sr-only">用例名称</label>
    <form:errors path="casename" cssClass="error" />
    <form:input path="casename" id="casename" class="form-control" placeholder="用例名称" value="${caselist.casename}" required="true" autofocus="true" readonly="${action == \"get\"}" />
    <label for="belongmodulea" class="sr-only">一级模块</label>
    <form:errors path="belongmodulea" cssClass="error" />
    <form:input path="belongmodulea" list="belongmoduleas" id="belongmodulea" class="form-control" placeholder="一级模块" value="${caselist.belongmodulea}" required="true" readonly="${action == \"get\"}" />
    <c:if test="${action == 'edit'}">
      <datalist id="belongmoduleas">
        <c:forEach var="belongmodulea" items="${belongmoduleas}">
        <option value=${belongmodulea}>
          </c:forEach>
      </datalist>
    </c:if>
    <label for="belongmoduleb" class="sr-only">二级模块</label>
    <form:errors path="belongmoduleb" cssClass="error" />
    <form:input path="belongmoduleb" list="belongmodulebs" id="belongmoduleb" class="form-control" placeholder="二级模块" value="${caselist.belongmoduleb}" required="true" readonly="${action == \"get\"}" />
    <c:if test="${action == 'edit'}">
      <datalist id="belongmodulebs">
        <c:forEach var="belongmoduleb" items="${belongmodulebs}">
        <option value=${belongmoduleb}>
          </c:forEach>
      </datalist>
    </c:if>
    <label for="belongmodulec" class="sr-only">三级模块</label>
    <form:errors path="belongmodulec" cssClass="error" />
    <form:input path="belongmodulec" list="belongmodulecs" id="belongmodulec" class="form-control" placeholder="三级模块" value="${caselist.belongmodulec}" required="true" readonly="${action == \"get\"}" />
    <c:if test="${action == 'edit'}">
      <datalist id="belongmodulecs">
        <c:forEach var="belongmodulec" items="${belongmodulecs}">
        <option value=${belongmodulec}>
          </c:forEach>
      </datalist>
    </c:if>
    <label for="priority" class="sr-only">等级</label>
    <form:errors path="priority" cssClass="error" />
    <div>
      <span class="description">等级:</span>
      <form:select path="priority" id="priority" class="form-control" required="true">
        <option value="1" <c:if test="${caselist.priority == 1}">selected</c:if>>1</option>
        <option value="2" <c:if test="${caselist.priority == 2}">selected</c:if>>2</option>
        <option value="3" <c:if test="${caselist.priority == 3}">selected</c:if>>3</option>
        <option value="4" <c:if test="${caselist.priority == 4}">selected</c:if>>4</option>
        <option value="5" <c:if test="${caselist.priority == 5}">selected</c:if>>5</option>
      </form:select>
    </div>
    <label for="casestep" class="sr-only">用例步骤</label>
    <form:errors path="casestep" cssClass="error" />
    <form:textarea path="casestep" id="casestep" class="form-control" placeholder="用例步骤" value="${caselist.casestep}" required="true" readonly="${action == \"get\"}" />
    <div class="checkbox">
      <label>
        <form:errors path="reviewed" cssClass="error" />
        <c:choose>
          <c:when test="${caselist.reviewed}">
            <form:checkbox path="reviewed" checked="checked" /> 已评审?
          </c:when>
          <c:otherwise>
            <form:checkbox path="reviewed" /> 已评审?
          </c:otherwise>
        </c:choose>
      </label>
    </div>
    <div class="checkbox">
      <label>
        <form:errors path="automated" cssClass="error" />
        <c:choose>
          <c:when test="${caselist.automated}">
            <form:checkbox path="automated" checked="checked" /> 已自动化?
          </c:when>
          <c:otherwise>
            <form:checkbox path="automated" /> 已自动化?
          </c:otherwise>
        </c:choose>
      </label>
    </div>
    <c:if test="${action == \"edit\"}">
      <button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
    </c:if>
    <c:if test="${action == \"get\"}">
      <a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caselist.caseid}&action=edit">编辑</a>
    </c:if>

  </form:form>
</div> <!-- /container -->


<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>


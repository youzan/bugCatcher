<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/NewCaselistForm.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>


<div id="Content" class="container">
    <form:form class="form-newtask" modelAttribute="caselistForm"
               action="${pageContext.request.contextPath}/caselist/newCaselist">
        <h2 class="form-newtask-heading">新建用例</h2>

        <label for="casename" class="sr-only">用例名称</label>
        <form:errors path="casename" cssClass="error" />
        <form:input path="casename" id="casename" class="form-control" placeholder="用例名称" required="true" autofocus="true" />
        <label for="belongmodulea" class="sr-only">一级模块</label>
        <form:errors path="belongmodulea" cssClass="error" />
        <form:input path="belongmodulea" list="belongmoduleas" id="belongmodulea" class="form-control" placeholder="一级模块" required="true" />
        <datalist id="belongmoduleas">
            <c:forEach var="belongmodulea" items="${belongmoduleas}">
                <option value=${belongmodulea}>
            </c:forEach>
        </datalist>
        <label for="belongmoduleb" class="sr-only">二级模块</label>
        <form:errors path="belongmoduleb" cssClass="error" />
        <form:input path="belongmoduleb" list="belongmodulebs" id="belongmoduleb" class="form-control" placeholder="二级模块" required="true" />
        <datalist id="belongmodulebs">
            <c:forEach var="belongmoduleb" items="${belongmodulebs}">
            <option value=${belongmoduleb}>
                </c:forEach>
        </datalist>
        <label for="belongmodulec" class="sr-only">三级模块</label>
        <form:errors path="belongmodulec" cssClass="error" />
        <form:input path="belongmodulec" list="belongmodulecs" id="belongmodulec" class="form-control" placeholder="三级模块" required="true" />
        <datalist id="belongmodulecs">
            <c:forEach var="belongmodulec" items="${belongmodulecs}">
            <option value=${belongmodulec}>
                </c:forEach>
        </datalist>
        <label for="priority" class="sr-only">等级</label>
        <form:errors path="priority" cssClass="error" />
        <div>
            <span class="description">等级:</span>
            <form:select path="priority" id="priority" class="form-control" required="true">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3" selected>3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </form:select>
        </div>
        <label for="casestep" class="sr-only">用例步骤</label>
        <form:errors path="casestep" cssClass="error" />
        <form:textarea path="casestep" id="casestep" class="form-control" placeholder="用例步骤" required="true" />
        <div class="checkbox">
            <label>
                <form:errors path="reviewed" cssClass="error" />
                <form:checkbox path="reviewed" /> 已评审?
            </label>
        </div>
        <div class="checkbox">
            <label>
                <form:errors path="automated" cssClass="error" />
                <form:checkbox path="automated" /> 已自动化?
            </label>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">创建</button>
    </form:form>
</div> <!-- /container -->


<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>
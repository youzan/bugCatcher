<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/NewCaselistForm.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>


<div id="Content" class="container">
    <form:form class="form-newtask" modelAttribute="caselistForm"
               action="${pageContext.request.contextPath}/caselist/newCaselist">
        <h2 class="form-newtask-heading">新建用例</h2>

        <label for="casename" class="sr-only">用例名称</label>
        <form:input path="casename" id="casename" class="form-control" placeholder="用例名称" required="true" autofocus="true" />
        <label for="belongmodulea" class="sr-only">一级模块</label>
        <form:input path="belongmodulea" id="belongmodulea" class="form-control" placeholder="一级模块" required="true" />
        <label for="belongmoduleb" class="sr-only">二级模块</label>
        <form:input path="belongmoduleb" id="belongmoduleb" class="form-control" placeholder="二级模块" required="true" />
        <label for="belongmodulec" class="sr-only">三级模块</label>
        <form:input path="belongmodulec" id="belongmodulec" class="form-control" placeholder="三级模块" required="true" />
        <label for="priority" class="sr-only">用例优先级</label>
        <div>
            用例优先级:
            <form:select path="priority" id="priority" class="form-control" required="true">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3" selected>3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </form:select>
        </div>
        <label for="casestep" class="sr-only">用例步骤</label>
        <form:textarea path="casestep" id="casestep" class="form-control" placeholder="用例步骤" required="true" />
        <div class="checkbox">
            <label>
                <form:checkbox path="reviewed" /> 已评审?
            </label>
        </div>
        <div class="checkbox">
            <label>
                <form:checkbox path="automated" /> 已自动化?
            </label>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">创建</button>
    </form:form>
</div> <!-- /container -->


<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>
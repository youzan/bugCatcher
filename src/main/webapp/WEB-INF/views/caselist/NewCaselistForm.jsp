<%@ include file="../common/IncludeHead.jsp"%>
<%@ include file="../common/IncludeNavbar.jsp"%>

<div id="Content">
    <div id="Catalog">
        <form:form modelAttribute="caselistForm"
                   action="${pageContext.request.contextPath}/caselist/newCaselist">

            <h3>用例信息</h3>

            <table>
                <tr>
                    <td>用例名称:</td>
                    <td><form:input path="casename" /></td>
                </tr>
                <tr>
                    <td>一级模块:</td>
                    <td><form:input path="belongmodulea" /></td>
                </tr>
                <tr>
                    <td>二级模块:</td>
                    <td><form:input path="belongmoduleb" /></td>
                </tr>
                <tr>
                    <td>三级模块:</td>
                    <td><form:input path="belongmodulec" /></td>
                </tr>
                <tr>
                    <td>用例优先级:</td>
                    <td><form:input path="priority" /></td>
                </tr>
                <tr>
                    <td>用例步骤:</td>
                    <td><form:textarea path="casestep" /></td>
                </tr>
                <tr>
                    <td>已评审?</td>
                    <td><form:checkbox path="reviewed" checked="true" /></td>
                </tr>
                <tr>
                    <td>已自动化?</td>
                    <td><form:checkbox path="automated" checked="true"/></td>
                </tr>


                <input type="submit" name="newCaselist" value="提交" />
            </table>
        </form:form>
    </div>
</div>

<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>
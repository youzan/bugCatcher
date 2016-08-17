<%@ include file="../common/IncludeTop.jsp"%>



<div>
    <form:form action="${pageContext.request.contextPath}/caselist/taskcase">
        <table>
            <tr>
                <th><b>用例id</b></th>
                <th><b>用例名称</b></th>
                <th><b>一级模块</b></th>
                <th><b>二级模块</b></th>
                <th><b>三级模块</b></th>
                <th><b>用例步骤</b></th>
                <th><b>已评审?</b></th>
                <th><b>已自动化?</b></th>
                <th><b>创建人</b></th>
                <th><b>修改人</b></th>
                <th><b>任务用例?</b></th>
            </tr>
            <c:forEach var="caselist" items="${allCaselist}">
                <tr>
                    <td>${caselist.caseid}</td>
                    <td>${caselist.casename}</td>
                    <td>${caselist.belongmodulea}</td>
                    <td>${caselist.belongmoduleb}</td>
                    <td>${caselist.belongmodulec}</td>
                    <td>${caselist.casestep}</td>
                    <td>${caselist.reviewed}</td>
                    <td>${caselist.automated}</td>
                    <td>${caselist.creator}</td>
                    <td>${caselist.modifier}</td>
                    <td>
                        <input type = "checkbox" name = "caseids" value = "${caselist.caseid}" checked = "checked" />
                    </td>
                </tr>
            </c:forEach>

            <input type="submit" name="taskcase" value="提交" />
        </table>
    </form:form>
</div>


<%@ include file="../common/IncludeBottom.jsp"%>
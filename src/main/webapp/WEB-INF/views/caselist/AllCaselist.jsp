<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/AllCaselist.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>

    <div id="Content" class="container">
            <form:form modelAttribute="taskcases" action="${pageContext.request.contextPath}/caselist/newtaskcase">
                <div class="task">
                    任务名称:
                    <form:select path="taskid" id="taskid" class="form-control taskid" required="true">
                        <c:forEach var="unpreparedTask" items="${unpreparedTasks}">
                            <form:option value="${unpreparedTask.taskid}">${unpreparedTask.taskname}</form:option>
                        </c:forEach>
                    </form:select>
                </div>

                <table class="table table-hover">
                    <tr>
                        <th><b>用例id</b></th>
                        <th><b>用例名称</b></th>
                        <th><b>一级模块</b></th>
                        <th><b>二级模块</b></th>
                        <th><b>三级模块</b></th>
                        <th><b>优先级</b></th>
                        <th><b>用例步骤</b></th>
                        <th><b>已评审?</b></th>
                        <th><b>已自动化?</b></th>
                        <th><b>创建人</b></th>
                        <th><b>修改人</b></th>
                        <th><b>任务用例?</b></th>
                        <th><b>查看?</b></th>
                        <th><b>编辑?</b></th>
                        <th><b>删除?</b></th>
                    </tr>
                    <c:forEach var="caselist" items="${allCaselist}">
                        <tr id="case_${caselist.caseid}">
                            <td>${caselist.caseid}</td>
                            <td>${caselist.casename}</td>
                            <td>${caselist.belongmodulea}</td>
                            <td>${caselist.belongmoduleb}</td>
                            <td>${caselist.belongmodulec}</td>
                            <td>${caselist.priority}</td>
                            <td>${caselist.casestep}</td>
                            <c:if test="${caselist.reviewed == true}">
                                <td>YES</td>
                            </c:if>
                            <c:if test="${caselist.reviewed == false}">
                                <td>NO</td>
                            </c:if>
                            <c:if test="${caselist.automated == true}">
                                <td>YES</td>
                            </c:if>
                            <c:if test="${caselist.automated == false}">
                                <td>NO</td>
                            </c:if>
                            <td>${caselist.creator}</td>
                            <td>${caselist.modifier}</td>
                            <td>
                                <input type = "checkbox" name = "caseids" value = "${caselist.caseid}" />
                            </td>
                            <td><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caselist.caseid}&action=get">查看</a></td>
                            <td><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caselist.caseid}&action=edit">编辑</a></td>
                            <td><a href="javascript:void(0)" data-id="${caselist.caseid}" class="del">删除</a></td>
                        </tr>
                    </c:forEach>
                </table>

                <button class="btn btn-lg btn-primary btn-block" type="submit">分配</button>
            </form:form>
    </div>


<%@ include file="../common/IncludeJsVendor.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $(".del").click(function () {
            var link = $(this);
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/caselist/delCaselist",
                data: {
                    caseid: link.data("id")
                },
                success: function (resp) {
                    $("#case_" + resp).remove();
                },
                error: function (xhr) {
                }
            });
            return false;
        });

    });
</script>

</body>
</html>
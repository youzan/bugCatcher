<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/AllCaselist.css" rel="stylesheet">
<link href="../tablefilter/style/tablefilter.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>

    <div id="Content" class="container">
            <form:form modelAttribute="taskcases" action="${pageContext.request.contextPath}/caselist/newtaskcase">
                <div class="task">
                    <span>待分配任务:</span>
                    <form:select path="taskid" id="taskid" class="form-control taskid" required="true">
                        <c:forEach var="unpreparedTask" items="${unpreparedTasks}">
                            <form:option value="${unpreparedTask.taskid}">${unpreparedTask.taskname}</form:option>
                        </c:forEach>
                    </form:select>
                </div>

                <table id="caselists" class="table table-hover">
                    <tr class="headline">
                        <%--<th><b>用例id</b></th>--%>
                        <th class="casename"><b>用例名称</b></th>
                        <th><b>一级模块</b></th>
                        <th><b>二级模块</b></th>
                        <th><b>三级模块</b></th>
                        <th><b>等级</b>
                        <%--<th><b>用例步骤</b></th>--%>
                        <%--<th><b>已评审?</b></th>--%>
                        <%--<th><b>已自动化?</b></th>--%>
                        <%--<th><b>创建人</b></th>--%>
                        <%--<th><b>修改人</b></th>--%>
                        <th><b>勾选</b></th>
                        <%--<th><b>查看?</b></th>--%>
                        <th><b>编辑</b></th>
                        <th><b>删除</b></th>
                    </tr>
                    <c:forEach var="caselist" items="${allCaselist}">
                        <tr id="case_${caselist.caseid}">
                            <%--<td>${caselist.caseid}</td>--%>
                            <td class="casename"><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caselist.caseid}&action=get" target="_blank">${caselist.casename}</a></td>
                            <td>${caselist.belongmodulea}</td>
                            <td>${caselist.belongmoduleb}</td>
                            <td>${caselist.belongmodulec}</td>
                            <td>${caselist.priority}</td>
                            <%--<td>${caselist.casestep}</td>--%>
                            <%--<c:if test="${caselist.reviewed == true}">--%>
                                <%--<td>YES</td>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${caselist.reviewed == false}">--%>
                                <%--<td>NO</td>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${caselist.automated == true}">--%>
                                <%--<td>YES</td>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${caselist.automated == false}">--%>
                                <%--<td>NO</td>--%>
                            <%--</c:if>--%>
                            <%--<td>${caselist.creator}</td>--%>
                            <%--<td>${caselist.modifier}</td>--%>

                            <td>
                                <sec:authorize access="isAuthenticated()">
                                    <sec:authentication property="principal.account" var="account" />
                                    <c:if test="${account.role == 'kf' || account.role == 'cs' || account.role == 'admin'}">
                                        <input type = "checkbox" name = "caseids" value = "${caselist.caseid}" />
                                    </c:if>
                                    <c:if test="${account.role != 'kf' && account.role != 'cs' && account.role != 'admin'}">
                                        <input type = "checkbox" name = "caseids" value = "${caselist.caseid}" disabled />
                                    </c:if>
                                </sec:authorize>
                            </td>
                            <%--<td><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caselist.caseid}&action=get">查看</a></td>--%>
                            <td><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caselist.caseid}&action=edit">编辑</a></td>
                            <td><a href="javascript:void(0)" data-id="${caselist.caseid}" class="del">删除</a></td>
                        </tr>
                    </c:forEach>
                </table>

                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.account" var="account" />
                    <c:if test="${account.role == 'kf' || account.role == 'cs' || account.role == 'admin'}">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">分配</button>
                    </c:if>
                </sec:authorize>

            </form:form>
    </div>


<%@ include file="../common/IncludeJsVendor.jsp"%>
<script type="text/javascript" src="<c:url value="/tablefilter/tablefilter.js" />"></script>

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

        var tf = new TableFilter('caselists', {
            base_path: 'tablefilter/',
            col_1: 'select',
            col_2: 'select',
            col_3: 'select',
            col_4: 'select',
            col_5: 'none',
            col_6: 'none',
            col_7: 'none',
            auto_filter: true,
            auto_filter_delay: 100,
            col_widths: ['600px', '100px', '100px', '100px', '50px', '50px', '50px', '50px']
        });
        tf.init();
    });

</script>

</body>
</html>
<%@ include file="common/IncludeTop.jsp"%>


<div>

    <c:forEach items="${taskMap}" var="taskEntry">
        <h3>任务id: ${taskEntry.key}</h3>


        <table>
            <tr>
                <th><b>任务名称</b></th>
                <th><b>用例已分配?</b></th>
                <th><b>执行人</b></th>
                <th><b>任务已完成?</b></th>
                <th><b>任务评分</b></th>
                <th><b>创建人</b></th>
                <th><b>修改人</b></th>
            </tr>
            <tr>
                <td>${taskEntry.value.taskname}</td>
                <td>${taskEntry.value.prepared}</td>
                <td>${taskEntry.value.owner}</td>
                <td>${taskEntry.value.taskdone}</td>
                <td>${taskEntry.value.taskscore}</td>
                <td>${taskEntry.value.creator}</td>
                <td>${taskEntry.value.modifier}</td>

            </tr>
        </table>

        <c:if test="${taskEntry.value.prepared == true}">
            <table>
                <tr>
                    <th><b>用例id</b></th>
                    <th><b>用例名称</b></th>
                    <th><b>已执行</b></th>
                    <%--<th><b>已评分</b></th>--%>
                    <th><b>执行质量</b></th>
                    <th><b>bug链接</b></th>
                </tr>
                <c:forEach items="${taskcaseMap.get(taskEntry.key)}" var="taskcase">
                    <c:set var="caseid">${taskcase.getCaseid()}</c:set>
                    <tr>
                        <td>${caseid}</td>
                        <td><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caseid}&action=get">${caselistMap.get(caseid).casename}</a></td>
                        <td><input id="casedone_${taskEntry.key}_${caseid}" class="casedone" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="checkbox" <c:if test="${taskcase.getCasedone()}">checked</c:if>></td>

                        <%--<td><input type="checkbox" <c:if test="${taskcase.getEvaluated()}">checked</c:if>></td>--%>
                        <td>
                            <c:choose>
                                <c:when test="${taskcase.getEvaluated()}">
                                    <c:choose>
                                        <c:when test="${taskcase.getCasescore()}">
                                            <img src="/images/good.png" />
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/images/bad.png" />
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    评分
                                    <input id="good" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="button" value="good">
                                    <input id="bad" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="button" value="bad">
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${not empty taskcase.getBugurl()}">
                                    <a href="${taskcase.getBugurl()}"><img src="/images/bug.png" /></a>
                                </c:when>
                                <c:otherwise>
                                    <input class="bugurl" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="url" value="http://">
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>





        <br/><br/><br/>
    </c:forEach>

</div>




<%--<%@ include file="common/IncludeBottom.jsp"%>--%>



</div>


<script type="text/javascript" src="<c:url value="/jquery/1.11/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(".casedone").click(function () {
            var link = $(this);
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/casedone",
                data: {
                    taskid: link.data("taskid"),
                    caseid: link.data("caseid")
                },
                success: function (resp) {
                    $("#casedone_" + resp).attr('checked', true);
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $("#good").click(function () {
            var link = $(this);
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/goodcasescore",
                data: {
                    taskid: link.data("taskid"),
                    caseid: link.data("caseid")
                },
                success: function (resp) {
//                    $("#casedone_" + resp).attr('checked', true);
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $("#bad").click(function () {
            var link = $(this);
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/badcasescore",
                data: {
                    taskid: link.data("taskid"),
                    caseid: link.data("caseid")
                },
                success: function (resp) {
//                    $("#casedone_" + resp).attr('checked', true);
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $(".bugurl").blur(function () {
            var link = $(this);
            var bugurl = $(this).val();
            if (bugurl) {
                $.ajax({
                    type: "POST",
                    url:"${pageContext.request.contextPath}/taskcase/bugurl",
                    data: {
                        taskid: link.data("taskid"),
                        caseid: link.data("caseid"),
                        bugurl: bugurl
                    },
                    success: function (resp) {
    //                    $("#casedone_" + resp).attr('checked', true);
                    },
                    error: function (xhr) {
                    }
                });
            }

            return false;
        });

    });
</script>

</body>
</html>
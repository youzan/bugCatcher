<%@ include file="common/IncludeHead.jsp"%>
<link href="../css/my.css" rel="stylesheet">
<%@ include file="common/IncludeNavbar.jsp"%>

<div id="Content" class="container">
    <c:forEach items="${taskMap}" var="taskEntry">
        <div id="task_${taskEntry.key}" class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                    <%--${taskEntry.value.taskname}--%>
                <ul id="taskInfo" class="list-inline">
                    <li>${taskEntry.value.taskname}</li>

                    <li><a href="${pageContext.request.contextPath}/task/editTaskForm?taskid=${taskEntry.key}&action=edit">编辑</a></li>
                    <li><a href="javascript:void(0)" data-id="${taskEntry.key}" class="del">删除</a></li>

                    <%--<sec:authorize access="isAuthenticated()">--%>
                        <%--<sec:authentication property="principal.account" var="account" />--%>
                        <%--<c:if test="${account.role != 'cs'}">--%>
                            <%--<li><a href="${pageContext.request.contextPath}/task/editTaskForm?taskid=${taskEntry.key}&action=edit">编辑</a></li>--%>
                            <%--<li><a href="javascript:void(0)" data-id="${taskEntry.key}" class="del">删除</a></li>--%>
                        <%--</c:if>--%>
                    <%--</sec:authorize>--%>
                </ul>
            </div>
            <div class="panel-body">
                <dl class="dl-horizontal">
                    <dt>任务id</dt>
                    <dd>${taskEntry.key}</dd>
                    <dt>执行人</dt>
                    <dd>${taskEntry.value.owner}</dd>
                    <dt>用例已分配?</dt>
                    <c:if test="${taskEntry.value.prepared == true}">
                        <dd>YES</dd>
                    </c:if>
                    <c:if test="${taskEntry.value.prepared == false}">
                        <dd>NO</dd>
                    </c:if>
                    <dt>任务已完成?</dt>
                    <c:if test="${taskEntry.value.taskdone == true}">
                        <dd id="taskdone_${taskEntry.key}">YES</dd>
                    </c:if>
                    <c:if test="${taskEntry.value.taskdone == false}">
                        <dd id="taskdone_${taskEntry.key}">NO</dd>
                    </c:if>
                    <dt>任务评分</dt>
                    <dd id="taskscore_${taskEntry.key}">${taskEntry.value.taskscore}</dd>
                    <dt>创建人</dt>
                    <dd>${taskEntry.value.creator}</dd>
                    <dt>修改人</dt>
                    <dd>${taskEntry.value.modifier}</dd>
                </dl>
            </div>

            <!-- Table -->
            <c:if test="${taskEntry.value.prepared == true}">
                <table class="table table-hover">
                    <tr>
                            <%--<th><b>用例id</b></th>--%>
                        <th class="casename"><b>用例名称</b></th>
                        <th><b>已执行</b></th>
                        <th><b>执行质量</b></th>
                        <th><b>bug链接</b></th>
                    </tr>
                    <c:forEach items="${taskcaseMap.get(taskEntry.key)}" var="taskcase">
                        <c:set var="caseid">${taskcase.getCaseid()}</c:set>
                        <tr>
                                <%--<td>${caseid}</td>--%>
                            <td class="casename"><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caseid}&action=get" target="_blank">${caselistMap.get(caseid).casename}</a></td>
                            <td>
                                <sec:authorize access="isAuthenticated()">
                                    <sec:authentication property="principal.account" var="account" />
                                    <c:if test="${account.role != 'kf' && account.role != 'admin'}">
                                        <input id="casedone_${taskEntry.key}_${caseid}" class="casedone" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="checkbox" <c:if test="${taskcase.getCasedone()}">checked</c:if> disabled >
                                    </c:if>
                                    <c:if test="${account.role == 'kf' || account.role == 'admin'}">
                                        <input id="casedone_${taskEntry.key}_${caseid}" class="casedone" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="checkbox" <c:if test="${taskcase.getCasedone()}">checked</c:if> >
                                    </c:if>
                                </sec:authorize>
                            </td>
                            <td id="casescore_${taskEntry.key}_${caseid}">
                                <c:choose>
                                    <c:when test="${taskcase.getEvaluated()}">
                                        <c:choose>
                                            <c:when test="${taskcase.getCasescore()}">
                                                <img class="img_${taskEntry.key}" src="/images/good.png" />
                                            </c:when>
                                            <c:otherwise>
                                                <img class="img_${taskEntry.key}" src="/images/bad.png" />
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <sec:authorize access="isAuthenticated()">
                                            <sec:authentication property="principal.account" var="account" />
                                            <c:if test="${account.role != 'cs' && account.role != 'admin'}">
                                                <input class="btn btn-success good" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="button" value="good" disabled>
                                                <input class="btn btn-danger bad" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="button" value="bad" disabled>
                                            </c:if>
                                            <c:if test="${account.role == 'cs' || account.role == 'admin'}">
                                                <input class="btn btn-success good" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="button" value="good">
                                                <input class="btn btn-danger bad" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="button" value="bad">
                                            </c:if>
                                        </sec:authorize>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td id="bugurl_${taskEntry.key}_${caseid}">
                                <c:choose>
                                    <c:when test="${not empty taskcase.getBugurl()}">
                                        <a class="buglink" href="${taskcase.getBugurl()}" target="_blank"><img src="/images/bug.png" /></a>
                                        <sec:authorize access="isAuthenticated()">
                                            <sec:authentication property="principal.account" var="account" />
                                            <c:if test="${account.role != 'cs' && account.role != 'admin'}">
                                                <input class="bugurl" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="url" value="${taskcase.getBugurl()}" disabled>
                                            </c:if>
                                            <c:if test="${account.role == 'cs' || account.role == 'admin'}">
                                                <input class="bugurl" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="url" value="${taskcase.getBugurl()}">
                                            </c:if>
                                        </sec:authorize>
                                    </c:when>
                                    <c:otherwise>

                                        <sec:authorize access="isAuthenticated()">
                                            <sec:authentication property="principal.account" var="account" />
                                            <c:if test="${account.role != 'cs' && account.role != 'admin'}">
                                                <input class="bugurl" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="url" value="http://" disabled>
                                            </c:if>
                                            <c:if test="${account.role == 'cs' || account.role == 'admin'}">
                                                <input class="bugurl" data-taskid="${taskEntry.key}" data-caseid="${caseid}" type="url" value="http://">
                                            </c:if>
                                        </sec:authorize>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </c:forEach>
</div>


<%@ include file="common/IncludeJsVendor.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        $(".del").click(function () {
            var link = $(this);
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/task/delTask",
                data: {
                    taskid: link.data("id")
                },
                success: function (resp) {
                    $("#task_" + resp).remove();
                },
                error: function (xhr) {
                }
            });
            return false;
        });

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
                    $("#casedone_" + resp).prop('checked', true);
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $(".good").click(function () {
            var link = $(this);
            var taskid = link.data("taskid");
            var caseid = link.data("caseid")
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/goodcasescore",
                data: {
                    taskid: taskid,
                    caseid: caseid
                },
                success: function (resp) {
                    var img = '<img class="img_' + taskid + '" src="/images/good.png" />'
                    $("#casescore_" + resp).html('');
                    $("#casescore_" + resp).append(img);

                    if ($("#task_" + taskid + " .img_" + taskid).length === $("#casescore_" + resp).parent().siblings().size()) {
                        $.ajax({
                            type: "POST",
                            url:"${pageContext.request.contextPath}/task/taskscore",
                            data: {
                                taskid: taskid
                            },
                            success: function (resp) {
                                $("#taskdone_" + taskid).html("YES");
                                $("#taskscore_" + taskid).html(resp);
                            },
                            error: function (xhr) {
                            }
                        });
                    }
                },
                error: function (xhr) {
                }
            });

            return false;
        });

        $(".bad").click(function () {
            var link = $(this);
            var taskid = link.data("taskid");
            var caseid = link.data("caseid")
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/badcasescore",
                data: {
                    taskid: taskid,
                    caseid: caseid
                },
                success: function (resp) {
                    var img = '<img class="img_' + taskid + '" src="/images/bad.png" />'
                    $("#casescore_" + resp).html('');
                    $("#casescore_" + resp).append(img);

                    if ($("#task_" + taskid + " .img_" + taskid).length === $("#casescore_" + resp).parent().siblings().size()) {
                        $.ajax({
                            type: "POST",
                            url:"${pageContext.request.contextPath}/task/taskscore",
                            data: {
                                taskid: taskid
                            },
                            success: function (resp) {
                                $("#taskdone_" + taskid).html("YES");
                                $("#taskscore_" + taskid).html(resp);
                            },
                            error: function (xhr) {
                            }
                        });
                    }
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $(document).on('change', '.bugurl', function () {
            var link = $(this);
            var bugurl = $(this).val();
            var taskid = link.data("taskid");
            var caseid = link.data("caseid");
            if (bugurl && bugurl !== "http://") {
                $.ajax({
                    type: "POST",
                    url:"${pageContext.request.contextPath}/taskcase/bugurl",
                    data: {
                        taskid: taskid,
                        caseid: caseid,
                        bugurl: bugurl
                    },
                    success: function (resp) {
                        var e1 = '<a class="buglink" href="' + bugurl + '" target="_blank"><img src="/images/bug.png" /></a>';
                        var e2 = '<input class="bugurl" data-taskid="' + taskid + '" data-caseid="' + caseid + '" type="url" value="' + bugurl + '">';
                        $("#bugurl_" + resp).html('');
                        $("#bugurl_" + resp).append(e1, e2);

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
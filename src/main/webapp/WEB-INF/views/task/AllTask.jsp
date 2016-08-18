<%@ include file="../common/IncludeTop.jsp"%>


<div>


        <table>
            <tr>
                <th><b>任务id</b></th>
                <th><b>任务名称</b></th>
                <th><b>用例已分配?</b></th>
                <th><b>执行人</b></th>
                <th><b>任务已完成?</b></th>
                <th><b>任务评分</b></th>
                <th><b>创建人</b></th>
                <th><b>修改人</b></th>
            </tr>
            <c:forEach var="task" items="${allTask}">
                <tr>
                    <td>${task.taskid}</td>
                    <td>${task.taskname}</td>
                    <td>${task.prepared}</td>
                    <td>${task.owner}</td>
                    <td>${task.taskdone}</td>
                    <td>${task.taskscore}</td>
                    <td>${task.creator}</td>
                    <td>${task.modifier}</td>

                    <%--<td><a href="${pageContext.request.contextPath}/task/editTaskForm?taskid=${task.taskid}&action=get">查看</a></td>--%>
                    <td><a href="${pageContext.request.contextPath}/task/editTaskForm?taskid=${task.taskid}&action=edit">编辑</a></td>
                    <td><a href="javascript:;" class="del">删除</a></td>
                </tr>
            </c:forEach>

        </table>
</div>




<%@ include file="../common/IncludeBottom.jsp"%>
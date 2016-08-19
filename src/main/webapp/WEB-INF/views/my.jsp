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
                    <th><b>已评分</b></th>
                    <th><b>评分</b></th>
                    <th><b>bug链接</b></th>
                </tr>
                <c:forEach items="${taskcaseMap.get(taskEntry.key)}" var="taskcase">
                    <c:set var="caseid">${taskcase.getCaseid()}</c:set>
                    <tr>
                        <td>${caseid}</td>
                        <td><a href="${pageContext.request.contextPath}/caselist/editCaselistForm?caseid=${caseid}&action=get">${caselistMap.get(caseid).casename}</a></td>
                        <td>${taskcase.getCasedone()}</td>
                        <td>${taskcase.getEvaluated()}</td>
                        <td>${taskcase.getCasescore()}</td>
                        <td>${taskcase.getBugurl()}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>





        <br/><br/><br/>
    </c:forEach>

</div>




<%@ include file="common/IncludeBottom.jsp"%>
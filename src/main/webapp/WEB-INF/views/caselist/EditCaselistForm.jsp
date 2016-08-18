<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
  <form:form modelAttribute="caselist"
             action="${pageContext.request.contextPath}/caselist/editCaselist">
<p>${action}</p>
    <h3>用例信息</h3>

    <table>
      <tr>
        <td>用例id:</td>
        <td><form:input path="caseid" value="${caselist.caseid}" /></td>
      </tr>
      <tr>
        <td>用例名称:</td>
        <td><form:input path="casename" value="${caselist.casename}" /></td>
      </tr>
      <tr>
        <td>一级模块:</td>
        <td><form:input path="belongmodulea" value="${caselist.belongmodulea}" /></td>
      </tr>
      <tr>
        <td>二级模块:</td>
        <td><form:input path="belongmoduleb" value="${caselist.belongmoduleb}" /></td>
      </tr>
      <tr>
        <td>三级模块:</td>
        <td><form:input path="belongmodulec" value="${caselist.belongmodulec}" /></td>
      </tr>
      <tr>
        <td>用例优先级:</td>
        <td><form:input path="priority" value="${caselist.priority}" /></td>
      </tr>
      <tr>
        <td>用例步骤:</td>
        <td><form:textarea path="casestep" value="${caselist.casestep}" /></td>
      </tr>
      <tr>
        <td>已评审?</td>
        <td><form:checkbox path="reviewed" checked="${caselist.reviewed}" /></td>
      </tr>
      <tr>
        <td>已自动化?</td>
        <td><form:checkbox path="automated" checked="${caselist.automated}"/></td>
      </tr>


      <input type="submit" name="newCaselist" value="提交" />
    </table>
  </form:form>
</div>




<%@ include file="../common/IncludeBottom.jsp"%>
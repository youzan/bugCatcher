<%@ include file="../common/IncludeTop.jsp"%>


    <div id="Catalog">
        <form:form modelAttribute="accountForm"
                   action="${pageContext.request.contextPath}/account/newAccount">

            <h3>用户注册</h3>

            <table>
                <tr>
                    <td>用户名:</td>
                    <td><form:input path="username" /></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><form:password path="password" /></td>
                </tr>
                <tr>
                    <td>确认密码:</td>
                    <td><form:password path="repeatedPassword" /></td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td><form:input size="40" path="email" /></td>
                </tr>
                <tr>
                    <td>角色:</td>
                    <td><form:radiobutton path="role" value="cs"/>测试</td>
                    <td><form:radiobutton path="role" value="kf"/>开发</td>
                    <td><form:radiobutton path="role" value="cp"/>产品</td>
                </tr>
            </table>

            <input type="submit" name="newAccount"
                   value="立即注册" />
        </form:form>
    </div>





<%@ include file="../common/IncludeBottom.jsp"%>
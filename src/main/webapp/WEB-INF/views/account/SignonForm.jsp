<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
    <c:if test="${not empty param.error}">
        <div class="alert alert-error">
            <h4 class="alert-heading">登录失败!</h4>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>

    <form action='${pageContext.request.contextPath}/account/signon'
          method="POST">

        <p>请输入您的用户名和密码.</p>
        <div class="form-group">
            <label for="j_username">用户名</label>
            <input type='text' id="j_username" name='j_username' value='admin'>
        </div>
        <br/>
        <div class="form-group">
            <label for="j_password">密码</label>
            <input type='password' id="j_password" name='j_password' value="j" />
        </div>


        <%--<input id="remember_me" name="remember-me" type="checkbox"/>--%>
        <%--<label for="remember_me" class="inline">记住我</label>--%>


        <%--<input name="submit" type="submit" value="登录" />--%>


        <div class="checkbox">
            <label>
                <input id="remember_me" name="remember-me" type="checkbox">记住我
            </label>
        </div>
        <button type="submit" class="btn btn-default" name="submit">登录</button>
    </form>

    新用户? <a href="${pageContext.request.contextPath}/account/newAccountForm">立即注册!</a>

</div>


<%@ include file="../common/IncludeBottom.jsp"%>
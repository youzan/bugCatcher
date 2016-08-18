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
        <p>
            用户名: <input type='text' name='j_username' value='admin'>
            <br />
            密码: <input type='password' name='j_password' value="j" />
        </p>
        <input name="submit" type="submit" value="登录" />
    </form>

    新用户? <a href="${pageContext.request.contextPath}/account/newAccountForm">立即注册!</a>

</div>


<%@ include file="../common/IncludeBottom.jsp"%>
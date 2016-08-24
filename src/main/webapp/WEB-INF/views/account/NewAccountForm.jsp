<%@ include file="../common/IncludeHead.jsp"%>
    <link href="../css/NewAccountForm.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <form:form class="form-newaccount" modelAttribute="accountForm"
               action="${pageContext.request.contextPath}/account/newAccount" method="POST">
        <h2 class="form-newaccount-heading">请入坑</h2>
        <label for="username" class="sr-only">用户名</label>
        <c:if test="${not empty duplicatedUsers}">
            <span class="error">${duplicatedUsers}</span>
        </c:if>
        <form:errors path="username" cssClass="error" />
        <form:input path="username" id="username" name='username' class="form-control" placeholder="用户名" required="true" autofocus="true"/>
        <label for="password" class="sr-only">密码</label>
        <form:errors path="password" cssClass="error" />
        <form:password path="password"  id="password" name='password' class="form-control" placeholder="密码" required="true"/>
        <label for="repeatedPassword" class="sr-only">确认密码</label>
        <form:errors path="repeatedPassword" cssClass="error" />
        <form:password path="repeatedPassword"  id="repeatedPassword" name='repeatedPassword' class="form-control" placeholder="确认密码" required="true"/>
        <label for="email" class="sr-only">邮箱</label>
        <form:errors path="email" cssClass="error" />
        <form:input size="40" path="email" id="email" name='email' class="form-control" placeholder="邮箱" required="true"/>

        <form:errors path="role" cssClass="error" />
        <label class="radio-inline">
            <form:radiobutton path="role" name="inlineRadioOptions" id="inlineRadiocs" value="cs" required="true"/> 测试
        </label>
        <label class="radio-inline">
            <form:radiobutton path="role" name="inlineRadioOptions" id="inlineRadiokf" value="kf" required="true"/> 开发
        </label>
        <label class="radio-inline">
            <form:radiobutton path="role" name="inlineRadioOptions" id="inlineRadiocp" value="cp" required="true"/> 产品
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">立即注册</button>
    </form:form>
</div> <!-- /container -->

<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>

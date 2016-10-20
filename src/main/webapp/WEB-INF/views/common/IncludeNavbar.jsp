</head>

<body>
<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}/my">捉虫记</a>
      <img id="Brand" alt="Brand" src="/images/capture_bug.png" style="height: 50px; width: 50px;">
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li <c:if test="${active_my == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/my">我的任务</a></li>
        <%--<sec:authorize access="isAuthenticated()">--%>
          <%--<sec:authentication property="principal.account" var="account" />--%>
          <%--<c:if test="${account.role != 'cs'}">--%>
            <%--<li <c:if test="${active_newTask == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/task/newTaskForm">新建任务</a></li>--%>
          <%--</c:if>--%>
        <%--</sec:authorize>--%>
        <li <c:if test="${active_newTask == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/task/newTaskForm">新建任务</a></li>
        <li <c:if test="${active_newCase == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/caselist/newCaselistForm">新建用例</a></li>
        <li <c:if test="${active_allCase == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/caselist/all">查看用例</a></li>
        <li <c:if test="${active_fileUpload == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/fileupload">自列用例</a></li>
        <li <c:if test="${active_chart == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/task/chart">执行质量</a></li>
        <sec:authorize access="isAuthenticated()">
          <sec:authentication property="principal.account" var="account" />
          <c:if test="${account.role == 'cs' || account.role == 'admin' || account.username == 'funny'}">
            <li <c:if test="${active_rank == true}">class="active"</c:if>><a href="${pageContext.request.contextPath}/task/rankForm">華山論劍</a></li>
          </c:if>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <sec:authorize access="isAuthenticated()">
          <sec:authentication property="principal.account" var="account" />
          <li><a href="#">${account.username}</a></li>
          <li><a href="${pageContext.request.contextPath}/account/signoff">退出</a></li>
        </sec:authorize>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
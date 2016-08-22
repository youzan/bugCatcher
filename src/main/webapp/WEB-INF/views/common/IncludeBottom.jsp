
</div>
<%--<div id="Footer">--%>
  <%--<div id="PoweredBy">--%>
    <%--&nbsp<a href="http://www.mybatis.org">www.mybatis.org</a>--%>
  <%--</div>--%>
  <%--<div id="Banner">--%>
    <%--<sec:authorize access="isAuthenticated()">--%>
      <%--<sec:authentication property="principal.account"--%>
                          <%--var="account" />--%>
      <%--<c:if test="${account.bannerOption}">${account.bannerName}<!-- XSS --></c:if>--%>
    <%--</sec:authorize>--%>
  <%--</div>--%>
<%--</div>--%>

  <div id="Footer">
    <div id="Banner">
      <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.account" var="account" />
        你好, ${account.username}<!-- XSS -->
      </sec:authorize>
      <br/>
      ${message}
    </div>
  </div>

<script type="text/javascript" src="<c:url value="/jquery/1.11/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js" />"></script>

</body>
</html>
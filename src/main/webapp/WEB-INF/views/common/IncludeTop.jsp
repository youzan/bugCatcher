<!DOCTYPE html>
<html>
<head>
  <%--<link rel="StyleSheet"--%>
        <%--href="${pageContext.request.contextPath}/resources/css/jpetstore.css"--%>
        <%--type="text/css" media="screen" />--%>

  <title>pfcase</title>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  <meta http-equiv="Cache-Control" content="max-age=0" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="expires" content="0" />
  <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
  <meta http-equiv="Pragma" content="no-cache" />
</head>

<body>
<div id="Header">

  <div id="Menu">
    <div id="MenuContent">
      <sec:authorize access="!isAuthenticated()">
        <a href="${pageContext.request.contextPath}/account/signonForm">登录</a>
      </sec:authorize>

      <sec:authorize access="isAuthenticated()">
        <a href="${pageContext.request.contextPath}/account/signoff">退出</a>
      </sec:authorize>
    </div>
  </div>


  <%--<div id="Logo">--%>
    <%--<div id="LogoContent">--%>
      <%--<a href="${pageContext.request.contextPath}/catalog/">--%>
        <%--<img--%>
                <%--src="${pageContext.request.contextPath}/resources/images/logo-topbar.gif" />--%>
      <%--</a>--%>
    <%--</div>--%>
  <%--</div>--%>

  <%--<div id="Menu">--%>
    <%--<div id="MenuContent">--%>
      <%--<a--%>
              <%--href="${pageContext.request.contextPath}/cart/viewCart">--%>
        <%--<img align="middle" name="img_cart"--%>
             <%--src="${pageContext.request.contextPath}/resources/images/cart.gif" />--%>
      <%--</a> <img align="middle"--%>
                <%--src="${pageContext.request.contextPath}/resources/images/separator.gif" />--%>

      <%--<sec:authorize access="!isAuthenticated()">--%>
        <%--<a--%>
                <%--href="${pageContext.request.contextPath}/account/signonForm">--%>
          <%--Sign In </a>--%>
      <%--</sec:authorize>--%>
      <%--<sec:authorize access="isAuthenticated()">--%>
        <%--<a--%>
                <%--href="${pageContext.request.contextPath}/account/signoff">--%>
          <%--Sign Out </a>--%>
        <%--<img align="middle"--%>
             <%--src="${pageContext.request.contextPath}/resources/images/separator.gif" />--%>
        <%--<a--%>
                <%--href="${pageContext.request.contextPath}/account/editAccountForm">--%>
          <%--My Account </a>--%>
      <%--</sec:authorize>--%>
      <%--<!--                 <img align="middle" -->--%>
      <%--&lt;%&ndash;                     src="${pageContext.request.contextPath}/resources/images/separator.gif" /> &ndash;%&gt;--%>
      <%--&lt;%&ndash;                 <a href="${pageContext.request.contextPath}/help.html">?</a> &ndash;%&gt;--%>
    <%--</div>--%>
  <%--</div>--%>

  <%--<div id="Search">--%>
    <%--<div id="SearchContent">--%>
      <%--<form--%>
              <%--action="${pageContext.request.contextPath}/catalog/"--%>
              <%--method="get">--%>
        <%--<input type="input" name="keyword" size="14" /> <input--%>
              <%--type="submit" name="searchProducts"--%>
              <%--value="Search" />--%>
      <%--</form>--%>
    <%--</div>--%>
  <%--</div>--%>

  <%--<div id="QuickLinks">--%>
    <%--<a--%>
            <%--href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=FISH"><img--%>
            <%--src="${pageContext.request.contextPath}/resources/images/sm_fish.gif" />--%>
    <%--</a> <img--%>
          <%--src="${pageContext.request.contextPath}/resources/images/separator.gif" />--%>
    <%--<a--%>
            <%--href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=DOGS"><img--%>
            <%--src="${pageContext.request.contextPath}/resources/images/sm_dogs.gif" />--%>
    <%--</a> <img--%>
          <%--src="${pageContext.request.contextPath}/resources/images/separator.gif" />--%>
    <%--<a--%>
            <%--href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=REPTILES"><img--%>
            <%--src="${pageContext.request.contextPath}/resources/images/sm_reptiles.gif" />--%>
    <%--</a> <img--%>
          <%--src="${pageContext.request.contextPath}/resources/images/separator.gif" />--%>
    <%--<a--%>
            <%--href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=CATS"><img--%>
            <%--src="${pageContext.request.contextPath}/resources/images/sm_cats.gif" />--%>
    <%--</a> <img--%>
          <%--src="${pageContext.request.contextPath}/resources/images/separator.gif" />--%>
    <%--<a--%>
            <%--href="${pageContext.request.contextPath}/catalog/viewCategory?categoryId=BIRDS"><img--%>
            <%--src="${pageContext.request.contextPath}/resources/images/sm_birds.gif" />--%>
    <%--</a>--%>
  <%--</div>--%>

</div>

<div id="Content">
<%--<c:if test="${!empty message}">--%>
  <%--<p>${f:h(message)}</p>--%>
<%--</c:if>--%>
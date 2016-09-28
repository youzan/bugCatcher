<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/UploadForm.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>


<div id="Content" class="container">
  <div class="fileupload">
    <h2>请上传自列用例</h2>
    <%--<form method="post" action="${pageContext.request.contextPath}/fileupload" enctype="multipart/form-data">--%>
        <%--&lt;%&ndash;<input type="text" name="name"/>&ndash;%&gt;--%>
        <%--<input type="file" name="file" class="form-control" />--%>
        <%--<button class="btn btn-lg btn-primary btn-block" type="submit">上传</button>--%>
    <%--</form>--%>
    <form:form class="form-horizontal" modelAttribute="multipartFileBucket" method="post" action="${pageContext.request.contextPath}/fileupload" enctype="multipart/form-data">
        <label for="multipartFile" class="sr-only">需上传的文件</label>
        <form:errors path="multipartFile" cssClass="error" />
        <form:input type="file" path="multipartFile" id="multipartFile" class="form-control" />
        <button class="btn btn-lg btn-primary btn-block" type="submit">上传</button>
    </form:form>
  </div>

  <%--<div class="filelist">--%>
    <%--<ul>--%>
      <%--<c:forEach var="file" items="${files}">--%>
        <%--<li class="fileli">--%>
          <%--<c:set var="urlParts" value="${fn:split(file, '/')}" />--%>
          <%--<a href="${file}">${urlParts[fn:length(urlParts)-1]}</a>--%>
        <%--</li>--%>
      <%--</c:forEach>--%>
    <%--</ul>--%>
  <%--</div>--%>

  <div class="list-group">
    <c:forEach var="file" items="${files}">
      <c:set var="urlParts" value="${fn:split(file, '/')}" />
      <a href="${file}"  class="list-group-item">${urlParts[fn:length(urlParts)-1]}</a>
    </c:forEach>
  </div>

</div> <!-- /container -->

<%@ include file="../common/IncludeJsVendor.jsp"%>
</body>
</html>
<%@ include file="../common/IncludeHead.jsp"%>
<link href="../css/Chart.css" rel="stylesheet">
<%@ include file="../common/IncludeNavbar.jsp"%>


<div id="Content" class="container">
  <canvas id="myChart"></canvas>
</div> <!-- /container -->


<%@ include file="../common/IncludeJsVendor.jsp"%>
<script type="text/javascript" src="<c:url value="/chart/Chart.min.js" />"></script>
<script>
  var ctx = document.getElementById("myChart");
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ${chartMap.keySet()},
      datasets: [{
        label: '质量评分',
        data: ${chartMap.values()},
        backgroundColor: ${backgroundColor},
        borderColor: ${borderColor},
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            max: 100,
            beginAtZero:true
          }
        }]
      }
    }
  });
</script>

</body>
</html>
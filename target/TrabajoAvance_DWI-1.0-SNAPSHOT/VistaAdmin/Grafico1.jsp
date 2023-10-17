

<%@page import="Dao.Cruds"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Gprecio, Dao.*" %>
<html>
  
  
  <script src=
"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
  <style>
    .container {
      width: 70%;
      margin: 15px auto;
    }
    body {
      text-align: center;
      color: green;
    }
    h2 {
      text-align: center;
      font-family: "Verdana", sans-serif;
      font-size: 30px;
    }
  </style>
  <body>
<%
          Graf obj=new Graf();
          String label="",data="";
          for(Gprecio g:obj.lisGprecio()){
          label +=g.getNom_Prod()+"',";
            data +=g.getPrecio()+",";
    }
   
   %>
    <div class="container">
      <h2></h2>
      <div>
        <canvas id="myChart"></canvas>
      </div>
    </div>
  </body>
  <script>
    var ctx = document.getElementById("myChart").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "bar",
      data: {
        labels: [<%=label%>],
        datasets: [
          {
            label: "Precio",
            data: [<%=data%>]
            backgroundColor: "rgba(153,205,1,0.6)",
          },
          
          },
        ],
      },
    });
  </script>
</html>

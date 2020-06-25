<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafico.aspx.cs" Inherits="GraficosGoogleCharts.Grafico" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Graficos</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        google.charts.setOnLoadCallback(drawChart2);
        google.charts.setOnLoadCallback(AreChart);

        function drawChart() {
            
            let data = google.visualization.arrayToDataTable(<%=obterDados()%>);

            let options = {
                title: 'Linguagens de Programação',
                Legend: {
                    position: "right",
                    textStyle: {
                        color: "#000000",
                        fontSize: 14
                    }
                },
                pieSliceText: 'none',
                slices: {
                    4: { offset: 0.2 },
                    12: { offset: 0.3 },
                    14: { offset: 0.4 },
                    15: { offset: 0.5 },
                },
            };

            let chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
        function drawChart2() {

            let data = google.visualization.arrayToDataTable(<%=obterDadosTopMais()%>);

            let options = {
                "title": 'Linguagens de Programação Mais Utilizadas',
                "backgroundColor": { "fill": "#ededed" },
                "pieHole": 0.4,
                "fontSize": 12,
                "pieSliceTextStyle": { "color": "#FFF" },
                "sliceVisibilityThreshold": false,
                "Legend": {
                    "position": "right",
                    "textStyle": {
                        "color": "#000000",
                        "fontSize": 14
                    }
                },
                "tooltip": {
                    "textStyle": { "color": "#000000" },
                    "showColorCode": false
                },
                "colors": ["#1f386b", "#DC3912", "#FF9900", "#109618", "#990099"]
            };

            let chart = new google.visualization.PieChart(document.getElementById('piechart2'));
            chart.draw(data, options);
        }
        function AreChart() {
            let data = google.visualization.arrayToDataTable(<%=obterDadosTopMenos()%>);

            let options = {
                title: "Linguagens de Programação Menos Populares",
                bar: { groupWidth: "95%" },
                legend: { position: "none" },
            };
            let chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
            chart.draw(data, options);
        }




    </script>
</head>
<body style="background-color:#000000;">
    <form id="form1" runat="server"  >
        <div style="margin-top:-10px;  background-color:#ff0000;  display:flex;  justify-content:center; align-content:center;">
            <h1 style="color:#ffffff; font-style:italic; font-size:35px;">DashBoard</h1>
        </div>
        <div style="display:flex; flex-direction:column; align-content:center; justify-content:center; width:100%; ">
          <div style=" flex-direction:row; display:flex; align-content:center; justify-content:center;">
             <div id="piechart" style="width: 100%; height: 250px; padding:5px;"></div>
             <div id="piechart2" style="width: 100%; height: 250px; padding:5px;"></div>            
           </div>
            <div style=" flex-direction:row; display:flex; align-content:center; justify-content:center;">
                <div id="barchart_values" style="width: 100%; height: 280px; padding:5px;"></div>
            </div>
        </div>
    </form>
</body>
</html>

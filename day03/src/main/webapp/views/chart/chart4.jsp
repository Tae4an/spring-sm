<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #container {
        width: 700px;
        height: 400px;
        border: 1px solid indianred;
    }
</style>
<script>
    let chart4 = {
        init: function () {
            this.getData();
            setInterval(()=>{
                this.getData();
            },5000);
        },
        getData: function() {
            $.ajax({
                url: '/charts/getData',
                type: 'GET',
                dataType: 'json',
                    success: function(response) {
                        console.log("Received data:", response);
                    this.display(response);
                }.bind(this)
            });
        },
        display: function (data) {
            console.log("Displaying data:", data);
            if (!Array.isArray(data)) {
                console.error("Invalid data format. Expected an array.");
                return;
            }
            try {
                Highcharts.chart('container', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: 'Monthly Average Temperature'
                    },
                    subtitle: {
                        text: 'Source: Random Data'
                    },
                    xAxis: {
                        categories: [
                            'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep',
                            'Oct', 'Nov', 'Dec'
                        ]
                    },
                    yAxis: {
                        title: {
                            text: 'Temperature (°C)'
                        }
                    },
                    plotOptions: {
                        line: {
                            dataLabels: {
                                enabled: true
                            },
                            enableMouseTracking: false
                        }
                    },
                    series: data
                });
            } catch (e) {
                console.error("Error creating chart:", e);
            }
        }
    };

    $(function () {
        chart4.init();
    });
</script>
<div class="col-sm-10">
    <h2>Chart4 Page</h2>
    <div id="container"></div>
</div>
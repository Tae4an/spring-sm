<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #container{
        width: 700px;
        height: 400px;
        border: 1px solid indianred;
    }
</style>
<script>
    let chart1 = {
        init:function (){
            this.getData();
            setInterval(()=>{
                this.getData();
            },5000);
        },
        getData:function (){

            $.ajax({
                url:'<c:url value="/charts/chart1"/>',
                success:(response)=>{
                    this.display(response);
                }
            });
        },
        display:function (response){
            // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
            Highcharts.chart('container', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                        'target="_blank">Wikipedia.com</a>'
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
                series: response
            });

        }
    }
    $(function (){
       chart1.init();
    });
</script>
<div class="col-sm-10">

    <h2>Chart1 Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <div id = "container"></div>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .chart-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        gap: 20px;
        width: 100%;
        height: 650px;
        max-width: 1500px;
        margin: 0 auto;
    }

    .chart-container {
        width: 500px;
        height: 300px;
        border: 1px solid indianred;
    }
</style>
<script>
    let chart3 = {
        getData: function (endpoint, callback) {
            $.ajax({
                url: '<c:url value="/charts/chart3/"/>' + endpoint,
                success: callback
            });
        }
    };

    let chart3Ex1 = {
        init: function () {
            chart3.getData('ex1', this.display);
        },
        display: function (response) {
            Highcharts.chart('container1', {
                chart: {type: 'line'},
                title: {text: 'Fruit Production Over Time'},
                xAxis: {categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']},
                yAxis: {title: {text: 'Units'}},
                series: response
            });
        }
    };

    let chart3Ex2 = {
        init: function () {
            chart3.getData('ex2', this.display);
        },
        display: function (response) {
            Highcharts.chart('container2', {
                chart: {type: 'column'},
                title: {text: 'Population in Major Cities'},
                xAxis: {type: 'category'},
                yAxis: {title: {text: 'Population (thousands)'}},
                series: [{name: 'Cities', colorByPoint: true, data: response}]
            });
        }
    };

    let chart3Ex3 = {
        init: function () {
            chart3.getData('ex3', this.display);
        },
        display: function (response) {
            Highcharts.chart('container3', {
                chart: {type: 'bar'},
                title: {text: 'Population Pyramid'},
                xAxis: [{categories: response.map(item => item.name), reversed: false}],
                yAxis: {title: {text: 'Population'}},
                series: [
                    {name: 'Male', data: response.map(item => item.data[0])},
                    {name: 'Female', data: response.map(item => item.data[1])}
                ]
            });
        }
    };

    let chart3Ex4 = {
        init: function () {
            chart3.getData('ex4', this.display);
        },
        display: function (response) {
            Highcharts.chart('container4', {
                chart: {type: 'pie'},
                title: {text: 'Browser Market Share'},
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{name: 'Share', colorByPoint: true, data: response}]
            });
        }
    };

    $(function () {
        chart3Ex1.init();
        chart3Ex2.init();
        chart3Ex3.init();
        chart3Ex4.init();
    });
</script>

<div class="col-sm-9">
    <h2>Chart 3 Examples</h2>
    <div class="row-sm-2">
        <div class="chart-grid">
            <div id="container1" class="chart-container"></div>
            <div id="container2" class="chart-container"></div>
            <div id="container3" class="chart-container"></div>
            <div id="container4" class="chart-container"></div>
        </div>
    </div>
</div>
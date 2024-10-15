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
    let chart2 = {
        init: function () {
            this.getData();

            $('#year-select').change((event) => {
                let selectYear = $(event.target).val();
                this.getData(selectYear);
            });
        },

        getData: function (selectYear) {
            let url = '<c:url value="/charts/chart2"/>';
            if (selectYear) {
                url += '/' + selectYear;
            }
            $.ajax({
                url: url,
                success: (response) => {
                    this.display(response);
                }
            });
        },

        display: function (response) {
            Highcharts.chart('container', {
                chart: {
                    type: 'area'
                },
                accessibility: {
                    description: '화면에서 2020년부터 2024년까지 select form 을 구성해서, 버튼을 클릭하면 월별 남자, 여자 매출을 각 월에 chart로 출력'
                },
                title: {
                    text: '월별 남녀 매출 차트'
                },
                subtitle: {
                    text: 'Source: <a href="https://fas.org/issues/nuclear-weapons/status-world-nuclear-forces/" ' +
                        'target="_blank">FAS</a>'
                },
                xAxis: {
                    categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    accessibility: {
                        rangeDescription: 'Range: 1월 to 12월'
                    }
                },
                yAxis: {
                    title: {
                        text: '매출 (원)'
                    }
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.y:,.0f}</b> 원'
                },
                plotOptions: {
                    area: {
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                series: response
            });
        }
    };

    $(function () {
        chart2.init();
    });
</script>
<div class="col-sm-10">
    <h2>Chart2 Page</h2>
    <div id="container"></div>
    <div class="row-sm-2">
        <select id="year-select" name="year">
            <option value="">연도를 선택해주세요</option>
            <option value="2020">2020년</option>
            <option value="2021">2021년</option>
            <option value="2022">2022년</option>
            <option value="2023">2023년</option>
            <option value="2024">2024년</option>
        </select>
    </div>
</div>
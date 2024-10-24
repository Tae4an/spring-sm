<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #dataTable img {
        width: 100px !important;
    }

    .quantity-controls {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .quantity-controls button {
        padding: 2px 8px;
        border: 1px solid #ddd;
        background: #f8f9fc;
        border-radius: 4px;
        cursor: pointer;
    }

    .quantity-controls button:hover {
        background: #eaecf4;
    }

    .quantity-controls input {
        width: 50px;
        text-align: center;
        padding: 4px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .table-active {
        background-color: #f8f9fc !important;
    }
    .text-right {
        text-align: right !important;
    }
    .font-weight-bold {
        font-weight: bold !important;
    }
    #cart-total {
        font-size: 1.1em;
        color: #4e73df;
    }
</style>

<script>
    $(document).ready(function () {
        // 수량 변경 버튼 클릭 이벤트
        $('.quantity-btn').on('click', function () {
            const $btn = $(this);
            const $container = $btn.closest('.quantity-controls');
            const $input = $container.find('input');
            const $row = $btn.closest('tr');

            const currentValue = parseInt($input.val());
            const change = parseInt($btn.data('change')); // parseInt 추가
            const newValue = currentValue + change;

            // 수량이 1 미만이 되지 않도록 체크
            if (newValue < 1) return;

            // CartDto에 맞는 데이터 구성
            const cartData = {
                custId: $container.data('custId'),
                itemId: $container.data('itemId'),
                count: newValue,
            };

            // AJAX 요청
            $.ajax({
                url: '<c:url value="/cart/update_quantity"/>',
                type: 'POST',
                data: cartData,
                dataType: 'text',
                success: function (response) {
                    if (response === 'success') {
                        updateUI($row, newValue);
                    } else {
                        alert('수량 업데이트에 실패했습니다.');
                        console.log('Server response:', response);
                        $input.val(currentValue);
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                    console.log('Status:', status);
                    console.log('Response:', xhr.responseText);
                    alert('수량 업데이트 중 오류가 발생했습니다.');
                    $input.val(currentValue);
                }
            });
        });
        function updateUI($row, newValue) {
            // 수량 입력 필드 업데이트
            $row.find('input[type="number"]').val(newValue);

            // 현재 행의 총 가격 계산 및 업데이트
            const unitPrice = parseInt($row.find('.item-price').data('unitPrice'));
            const newTotal = unitPrice * newValue;

            // 총 가격 표시 업데이트
            $row.find('.total-price').text(
                new Intl.NumberFormat('ko-KR').format(newTotal) + '원'
            );

            // 장바구니 전체 금액 업데이트
            updateCartTotal();
        }

        // 장바구니 전체 금액 계산 함수
        function updateCartTotal() {
            let total = 0;
            $('#dataTable tbody tr').each(function() {
                const quantity = parseInt($(this).find('input[type="number"]').val());
                const unitPrice = parseInt($(this).find('.item-price').data('unitPrice'));
                total += quantity * unitPrice;
            });

            // 총 금액 업데이트
            $('#cart-total').text(new Intl.NumberFormat('ko-KR').format(total) + '원');
        }
    });
</script>


<div class="col-sm-10">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-bold">장바구니</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable">
                <thead class="thead-dark">
                <tr>
                    <th>Image</th>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Count</th>
                    <th>Price</th>
                    <th>Reg Date</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cart" items="${cartlist}">
                    <tr>
                        <td>
                            <a href="<c:url value="/cart/detail"/>?custId=${cart.custId}&itemId=${cart.itemId}">
                                <img src="<c:url value="/imgs"/>/${cart.imgName}">
                            </a>
                        </td>
                        <td>${cart.custId}</td>
                        <td>${cart.itemName}</td>
                        <td>
                            <div class="quantity-controls" data-cust-id="${cart.custId}" data-item-id="${cart.itemId}">
                                <button type="button" class="quantity-btn" data-change="-1">-</button>
                                <input type="number" value="${cart.count}" min="1" readonly>
                                <button type="button" class="quantity-btn" data-change="1">+</button>
                            </div>
                        </td>
                        <td class="item-price" data-unit-price="${cart.itemPrice}">
                            <fmt:formatNumber type="number" pattern="###,###원" value="${cart.itemPrice}"/>
                        </td>
                        <td>
                            <fmt:parseDate value="${cart.regDate}"
                                           pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${parsedDateTime}"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr class="table-active">
                    <td colspan="4" class="text-right font-weight-bold">총 결제 금액:</td>
                    <td colspan="2" class="font-weight-bold" id="cart-total">
                        <!-- JSTL로 초기 총 금액 계산 -->
                        <c:set var="total" value="0"/>
                        <c:forEach var="cart" items="${cartlist}">
                            <c:set var="total" value="${total + (cart.itemPrice * cart.count)}"/>
                        </c:forEach>
                        <fmt:formatNumber type="number" pattern="###,###원" value="${total}"/>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>


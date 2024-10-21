<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #car_img {
        width: 400px;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>
<script>
    let carDetail = {
        init:function() {
            $('#update_btn').click(() => {
                this.check();
            });
            $('#delete_btn').click(() => {
                let c = confirm("삭제하시겠습니까?");
                if(c == true){
                    location.href='<c:url value="/car/delete_impl"/>'+'?id='+ ${car.carId};
                }

            });
        },
        check:function(){
            let carName = $('#carName').val();
            let carPrice = $('#carPrice').val();
            let carColor = $('#carColor').val();
            let carType = $('#carType').val();

            if(carName == '' || carName == null){
                alert('CarName is Mandatory');
                $('#carName').focus();
                return;
            }
            if(carPrice == '' || carPrice == null){
                alert('CarPrice is Mandatory');
                $('#carPrice').focus();
                return;
            }
            if(carColor == '' || carColor == null){
                alert('CarColor is Mandatory');
                $('#carColor').focus();
                return;
            }
            if(carType == '' || carType == null){
                alert('CarType is Mandatory');
                $('#carType').focus();
                return;
            }
            this.send();
        },
        send:function(){
            // method, action
            $('#detail_form').attr('method','post');

            $('#detail_form').attr('action','/car/update_impl');
            $('#detail_form').submit();
        }
    };

    $(function(){
        carDetail.init();
    });
</script>
<div class="col-sm-10">
    <h2>Car Detail Page</h2>
    <div class="row">
        <div class="col-sm-8">
            <form id="detail_form">
                <img id = car_img src= <c:url value="'/img/car/${car.carImg}'"/> />
                <div class="form-group">
                    <label for="carName">Name:<span id="name_span"></span></label>
                    <input type="text" value="${car.carName}" class="form-control" placeholder="Enter Name" id="carName" name="carName">
                </div>
                <div class="form-group">
                    <label for="carPrice">Price:</label>
                    <input type="text" value="${car.carPrice}" class="form-control" placeholder="Enter Price" id="carPrice" name="carPrice">
                </div>
                <div class="form-group">
                    <label for="carColor">Color:</label>
                    <input type="text" value="${car.carColor}" class="form-control" placeholder="Enter Color" id="carColor" name="carColor">
                </div>
                <div class="form-group">
                    <label for="carType">Type:</label>
                    <input type="text" value="${car.carType}" class="form-control" placeholder="Enter Type" id="carType" name="carType">
                </div>
                <button type="button" id="update_btn" class="btn btn-primary">Update</button>
                <button type="button" id="delete_btn" class="btn btn-primary">Delete</button>
            </form>
        </div>
    </div>
</div>
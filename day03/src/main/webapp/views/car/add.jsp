<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    /*#car_img {*/
    /*    width: 400px;*/
    /*    display: block;*/
    /*    margin-left: auto;*/
    /*    margin-right: auto;*/
    /*}*/
</style>
<script>
    let carAdd = {
        init: function () {
            $('#submit_btn').click(() => {
                this.check();
            });
        },
        check: function () {
            let carName = $('#carName').val();
            let carPrice = $('#carPrice').val();
            let carColor = $('#carColor').val();
            let carType = $('#carType').val();
            let carImg = $('#carImg').val();

            if (carName == '' || carName == null) {
                alert('CarName is Mandatory');
                $('#carName').focus();
                return;
            }
            if (carPrice == '' || carPrice == null) {
                alert('CarPrice is Mandatory');
                $('#carPrice').focus();
                return;
            }
            if (carColor == '' || carColor == null) {
                alert('CarColor is Mandatory');
                $('#carColor').focus();
                return;
            }
            if (carType == '' || carType == null) {
                alert('CarType is Mandatory');
                $('#carType').focus();
                return;
            }
            if (carImg == '' || carImg == null) {
                alert('CarImg is Mandatory');
                $('#carImg').focus();
                return;
            }
            this.send();
        },
        send: function () {
            // method, action
            $('#add_form').attr('method', 'post');

            $('#add_form').attr('action', '/car/insert_impl');
            $('#add_form').submit();
        }
    };

    $(function () {
        carAdd.init();
    });
</script>
<div class="col-sm-10">
    <h2>Car Add Page</h2>
    <div class="row">
        <div class="col-sm-8">
            <form id="add_form">
                <div class="form-group">
                    <label for="carName">Name:<span id="name_span"></span></label>
                    <input type="text"  class="form-control" placeholder="Enter Name" id="carName"
                           name="carName">
                </div>
                <div class="form-group">
                    <label for="carPrice">Price:</label>
                    <input type="text"  class="form-control" placeholder="Enter Price"
                           id="carPrice" name="carPrice">
                </div>
                <div class="form-group">
                    <label for="carColor">Color:</label>
                    <input type="text"  class="form-control" placeholder="Enter Color"
                           id="carColor" name="carColor">
                </div>
                <div class="form-group">
                    <label for="carType">Type:</label>
                    <input type="text"  class="form-control" placeholder="Enter Type" id="carType"
                           name="carType">
                </div>
                <div class="form-group">
                    <label for="carImg">Car Image:</label>
                    <input type="file" class="form-control-file" id="carImg" name="carImg" accept="image/*">
                </div>
                <button type="button" id="submit_btn" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
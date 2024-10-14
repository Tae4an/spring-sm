<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let register = {
        init: function () {
            $('#register_form > button').click(() => {
                this.check();
            });
            $("#id").keyup(() => {
                $('id_span').text('ID는 4자리 이상');
                let id = $('#id').val();
                if (id.length >= 4) {
                    $.ajax({
                        url: '<c:url value="/check_id"/>',
                        data: {'r_id': id},
                        success: function (response) {
                            if (response.result == 1) {
                                $('#id_span').text('사용 불가능한 ID 입니다..!').css('color', 'red');
                            } else {
                                $('#id_span').text('사용 가능한 ID 입니다.').css('color', 'green');
                            }
                        }
                    });
                }
            });
        },
        check: function () {
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let name = $('#name').val();
            if (id == '' || id == null) {
                alert('Id is Mandatory');
                $('#id').focus();
                return;
            }
            if (pwd == '' || pwd == null) {
                alert('Pwd is Mandatory');
                $('#pwd').focus();
                return;
            }
            if (name == '' || name == null) {
                alert('Name is Mandatory');
                $('#name').focus();
                return;
            }
            this.send();
        },
        send: function () {
            // method, action
            $('#register_form').attr('method', 'post');

            $('#register_form').attr('action', '/register_impl');
            $('#register_form').submit();
        }
    }
    $(function () {
        register.init();
    });
</script>
<div class="col-sm-10">

    <h2>Register Page</h2>
    <div class="row">
        <div class="col-sm-10">
            <form id="register_form">
                <div class="mb-3 mt-3">
                    <label for="id" class="form-label">ID:</label>
                    <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" required>
                    <span id="id_span"></span>
                </div>
                <div class="mb-3">
                    <label for="pwd" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd"
                           required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" required>
                </div>
                <button type="button" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>

</div>
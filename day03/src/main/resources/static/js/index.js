let js4 = {
    data:null,
    init:function(){
        $('#btn_get').click(()=>{
            this.getdata();
        });
    },
    getdata:function(){
        let datas = [
            {'id':'id01','name':'james1','age':10},
            {'id':'id02','name':'james2','age':20},
            {'id':'id03','name':'james3','age':30},
            {'id':'id04','name':'james4','age':40},
            {'id':'id05','name':'james5','age':50}
        ];
        this.display(datas);
    },
    display:function(datas){
        let result = '';
        $(datas).each(function(index, data){
            result += '<tr>';
            result += '<td>'+ data.id +'</td>';
            result += '<td>'+ data.name +'</td>';
            result += '<td>'+ data.age +'</td>';
            result += '</tr>';
        });
        $('#cdata > tbody').html(result);
    }
};

let js5 = {
    init:function(){
        $('#login_form > button').click(()=>{
            this.check();
        });
    },
    check:function(){
        let id = $('#id').val();
        let pwd = $('#pwd').val();
        if(id == '' || id == null){
            alert('Id is Mandatory');
            $('#id').focus();
            return;
        }
        if(pwd == '' || pwd == null){
            alert('Pwd is Mandatory');
            $('#pwd').focus();
            return;
        }
        this.send();
    },
    send:function(){
        // method, action
        $('#login_form').attr('method','post');

        $('#login_form').attr('action','/loginimpl');
        $('#login_form').submit();
    }
};

let js6 = {
    init: function(){
        $('#btn_signup').click(() => {
            this.check();
        });
        this.addValidationListeners();
    },
    check: function(){
        if (!this.checkPasswordMatch()) return;
        if (!this.checkEmailValidity()) return;

        this.send();

    },
    addValidationListeners: function() {
        $('#pwd, #pwd_confirm').on('input', this.checkPasswordMatch.bind(this));
        $('#email').on('input', this.checkEmailValidity.bind(this));
        console.log('Validation listeners added');
    },

    checkEmailValidity: function() {
        console.log('Checking email validity'); // 디버깅 로그
        let email = $('#email');
        let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        let errorElement = $('#email_error'); // ID로 오류 메시지 요소 선택

        if (emailRegex.test(email.val())) {
            email.css('border-color', 'green');
            errorElement.text('유효한 이메일 주소입니다.').css('color', 'green').show();
            console.log('Email is valid'); // 디버깅 로그
            return true;
        } else {
            email.css('border-color', 'red');
            errorElement.text('올바른 이메일 주소를 입력해주세요.').css('color', 'red').show();
            console.log('Email is invalid'); // 디버깅 로그
            return false;
        }
    },
    checkPasswordMatch: function() {
        let pwd = $('#pwd').val();
        let pwdConfirm = $('#pwd_confirm').val();
        let message = $('#pwd_match_message');

        if (pwd === pwdConfirm) {
            message.text('비밀번호가 일치합니다.').css('color', 'green');
            $('#pwd_confirm').css('border-color', 'green');
            return true;
        } else {
            message.text('비밀번호가 일치하지 않습니다.').css('color', 'red');
            $('#pwd_confirm').css('border-color', 'red');
            return false;
        }
    },
    send: function(){
        $('#signup_form').attr('method', 'post');
        $('#signup_form').attr('action', '/signup_impl');
        $('#signup_form').submit();
    }
};
let login = {
    init:function(){
        $('#login_form > button').click(()=>{
            this.check();
        });
    },
    check:function(){
        let id = $('#id').val();
        let pwd = $('#pwd').val();
        if(id == '' || id == null){
            alert('Id is Mandatory');
            $('#id').focus();
            return;
        }
        if(pwd == '' || pwd == null){
            alert('Pwd is Mandatory');
            $('#pwd').focus();
            return;
        }
        this.send();
    },
    send:function(){
        // method, action
        $('#login_form').attr('method','post');

        $('#login_form').attr('action','/login_impl');
        $('#login_form').submit();
    }
};

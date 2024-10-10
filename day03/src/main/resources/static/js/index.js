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
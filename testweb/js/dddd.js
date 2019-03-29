/// <reference path="_references.js" />
/// <reference path="jquery.md5.js" />

function ShowLoginBox()
{
    layer.open({
        type: 1,
        title: "用户登录",
        //设置div大小
        area: ["390px", "300px"],
        content: '$("#loginBox")'
    });
}

function login()
{
    //1.获取到用户名和密码
    var username = $.trim($("#TxtUserName").val());
    var pwd =$.md5( $.trim($("#TxtPwd").val()));
    //2.判断用户名和密码是否为空
    if (username == "" || pwd == "") {
        layer.alert("用户名或密码不能为空！",
            {
                title: "提示:",
                icon: 5
            });
    }
    else
    {
        $.post("/Handler1.ashx", { "UserName": username, "Pwd": pwd,"cmd":"login" }, function (data)
        {
            if (data == "登录成功") {
                //layer.alert("登录成功！",
                layer.msg("登录成功！",
                    {
                        //title: "提示:",
                        icon: 6
                    });
            }
            else
            {
                layer.msg("用户名或密码不正确",
                    {
                        //title: "提示:",
                        icon: 5
                    });
            }
        });
    }
}

function ShowRegBox()
{
    layer.open({
        type:1,
        title:"注册",
        area: ["390px", "350px;"],
        //div的内容
        content:$("#Regbox")
    });
}

function Reglogin()
{
    //1.获取到输入的内容
    var username = $.trim($("#TxtRegUserName").val());
    var pwd =$.md5($.trim($("#TxtRegPwd").val()));
    var qq = $.trim($("#TxtRegqq").val());
    var email = $.trim($("#TxtRegEmail").val());
    //并做判断
    if (username == "" || pwd == "") {
        layer.msg("用户名或密码不能为空！");
    }
    else
    {//cmd用做标示，判断是注册还是登录
        $.post("/Handler1.ashx", { "UserName": username, "Pwd": pwd,"qq":qq,"email":email,"cmd": "reg" }, function (data)
        {
            if (data == "注册成功") {
                layer.msg("恭喜你，注册成功！",
                    {
                        icon: 6
                    });
            }
            else
            {
                layer.msg(data,
                    {
                        icon:5
                    });
            }
        });
    }
}
<%--
  Created by IntelliJ IDEA.
  User: 10489
  Date: 2018/12/5
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试页面</title>
    <jsp:include page="common/mystyle.jsp"></jsp:include>
    <!--  div样式  -->
    <style type="text/css">
        .box {
            position:relative;width: 100%;height: 100% ;top: 0; left: 0;
        }
        .zuo {
            float: left;
            position:relative;width: 40%;height: 90% ;top: 5%; left: 5%;
        }
        .you {
            float: left;
            position:relative;width: 40%;height: 90% ;top: 5%; left: 5%;
        }
        .zhong {
            float: left;
            position:relative;width: 5%;height: 90% ;top: 5%; left: 5%;
        }
        .img2 {
            width:auto;
            height:auto;
            max-width:100%;
            max-height:100%;
        }
    </style>


</head>
<body>

<div class="box">
    <div class="zuo">
        <form id="registeredForm">
        <div>
            <div class="row form-group">
                <h2>注册</h2>
                <label class="control-label col-lg-6"></label>
                <div class="col-lg-4 col-md-6">
                    我已经注册,现在就<a href="#" onclick="toLoginJsp()">登录</a>
                </div>
            </div>
            <div class="row form-group">
            <label class="control-label right col-lg-3" for="fullPhone">图形验证码</label>
            <div class="col-lg-4 col-md-6">
                <input class="form-control" name="code" id="code" type="text" placeholder="图形验证码">
            </div>
            <img src="<%=request.getContextPath()%>/user/checkCode.do"  id="img">
        </div>
            <div class="row form-group">
                <label class="control-label right col-lg-3" for="fullPhone">手机号</label>
                <div class="col-lg-7 col-md-6">
                    <input class="form-control" name="fullPhone" id="fullPhone" type="text" placeholder="请输入你的手机号">
                </div>
            </div>
            <div class="row form-group">
                <label class="control-label right col-lg-3" for="loginPwd">设置密码</label>
                <div class="col-lg-7 col-md-6">
                    <input class="form-control" name="loginPwd" id="loginPwd" type="password" placeholder="6-20位字母、符号或数字">
                </div>
            </div>
            <div class="row form-group">
                <label class="control-label  right col-lg-3" for="confirmPassword">确认密码</label>
                <div class="col-lg-7 col-md-6">
                    <input class="form-control" name="confirmPassword" id="confirmPassword" type="password" placeholder="再次输入密码">
                </div>
            </div>
            <div class="row form-group">
                <label class="control-label right col-lg-3" for="inviteCode">邀请码</label>
                <div class="col-lg-7 col-md-6">
                    <input class="form-control" name="inviteCode" id="inviteCode" type="text" placeholder="邀请码">
                </div>
            </div>
            <div class="row form-group">
                <label class="control-label right col-lg-3"></label>
                <div class="col-lg-7 col-md-6">
                    <button type="submit" class="btn btn-success">立即注册</button>
                </div>
            </div>
        </div>
        </form>
    </div>
    <div class="zhong"></div>
    <div class="you">
        <img src="<%=request.getContextPath()%>/photo/registered.jpg" class="img2">
    </div>
</div>
<script type="text/javascript">
    $(function(){
        //按回车键登陆了
        $(document).keydown(function (event) {
            if(event.keyCode==13){
                //文本框提交验证
                $("#registeredForm").bootstrapValidator({
                    /*根据验证结果显示的各种图标*/
                    message: 'This value is not valid',
                    excluded : [':disabled'],
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    /*去校验表单元素  用户名  密码*/
                    /*校验状态：未校验 NOT_VALIDATED 正在校验 VALIDATING  校验成功 VALID 校验失败 INVALID */
                    /*校验规则：是需要去配置*/
                    /* fields 字段 --->  表单内的元素*/
                    fields: {
                        /*指定需要校验的元素  通过name数据去指定*/
                        fullPhone: {
                            /*配置校验规则  规则不止一个*/
                            message: '用户名验证失败',
                            validators: {
                                /*配置具体的规则*/
                                notEmpty: {
                                    /*校验不成功的提示信息*/
                                    message: '账号不能为空'
                                },
                                regexp : {
                                    regexp : /^[1][3,4,5,7,8][0-9]{9}$/,
                                    message : '手机号格式不对'
                                },
                            }
                        },
                        loginPwd: {
                            validators: {
                                notEmpty: {
                                    message: '密码不能为空'
                                },
                                stringLength: {
                                    min: 6,
                                    max: 18,
                                    message: '密码长度必须在6到18位之间'
                                },
                            }
                        },
                        confirmPassword: {
                            validators: {
                                notEmpty: {
                                    message: '密码不能为空'
                                },
                                identical: {
                                    field: 'loginPwd',
                                    message: '用户密码与确认密码不一致！'
                                },
                                stringLength: {
                                    min: 6,
                                    max: 18,
                                    message: '密码长度必须在6到18位之间'
                                },
                            }
                        },
                        code: {
                            validators: {
                                notEmpty: {
                                    message: '验证码不能为空'
                                },
                                callback: {
                                    message: '验证码错误'
                                }
                            }
                        },
                        inviteCode: {
                            validators: {
                                regexp : {
                                    regexp : /^\d{6}$/,
                                    message : '验证码只能是6位数字'
                                },
                            }
                        },
                    },
                }).on('success.form.bv', function (e) {
                    /*阻止浏览器默认行为*/
                    e.preventDefault();
                    var $form = $(e.target);
                    /*发登录请求*/
                    $.ajax({
                        type: 'post',
                        url: '<%=request.getContextPath()%>/user/registered.do',
                        /*可传递的数据格式  对象  序列化后的数据  key=value的字符串  [{name:'',value},...] */
                        data: $form.serialize(),
                        success: function (result) {
                            //1.参数为3 进判断, 表名验证码错误
                            if (result == 3) {
                                //1.2 弹出提示框 验证码错误
                                /*调用校验插件  让该选项置为 校验失败状态 提示校验失败的信息*/
                                /*updateStatus(‘哪个元素’，‘修改为什么状态’，‘校验规则’)*/
                                $form.data('bootstrapValidator').updateStatus('code', 'INVALID', 'callback')
                            }
                            else {
                                location.href="<%=request.getContextPath()%>/login.jsp";
                            }
                        }
                    })
                })
            }
        })
    })
    //点击验证码更换图片
    $("#img").click(function(){

        //时间戳
        $(this).prop("src","<%=request.getContextPath()%>/user/checkCode.do?"+new Date());

    })
    //注册方法
/*    function changeImg(){
        $.ajax({
            url:"<%=request.getContextPath()%>/user/registered.do",
            type:"post",
            data:$("#registeredForm").serialize(),
            success:function (result) {
                if(result == 3){
                    bootbox.alert("验证码错误",function(){
                    $("#img").prop("src","<%=request.getContextPath()%>/user/checkCode.do?"+new Date());
                    });
                }else{
                    bootbox.alert("注册成功!!")
                    location.href="<%=request.getContextPath()%>/login.jsp";
                }
            }
        })
    }*/
    //跳转到登录页面
    function toLoginJsp() {
        location.href="<%=request.getContextPath()%>/login.jsp";
    }
</script>
</body>
</html>

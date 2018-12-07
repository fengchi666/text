<%--
  Created by IntelliJ IDEA.
  User: 10489
  Date: 2018/12/4
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录页面</title>
    <jsp:include page="common/mystyle.jsp"></jsp:include>
    <!--  div样式  -->
    <style type="text/css">
      .box {
        position:relative;width: 100%;height: 100% ;top: 0; left: 0;right: 0;
      }
      .zuo {
        float: left;
        position:relative;width: 50%;height: 70% ;top: 10%; left: 10%; right: 10%;
      }
      .you {
        float: left;
        position:relative;width: 35%;height: 70% ;top: 10%; left: 10%; right: 10% ;
      }
      .zhong {
        float: left;
        position:relative;width: 5%;height: 70% ;top: 10%; left: 10%; right: 10% ;
      }
      .img {
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
      <img src="<%=request.getContextPath()%>/photo/login.jpg" class="img">
    </div>
    <div class="zhong"></div>
    <div class="you">
      <form id="loginForm">
        <div>
          <div class="row form-group">
            <h4>欢迎登陆</h4>
            <label class="control-label col-lg-3"></label>
            <label class="control-label col-lg-4">还有没账号？<a href="#" onclick="toRegisteredJsp()">立即注册</a></label>
          </div>
          <div class="row form-group">
            <label class="control-label right col-lg-2" for="fullPhone">账号</label>
            <div class="col-lg-5 col-md-6">
              <input class="form-control" name="fullPhone" id="fullPhone" type="text" placeholder="已验证手机" check-type="required">
            </div>
          </div>
          <div class="row form-group">
            <label class="control-label right col-lg-2" for="loginPwd">密码</label>
            <div class="col-lg-5 col-md-6">
              <input class="form-control" name="loginPwd" id="loginPwd" type="password" placeholder="密码">
            </div>
          </div>
          <div class="row form-group">
            <label class="control-label right col-lg-2" for="code2">验证码</label>
            <div class="col-lg-5 col-md-6">
              <input class="form-control" name="code2" id="code2" type="text" placeholder="验证码">
            </div>
            <img src="<%=request.getContextPath()%>/user/checkCode.do"  id="img">
          </div>
          <div class="row form-group">
            <label class="control-label right col-lg-5">
              <span id="loginSpan" style="size: A3;color: #b92c28"></span>
            </label>
            <div class="col-lg-2 col-md-6">
              <button type="submit" class="btn btn-success">登录</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
<script type="text/javascript">
    $(function () {
        $(document).keydown(function (event) {
            if(event.keyCode==13){
                //文本框提交验证
                $("#loginForm").bootstrapValidator({
                    /*根据验证结果显示的各种图标*/
                    message: 'This value is not valid',
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
                                /*自定义规则*/
                                callback: {
                                    message: '密码错误'
                                }
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
                                stringLength: {
                                    min: 6,
                                    max: 18,
                                    message: '密码长度必须在6到18位之间'
                                },
                                callback: {
                                    message: '密码错误'
                                }
                            }
                        },
                        code2: {
                            validators: {
                                notEmpty: {
                                    message: '验证码不能为空'
                                },
                                callback: {
                                    message: '验证码错误'
                                }
                            }
                        }
                    },
                }).on('success.form.bv', function (e) {
                    /*阻止浏览器默认行为*/
                    e.preventDefault();
                    var $form = $(e.target);
                    /*发登录请求*/
                    //按键登录  回车登录
                    //首先对整个页面文档监听
                    $.ajax({
                        type: 'post',
                        url: '<%=request.getContextPath()%>/user/loginUser.do',
                        /*可传递的数据格式  对象  序列化后的数据  key=value的字符串  [{name:'',value},...] */
                        data: $form.serialize(),
                        success: function (result) {
                            // 参数为1  账号或者密码错误  参数为2  登陆成功  参数为3 验证码错误
                            //1.参数为3 进判断, 表名验证码错误
                            if (result == 3) {
                                //1.2 弹出提示框 验证码错误
                                /*调用校验插件  让该选项置为 校验失败状态 提示校验失败的信息*/
                                /*updateStatus(‘哪个元素’，‘修改为什么状态’，‘校验规则’)*/
                                $form.data('bootstrapValidator').updateStatus('code2', 'INVALID', 'callback')
                            }
                            //2. 参数不为3  进入判断
                            else {
                                //2.1  判断参数为1  表名用户名或者密码错误
                                if (result == 1) {
                                    $form.data('bootstrapValidator').updateStatus('loginPwd', 'INVALID', 'callback')
                                }
                                //2.2  判断参数为2  表明账号密码正确 ,跳转页面
                                if (result == 2) {
                                    location.href = "<%=request.getContextPath()%>/treeShow.jsp";
                                }
                            }
                        }
                    })
                })
            }
        })
    })
//更换验证码
  $("#img").click(function(){
      //时间戳
      $(this).prop("src","<%=request.getContextPath()%>/user/checkCode.do?"+new Date());
  })
  //跳转到注册页面
  function toRegisteredJsp(){
      location.href="<%=request.getContextPath()%>/registered.jsp";
  }
  //登录方法


  /*function changeImg(){
      $.ajax({
          url:"<%=request.getContextPath()%>/user/loginUser.do",
          type:"post",
          data:$("#loginForm").serialize(),
          success:function (result) {
              // 参数为1  账号或者密码错误  参数为2  登陆成功  参数为3 验证码错误
              //1.参数为3 进判断, 表名验证码错误
              if(result==3){
                  //1.2 弹出提示框 验证码错误
                  bootbox.alert("验证码错误,请重新输入!!",function(){
                      $("#img").prop("src","<%=request.getContextPath()%>/user/checkCode.do?"+new Date());
                  })
              }
              //2. 参数不为3  进入判断
              else{
                  //2.1  判断参数为1  表名用户名或者密码错误
                  if(result==1){
                      $("#loginSpan").HTML("用户名或者密码错误，请重新输入");
                  }
                  //2.2  判断参数为2  表明账号密码正确 ,跳转页面
                  if(result==2){
                      bootbox.alert("登录成功!!");
                      location.href="<%=request.getContextPath()%>/index.jsp";
                  }
              }
          }
      })
  }*/
</script>
  </body>
</html>

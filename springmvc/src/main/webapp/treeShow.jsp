<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <!-- 引入bootstrap的css -->
    <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- 引入bootstrap-treeview的css -->
    <link href="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.css" rel="stylesheet">

    <!-- 引入bootstrap-addTabs的css -->
    <link href="<%=request.getContextPath()%>/js/addTabs/addTabs.css" rel="stylesheet">

    <!-- 引入jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.js"></script>

    <!-- 引入bootstrap的js-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/addTabs/addTabs.js"></script>
    <style type="text/css">
        body {
            padding-top: 55px;
        }
    </style>
</head>
<body>
<!--导航条  -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <!--定义在容器顶部  -->
    <div class="container-fluid">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- Brand and toggle get grouped for better mobile display -->
        <!-- 头部信息 -->
        <div class="navbar-header">
            <a class="navbar-brand glyphicon glyphicon-globe" href="#" id="menu-toggle">
                盒马鲜生          </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active "><a href="#" class="glyphicon glyphicon-shopping-cart">&nbsp首页 <span
                        class="sr-only">(current)</span></a></li>
                <li><a href="#" class="glyphicon glyphicon-grain">&nbsp商品</a></li>
                <li><a href="#" class="glyphicon glyphicon-sunglasses">&nbsp订单</a></li>
                <li><a href="#" class="glyphicon glyphicon-sunglasses">&nbsp广告</a></li>
                <li><a href="#" class="glyphicon glyphicon-sunglasses">&nbsp卡券</a></li>
                <li><a href="#" class="glyphicon glyphicon-sunglasses">&nbsp库存</a></li>
                <li><a href="#" class="glyphicon glyphicon-sunglasses">&nbsp用户</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle glyphicon glyphicon-text-color" data-toggle="dropdown"
                       role="button" aria-haspopup="true" aria-expanded="false">系统设置 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" class="glyphicon glyphicon-cloud">云计算</a></li>
                        <li><a href="#" class="glyphicon glyphicon-th">云应用</a></li>
                        <li><a href="#" class="glyphicon glyphicon-info-sign">云服务</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" class="glyphicon glyphicon-cloud-upload">大数据</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" class="glyphicon glyphicon-cloud-download">数据挖掘</a></li>
                    </ul>
                </li>
            </ul>
            <%--<form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>--%>

            <!-- 右边的    导航 按钮 -->
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- ============================导航结束==================================-->

<!--=========栅格布局 ==============-->
<div class="row">
    <div class="col-md-3">

        <a class="list-group-item" data-addtab="userMenu" data-target="#tabs" data-url="http://www.baidu.com">
            招标管理菜单
        </a>

        <!-- tree 的插件 -->
        <div id="treeDiv"></div>

    </div>

    <div class="col-md-9">

        <!--   选项卡    -->
        <!-- Nav tabs -->
        <ul id="tabs" class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#home" aria-controls="home" role="tab" data-toggle="tab">欢迎</a></li>
        </ul>
        <!-- 选项卡  内容 -->
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" style="" class="tab-pane active " id="home">后台管理系统</div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $.addtabs({iframeHeight: 870});
    $(function () {

        $.ajax({
            type: "post",
            url: "../tree/queryTree.do",
            datatype: "json",
            success: function (msg) {
                //渲染树插件 treeview()
                $("#treeDiv").treeview({
                    //data属性 树节点信息 json数组
                    data: msg,
                    //tree默认展开的节点级别默认为2
                    levels: 0,
                    //含有子节点的图标
                    collapseIcon: 'glyphicon glyphicon-star-empty',
                    //没有子节点的图标
                    emptyIcon: 'glyphicon glyphicon-usd',
                    //背景颜色
                    //backColor: 'green'
                    //是否显示复选框
                    showCheckbox: true,
                    //是否允许选中多个节点
                    //multiSelect:true,
                    //启用节点的超链接功能默认为false,节点需指定href属性
                    enableLinks: true,
                    //事件当节点选中时
                    onNodeSelected: function (event, node) {
                        //动态向 nav-tabs 导航标签添加tab选项卡
                        //addTabs方法  add() 添加tab  close()关闭tab  closeAll() 关闭全部tab
                        if (null != node.url) {
                            $.addtabs.add({
                                id: node.id,
                                title: node.text,
                                url: node.url,
                            })
                        }

                    }
                })


            }
        });


    })


</script>

</body>
</html>
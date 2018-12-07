<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <%@include file="/common/mystyle.jsp" %>
</head>
<body>
<!--  条件查询的 form  表单  -->
<!-- 表单 -->
<form id="pro_from" class="form-inline">
    <div class="form-group">
        <label for="proName">商品名称</label>
        <input type="text" class="form-control" id="goodName" placeholder="商品名称">
    </div>
    <br>
    <br>
    <div class="form-group">
        <label for="exampleInputFile">商品价格</label>
        <input class="form-control " id="minPrice" type="number" />至
        <input  class="form-control " id="maxPrice" type="number" /><br/>
    </div>
    <br>
    <br>
    <div class="form-group">
        <label for="exampleInputPassword1">商品类型</label>
        <select  name="redisMap['newsType']" class="form-control" id="goodType">
            <option value="">请选择</option>
            <option value="1">新鲜水果</option>
            <option value="2">衣服</option>
            <option value="3">零食</option>
        </select>
    </div>
    <br>
    <button type="button" class="btn btn-success" onclick="search()">搜索</button>
    <button type="button" class="btn btn-primary" onclick="reset()">重置</button>
</form>
<br>
<br>
<br>
<button type="button" class="btn btn-error" onclick="addall()">新增</button>
    <!--商品列表-->
    <table id="log">
    </table>

</body>
<script type="text/javascript">

    function updatemongodb(goodId){
        alert(goodId);
        bootbox.dialog({
            title:'修改',
            message: createAddContent('../good/toUpdateGood.do'),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='icon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath() %>/boot/updateBoot.do',
                            type:'post',
                            data:$("#myForm2").serialize(),
                            success:function(data){
                                initTable();
                                $('#log').bootstrapTable('refresh');
                            }
                        });
                    }
                },
                "cancel" : {
                    "label" : "<i class='icon-info'></i> 取消",
                    "className" : "btn-sm btn-danger",
                    "callback" : function() {

                    }
                }
            }

        });
/*        var selects = $('#myTable').bootstrapTable('getSelections'); //获取表选择的行
        var ids = "";
        for(var i=0; i<selects.length; i++){

            ids = selects[i].id ;
        }*/

        //查询
        $.ajax({
            url: "http://localhost:8765/good/queryGoodsById",
            type: "GET",
            dataType: "jsonp",  //指定服务器返回的数据类型
            data: {
                "goodId":goodId
            },
            success: function (aa) {
                alert(aa.goodName);
                $('#goodName2').val(data.goodName);
                $('#goodPrice2').val(data.goodPrice);
                $('#inventory2').val(data.inventory);
                $('#goodType2').val(data.goodType);
                $('#goodId').val(data.goodId);

                $("#log").bootstrapTable('refresh');
            },
            error:function(){

            }
        });
    }



    /*
    * 将新增页面表单传过来
    * */
    var res;
    function createAddContent(url){
        $.ajax({
            url:url,
            async:false,
            success:function(data){
                res = data;
               // alert(data);
            }
        });
        return res;
    }
    /*
    * 新增商品
    * */
    function addall(){
        bootbox.dialog({
            title:'添加',
            message: createAddContent('../good/toAddGood.do'),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='icon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url: "http://localhost:8765/good/addGoods",
                            type: "GET",
                            dataType: "jsonp",  //指定服务器返回的数据类型
                            data:$("#myForm").serialize(),
                            success: function (data) {
                                console.info("调用success");
                            },
                            error:function(){
                                alert("新增失败");
                            }
                        });
                    }
                },
                "cancel" : {
                    "label" : "<i class='icon-info'></i> 取消",
                    "className" : "btn-sm btn-danger",
                    "callback" : function() {

                    }
                }
            }

        });
    }
/*    function search(){
        var goodname=$("#goodName").val();
        var minPrice=$("#minPrice").val();
        var maxPrice=$("#maxPrice").val();
        var goodType=$("#goodType").val();
        $.ajax({
            url: "http://localhost:8765/good/queryGoods",
            type: "GET",
            dataType: "jsonp",  //指定服务器返回的数据类型
            data: {
                goodName:goodname,
                minPrice:minPrice,
                maxPrice:maxPrice,
                goodType:goodType
            },
            success: function (data) {
                console.info("调用success");
            }
        });
    }*/
    //删除单条商品
    function deletemongo(goodId){
            $.ajax({
                url: "http://localhost:8765/good/delGoods",
                type: "GET",
                dataType: "jsonp",  //指定服务器返回的数据类型
                data: {
                    "goodId":goodId
                },
                success: function (data) {
                    console.info("调用success");
                    $("#log").bootstrapTable('refresh');
                },
                error:function(){

            }
        });
    }
    //条件查询
    function search(){
        $("#log").bootstrapTable('refresh',
            {query: {
                    "goodName":$("#goodName").val(),
                    "minPrice":$("#minPrice").val(),
                    "maxPrice":$("#maxPrice").val(),
                    "goodType":$("#goodType").val(),
                }}
        );
    }

    //列表
    $().ready(function(){
        $("#log").bootstrapTable({
            url:"http://localhost:8765/good/queryGoods",
            method:"GET",
            dataType: "jsonp",  //指定服务器返回的数据类型
            success: function (data) {
                console.info("调用success");
            },
            striped: true,  	// 斑马线效果     默认false
            //只允许选中一行
            singleSelect:true,
            //选中行是不选中复选框或者单选按钮
            clickToSelect:true,
            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            uniqueId: "goodId",                 //每一行的唯一标识，一般为主键列
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,     //  最少留两列
            detailView: false,                  //是否显示父子表

            //发送到服务器的数据编码类型
            contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
            toolbar:'#tabToolBar',   //  工具定义位置
            columns:[

                {field:'goodId',title:'商品Id',width:50},
                {field:'goodName',title:'商品名称',width:100},

                {field:'goodPrice',title:'商品价格',width:100},
                {field:'goodType',title:'商品类型',width:100,
                    formatter: function (value, row, index) {
                        if (row.goodType == 1) {
                            return "新鲜水果";
                        } else {
                            return "衣服";
                        }
                    }
                } ,

                {field:'sales',title:'销量',width:100},
                {field:'inventory',title:'库存',width:100},
                {
                    field: 'status', title: '是否上架', width: 100,
                    formatter: function (value, row, index) {
                        if (row.status == 1) {
                            return "上架";
                        } else {
                            return "下架";
                        }
                    }
                },
                {field:'goodImg',title:'商品图片',width:100,
                    formatter:function(value,row,index){
                        return "<img class='img-responsive img-square' width='100' height='100' src='<%=request.getContextPath()%>/good/querybookimg.do?id="+row.goodImg+"'>";
                    }
                },
                {field:'caozuo',title:'操作',width:100,
                    formatter:function(value,row,index){
                        return "<button type='button' class='btn btn-primary' onclick=\"deletemongo(\'"+row.goodId+"\')\">删除</button>"+
                            "<button type='button' class='btn btn-primary' onclick=\"updatemongodb(\'"+row.goodId+"\')\">修改</button>";
                    }
                },

            ],

            //传递参数（*）
            queryParams: function(params) {
                var whereParams = {
                    /*
                        分页  自定义的参数         默认传 limit（展示几条）    offset（从第几条开始    起始条数）
                    */
                    "pageSize":params.limit,
                    "start":params.offset,

                }
                return whereParams;
            },
            //前台--排序字段
            //sortName:'proPrice',
            //sortOrder:'desc',
            //前台--搜索框
            search:false,
            //启动回车键做搜索功能
            searchOnEnterKey:true,
            //分页方式   后台请求的分页方式
            sidePagination:'server',
            pagination: true,                   //是否显示分页（*）
            pageNum: 1,                       //每页的记录行数（*）
            pageSize: 3,                       //每页的记录行数（*）
            pageList: [3, 6, 9,12],        //可供选择的每页的行数（*）
        });

    })
</script>

</html>

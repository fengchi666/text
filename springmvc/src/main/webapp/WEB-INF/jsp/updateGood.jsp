<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Insert title here</title>
</head>
<body>
<div class = "container-fluid">
    <form id = "myForm2" class = "form-inline">
        <table>
            <tr>
                <td height="50px">
                    <label>修改商品名称：</label>
                </td>
                <td>
                    <input type="text" name = "goodName" class="form-control" id="goodName2">
                </td>
            </tr>
            <tr>
                <td height="50px">
                    <label>商品库存：</label>
                </td>
                <td>
                    <input type="text" name = "inventory" class="form-control date" id="inventory2">
                </td>
            </tr>
            <tr>
                <td height="50px">
                    <label for="exampleInputFile">商品价格:</label>
                </td>
                <td>
                    <input class="form-control " name = "goodPrice" id="goodPrice2" type="number" />
                </td>
            </tr>
            <tr>
                <td height="50px">
                    <label for="exampleInputFile">商品类型:</label>
                </td>
                <td>
                    <select id="goodType2" name="goodType">
                        <option value="0">--请选择--</option>
                        <option value="1">--新鲜水果--</option>
                        <option value="1">--衣服--</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="proImage">商品封面</label>
                </td>
                <td>
                    <div class="form-group">
                        <input class="form-control" id="book_Img" name="book_Img"  type="file" multiple/>
                        <input class="form-control" id="goodImg" name="goodImg"  type="hidden" />
                        <%--<img width='100' height='100' src='<%=request.getContextPath()%>/book/querybookimg.do?id=${book.imgid}'>--%>
                    </div><br>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script type="text/javascript">
    $(function (){
        $("#book_Img").fileinput({
            //上传按钮
            showUpload:true,
            //移除按钮
            showRemove : true,
            //最大上传文件的个数，想要多选文件，input文件域必须加上multiple这个属性
            maxFileCount:10,
            //主样式
            mainClass: "input-group-lg",
            //按钮样式
            browseClass: "btn btn-primary btn-block",
            //语言设置：中文
            language : 'zh',
            //允许预览的文件类型
            allowedPreviewTypes : [ 'image', 'text' ],
            //允许选择的文件后缀名
            allowedFileExtensions : [ 'jpg', 'png', 'gif'],
            //最大上传文件的大小（KB）
            maxFileSize : 2000,
            //是否显示路径文本框
            showCaption:true,
            //是否显示预览
            showPreview:true,
            //是否显示关闭预览框
            showClose:false,
            //是否显示文件选择按钮
            showBrowse:true,
            //文件上传的路径，设置可实现拖拽
            uploadUrl :'<%=request.getContextPath()%>/good/ImgUplod.do',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        });
        //fileuploaded 上传文件之后的方法
        $('#book_Img').on('fileuploaded', function(event, data, previewId, index) {
            alert(data.response.imgId);
            //console.info(data.response.imgId);
            //图片主键回显到隐藏域
            $("#goodImg").val(data.response.imgId);
        });
    })
</script>
</html>
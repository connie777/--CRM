<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--使jsp输出的html时去除多余的空行--%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yh" uri="http://yyh.sdju.edu.cn/common/"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>合同管理</title>
    <style type="text/css">
        #element_to_pop_up{
            /*width: 1000px;
            height: 700px;*/
            display: none;
            border: #00BDDC 2px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <%--引入头部和左侧导航栏--%>
	<%@include file="head.jsp" %>
    <!-- 合同列表   查询部分  start-->
	<div id="page-wrapper" style="background-color: beige;">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" style="margin-top: 15px;">合同管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- 多条件查询 -->
		<div class="panel panel-default" style="margin-bottom: 15px;">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/contract/list.action">
                    <div class="form-group "style="margin-right: 20px">
                        <label>合同编号</label>
                        <input type="text" class="form-control"  name="contract_id" value="${contract_id}"/>
                    </div>

                    <div class="form-group" style="margin-right: 20px">
                        <label>客户名称</label>
                        <input type="text" class="form-control"  name="contract_cust_name" value="${contract_cust_name}"/>
                    </div>

					<button type="submit" class="btn btn-primary"><i class="fa fa-search fa-lg" style="margin-right: 5px"></i>查询</button>
				</form>
			</div>
		</div>
        <%--新建按钮--%>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newContractDialog" onclick="clearPlan()"style="margin-bottom: 4px">
            <i class="fa fa-plus fa-lg" style="margin-right: 5px"></i>
            合同录入</a>
        <%--列表显示 start--%>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">合同列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-hover<%--table-striped--%>">
						<thead>
							<tr>
								<th>合同编号</th>
								<th>客户名称</th>
								<th>签约日期</th>
                                <th>操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<c:forEach items="${page.rows}" var="row">
								<tr>
                                    <td><a href="#" onclick="viewContract('${row.contract_id}')">${row.contract_id}</a></td>
                                    <td>${row.contract_cust_name}</td>
                                    <td>
                                        <%--利用jstl的转换出正确的日期格式--%>
                                        <fmt:formatDate value='${row.contract_date}' type='time' pattern='yyyy-MM-dd'/>
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-danger btn-xs" onclick="deleteContract('${row.contract_id}')"><i class="fa fa-trash-o fa-lg"></i>删除</a>
                                    </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right" style="padding-right: 0px;">
						<yh:page url="${pageContext.request.contextPath }/contract/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
        <%--列表显示 end--%>
	</div>
	<!--  营销计划列表 查询部分  end-->
</div>
<!-- 创建合同模态框 -->
<div class="modal fade" id="newContractDialog" tabindex="-1" role="dialog"
	aria-labelledby="myAddModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAddModalLabel">合同创建</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_contract_form">
					<div class="form-group">
                        <label for="new_contract_id" class="col-sm-2 control-label">合同编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_contract_id" placeholder="合同编号" name="contract_id" />
                        </div>
					</div>
					<div class="form-group">
						<label for="new_contract_cust_name" class="col-sm-2 control-label">客户名称</label>
						<div class="col-sm-10">
                            <input type="text" class="form-control" id="new_contract_cust_name" placeholder="客户名称" name="contract_cust_name" />
						</div>
					</div>

					<div class="form-group">
						<label for="new_contract_date" class="col-sm-2 control-label">签定日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control date-picker" id="new_contract_date" placeholder="签定日期" name="contract_date" readonly/>
						</div>
					</div>

                    <div class="form-group ">
                        <label for="new_contract_annex" class="col-sm-2 control-label">合同附件</label>
                        <div class="col-sm-10 ">
                            <input type="file" class="file-loading" data-show-upload="false" data-show-caption="true"
                           data-browse-on-zone-click ="true" id="new_contract_annex" data-msg-placeholder="请选择合同附件" name="contract_annex" />
                        </div>
                    </div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createContract()">创建</button>
			</div>
		</div>
	</div>
</div>
<%--合同图片展示--%>
<div id="element_to_pop_up" >
    <img src="" id="contract_img" />
</div>




<!-- 引入js文件 -->
<!-- jQuery -->
<script src="../../js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../../js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="../../js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="../../js/jquery.dataTables.min.js"></script>
<script src="../../js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../../js/sb-admin-2.js"></script>
<%--文件上传--%>
<script src="../../js/fileinput.js"></script>
<script src="../../js/zh.js"></script>
<%--提示框--%>
<script src="../../js/spop.min.js"></script>
<%--bpopup http://dinbror.dk/bpopup/  用于模态框显示--%>
<script src="../../js/bpopup.min.js"></script>
<%--美化confirm--%>
<script src="../../js/flavr.min.js"></script>
<%--引入日期选择器--%>
<script src="../../js/bootstrap-datepicker.js"></script>
<script src="../../js/datepicker.zh-CN.min.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
    //初始化日期插件、文件上传插件
    $(function () {
        $(".date-picker").datepicker({
            format: "yyyy-mm-dd",
            language: "zh-CN",
            autoclose: true,
            clearBtn: true,
            todayHighlight : true
        });

        $("#new_contract_annex").fileinput({
            language:"zh",
            allowedFileExtensions: ["jpg", "png", "gif","jpeg"],
            dropZoneTitle: '拖拽文件到这里 &hellip;<br>',
            dropZoneClickTitle: '<br>或点击选择按钮选择文件',
        })
    })
    //前端日期格式化函数
    function dateFormat(date){
        if(date!=null){
            var date1=new Date(date);
            return date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate();
        }
    }
    //清空新建营销计划窗口中的数据
	function clearPlan() {
	    $("#new_contract_id").val("");
	    $("#new_contract_cust_name").val("");
	    $("#new_contract_date").val("");
	    $("#new_contract_annex").val("");
	}
	// 创建合同
	function createContract() {
        var file_obj=document.getElementById('new_contract_annex').files[0];
        var fd = new FormData();
        fd.append('contract_id', $('#new_contract_id').val());
        fd.append('contract_cust_name',$('#new_contract_cust_name').val());
        fd.append('contract_date',$('#new_contract_date').val());
        fd.append('contract_annex',file_obj);
        $.ajax({
            url:'${pageContext.request.contextPath }/contract/createContract.action',
            type:'post',
            data:fd,
            processData:false,  //tell jQuery not to process the data
            contentType: false,  //tell jQuery not to set contentType
            success:function (data) {
                if(data=="SUCCESS"){
                    spop({
                        template: '<h4 class="spop-title">合同录入成功！</h4>',
                        position: 'top-center',
                        style: 'success',
                        autoclose: 2000,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }else{
                    spop({
                        template: '<h4 class="spop-title">合同录入失败！</h4>',
                        position: 'top-center',
                        style: 'error',
                        autoclose: 2000,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }
            }
        })
    }
    // 查看合同
    function viewContract(id){
        $.ajax({
            type:"get",
            url:"<%=basePath%>contract/getContractById.action",
            data:{"id":id},
            success:function(data) {
                console.log(data);//data存的是图片路径
                var path='http://localhost:8080/'+data;
                $('#contract_img').attr('src','');
                $('#contract_img').attr('src',path);
                $('#contract_img').on('load',function () {
                    $('#element_to_pop_up').bPopup({
                        speed: 650,
                        transition: 'slideIn',
                        transitionClose: 'slideBack'
                    });
                })
            }
        });
    }
    //删除合同
    function deleteContract(id) {
        new $.flavr({
            modal       : false, //关闭模态
            content     : '确定删除该条记录吗 ？',
            dialog      : 'confirm',
            onConfirm   : function( $container ){
                $.ajax({
                    url:'${pageContext.request.contextPath}/contract/deleteContract.action',
                    data:{"id":id},
                    type:'post',
                    success:function (data) {
                        if(data=="SUCCESS"){
                            spop({
                                template: '<h4 class="spop-title">删除成功！</h4>',
                                position: 'top-center',
                                style: 'success',
                                autoclose: 1000,
                                onClose : function(){
                                    window.location.reload();
                                }
                            });
                        }else {
                            spop({
                                template: '<h4 class="spop-title">删除失败！</h4>',
                                position: 'top-center',
                                style: 'error',
                                autoclose: 1000,
                                onClose : function(){
                                    window.location.reload();
                                }
                            });
                        }
                    }
                })
            },
            onCancel    : function( $container ){
            }
        })

    }

</script>
</body>
</html>
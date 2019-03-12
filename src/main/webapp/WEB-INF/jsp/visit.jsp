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
	<title>客户拜访管理</title>
    <%--引入日期选择器--%>
    <link href="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <%--引入头部和左侧导航栏--%>
	<%@include file="head.jsp" %>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">客户拜访管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- 多条件查询 -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/visit/list.action">
                    <div class="form-group" style="margin-right: 20px">
                        <label >客户名称</label>
                        <select	class="form-control"  name="visit_cust_id">
                            <option value="">--请选择--</option>
                            <c:forEach items="${cusList}" var="item">
                            <option value="${item.cust_id}"
                                    <c:if test="${item.cust_id==cust_id}">selected</c:if>>
                                        ${item.cust_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
					<div class="form-group ">
						<label>拜访时间</label>
						<input type="text" class="form-control date-picker" placeholder="开始日期"
                               value="${start_date}" name="start_date" readonly/>
                        <span class="add-on"><i class="icon-th"></i></span>
                        ———
                        <input type="text" class="form-control date-picker" placeholder="结束日期"
                               value="${end_date}" name="end_date" readonly/>
					</div>
					<button type="submit" class="btn btn-primary"><i class="fa fa-search fa-lg" style="margin-right: 5px"></i>查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newVisitDialog" onclick="clearVisit()"style="margin-bottom: 4px">
            <i class="fa fa-plus fa-lg" style="margin-right: 5px"></i>
            新建</a>
        <a href="${pageContext.request.contextPath}/excelExport/exportVisit.action" class="btn btn-primary"  style="margin-bottom: 4px;margin-left: 6px;">
            <i class="fa fa-share fa-lg" style="margin-right: 5px"></i>
            Excel导出</a>
            <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">拜访信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>客户名称</th>
								<th>联系人名称</th>
								<th>业务员</th>
								<th>拜访时间</th>
								<th>拜访地点</th>
								<th>拜访详情</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.visit_cust_name}</td>
									<td>${row.visit_lkm_name}</td>
									<td>${row.visit_user_name}</td>
                                    <td>
                                        <%--利用jstl的转换出正确的日期格式--%>
                                        <fmt:formatDate value='${row.visit_time}' type='time' pattern='yyyy-MM-dd'/>
                                    </td>
                                    <td>${row.visit_addr}</td>
									<td>${row.visit_detail}</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#visitEditDialog" onclick= "editVisit(${row.visit_id})"><i class="fa fa-edit fa-lg"></i>修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteVisit(${row.visit_id})"><i class="fa fa-trash-o fa-lg"></i>删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<yh:page url="${pageContext.request.contextPath }/visit/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	<!--  拜访信息列表查询部分  end-->
</div>
<!-- 创建拜访信息模态框 -->
<div class="modal fade" id="newVisitDialog" tabindex="-1" role="dialog"
	aria-labelledby="myAddModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAddModalLabel">新建拜访信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_visit_form">
					<div class="form-group">
                        <label for="new_visit_cust" style="float: left;padding: 7px 15px 0 27px;">客户名称</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_visit_cust" name="visit_cust_id" onchange="changeCustomer(this)">
                                <option value="">--请选择--</option>
                                <c:forEach items="${cusList}" var="item">
                                    <option value="${item.cust_id}">
                                            ${item.cust_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
					</div>
					<div class="form-group">
						<label for="new_visit_lkm" style="float: left;padding: 7px 1px 0 27px;">联系人名称</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_visit_lkm" name="visit_lkm_id">
								<option value="">--请选择--</option>
							</select>
						</div>
					</div>
                    <div class="form-group">
                        <label for="new_visit_user" style="float:left;padding:7px 1px 0 27px;">业务员名称</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_visit_user" name="visit_user_id" disabled>
                                <option selected="selected" value="${USER_SESSION.user_id}" >
                                    ${USER_SESSION.user_name}
                                </option>
                                <%--<c:forEach items="${users}" var="item">
                                    <option value="${item.user_id}">
                                        ${item.user_name}
                                    </option>
                                </c:forEach>--%>
                            </select>
                        </div>
                    </div>
					<div class="form-group">
						<label for="new_visit_time" class="col-sm-2 control-label">拜访时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control date-picker" id="new_visit_time" placeholder="拜访时间" name="visit_time" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_visit_address" class="col-sm-2 control-label">拜访地点</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_visit_address" placeholder="拜访地点" name="visit_addr" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_visit_detail" class="col-sm-2 control-label">拜访详情</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_visit_detail" placeholder="拜访详情" name="visit_detail" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createVisit()">创建</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改拜访信息模态框 -->
<div class="modal fade" id="visitEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAditModalLabel">修改拜访信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_visit_form">
                    <input type="hidden" id="edit_visit_id" name="visit_id"/>

                    <div class="form-group">
                        <label for="edit_visit_cust" style="float: left;padding: 7px 15px 0 27px;">客户名称</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_visit_cust" name="visit_cust_id" onchange="changeCustomer(this)" disabled>
                                <option value="">--请选择--</option>
                                <c:forEach items="${cusList}" var="item">
                                    <option value="${item.cust_id}">
                                            ${item.cust_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_visit_lkm" style="float: left;padding: 7px 1px 0 27px;">联系人名称</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_visit_lkm" name="visit_lkm_id" disabled>
                                <%--<option value="">--请选择--</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_visit_user" style="float:left;padding:7px 1px 0 27px;">业务员名称</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_visit_user" name="visit_user_id" disabled>
                                <option selected="selected" value="${USER_SESSION.user_id}" >
                                    ${USER_SESSION.user_name}
                                </option>
                                <%--<c:forEach items="${users}" var="item">
                                    <option value="${item.user_id}">
                                        ${item.user_name}
                                    </option>
                                </c:forEach>--%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_visit_time" class="col-sm-2 control-label">拜访时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control date-picker" id="edit_visit_time" placeholder="拜访时间" name="visit_time" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_visit_address" class="col-sm-2 control-label">拜访地点</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_visit_address" placeholder="拜访地点" name="visit_addr" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_visit_detail" class="col-sm-2 control-label">拜访详情</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_visit_detail" placeholder="拜访详情" name="visit_detail" />
                        </div>
                    </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateVisit()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<%--引入日期选择器--%>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<%--提示框--%>
<script src="../../js/spop.min.js"></script>
<%--美化confirm--%>
<script src="../../js/flavr.min.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
    //初始化日期插件
    $(function () {
        $(".date-picker").datepicker({
            format: "yyyy-mm-dd",
            language: "zh-CN",
            autoclose: true,
            clearBtn: true,
            todayHighlight : true
        });
    })
    //前端日期格式化函数
    function dateFormat(date){
        if(date!=null){
            var date1=new Date(date);
            return date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate();
        }
    }
    //当选择客户时，联系人跟出
    function changeCustomer(id) {
        //先清空数据
        $('#new_visit_lkm').html('');
        /*$('#edit_visit_lkm').html('');*/
        $.ajax({
            type:"post",
            url:"<%=basePath%>visit/showLinkman.action",
            data:{"id":id.value},
            success:function (data) {
                console.log('info', data);
                data.forEach(
                    function (item) {
                    $('#new_visit_lkm').append("<option value="+item.lkm_id+">"+item.lkm_name+"</option>");
                    /*$('#edit_visit_lkm').append("<option value="+item.lkm_id+">"+item.lkm_name+"</option>");*/
                    }
                )
            }
        })
    }
    //清空新建拜访信息窗口中的数据
	function clearVisit() {
	    $("#new_visit_cust").val("");
	    $("#new_visit_lkm").val("");
	    //业务员固定不需要清空
	    /*$("#new_visit_user").val("");*/
	    $("#new_visit_time").val("");
	    $("#new_visit_address").val("");
	    $("#new_visit_detail").val("");
	}
	// 创建拜访信息
	function createVisit() {
        $("#new_visit_user").attr("disabled",false);
        $.post("<%=basePath%>visit/create.action",
        $("#new_visit_form").serialize(),function(data){
                if(data =="OK"){
                    spop({
                        template: '<h4 class="spop-title">拜访记录录入成功！</h4>',
                        position: 'top-center',
                        style: 'success',
                        autoclose: 1000,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }else{
                    spop({
                        template: '<h4 class="spop-title">拜访记录录入失败！</h4>',
                        position: 'top-center',
                        style: 'error',
                        autoclose: 1000,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }
            });
        }
	// 通过id获取修改的拜访信息
	function editVisit(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>visit/getVisitById.action",
	        data:{"id":id},
	        success:function(data) {
                console.log(data);
	            $("#edit_visit_id").val(data.visit_id);
                $('#edit_visit_lkm').html('');
                $('#edit_visit_lkm').append("<option value="+data.visit_lkm_id+">"+data.visit_lkm_name+"</option>");
                $("#edit_visit_cust").val(data.visit_cust_id);
                $("#edit_visit_user").html('');
                $("#edit_visit_user").append("<option value="+data.visit_user_id+">"+data.visit_user_name+"</option>");
                console.log(data.visit_time);
                if(data.visit_time!=null){
                    var simpleDate=dateFormat(data.visit_time);
                    $("#edit_visit_time").val(simpleDate);
                }else {
                    $("#edit_visit_time").val('');
                }
                $("#edit_visit_address").val(data.visit_addr);
                $("#edit_visit_detail").val(data.visit_detail);
	        }
	    });
	}
    // 执行更新拜访信息操作
	function updateVisit() {
        /*提交数据时需要取消disable*/
        $("#edit_visit_cust").attr("disabled",false);
        $("#edit_visit_lkm").attr("disabled",false);
        $("#edit_visit_user").attr("disabled",false);
		$.post("<%=basePath%>visit/update.action",$("#edit_visit_form").serialize(),function(data){
			if(data =="OK"){
                spop({
                    template: '<h4 class="spop-title">拜访记录更新成功！</h4>',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 1000,
                    onClose : function(){
                        window.location.reload();
                    }
                });
			}else{
                spop({
                    template: '<h4 class="spop-title">拜访记录更新失败！</h4>',
                    position: 'top-center',
                    style: 'error',
                    autoclose: 1000,
                    onClose : function(){
                        window.location.reload();
                    }
                });
			}
		});
	}
	// 删除拜访信息
	function deleteVisit(id) {
        new $.flavr({
            modal       : false, //关闭模态
            content     : '确定删除该联系人吗 ？',
            dialog      : 'confirm',
            onConfirm   : function( $container ){
	        $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/visit/delete.action",
                data:{"id":id},
                success:function (data) {
                    if(data=="OK"){
                        spop({
                            template: '<h4 class="spop-title">拜访记录删除成功！</h4>',
                            position: 'top-center',
                            style: 'success',
                            autoclose: 1000,
                            onClose : function(){
                                window.location.reload();
                            }
                        });
                    }else {
                        spop({
                            template: '<h4 class="spop-title">拜访记录删除失败！</h4>',
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
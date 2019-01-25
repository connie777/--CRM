<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--使jsp输出的html时去除多余的空行--%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="yh" uri="http://yyh.sdju.edu.cn/common/"%>
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
                                <option value="${item.cust_id}">
                                        ${item.cust_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
					<div class="form-group ">
						<label>拜访时间</label>
						<input type="text" class="form-control date-picker" placeholder="开始日期"
                               name="start_date" readonly/>
                        <span class="add-on"><i class="icon-th"></i></span>
                        ———
                        <input type="text" class="form-control date-picker" placeholder="结束日期"
                               name="end_date" readonly/>
					</div>
					<button type="submit" class="btn btn-primary"><i class="fa fa-search fa-lg" style="margin-right: 5px"></i>查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newVisitDialog" onclick="clearVisit()">
            <i class="fa fa-plus fa-lg" style="margin-right: 5px"></i>
            新建</a>
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
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.customer.cust_name}</td>
									<td>${row.linkman.lkm_name}</td>
									<td>${row.user.user_name}</td>
									<td>${row.visit_time}</td>
                                    <td>${row.visit_addr}</td>
									<td>${row.visit_detial}</td>
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
                            <select	class="form-control" id="new_visit_user" name="visit_user_id">
                                <option value="${USER_SESSION.user_id}">${USER_SESSION.user_name}</option>
                                <c:forEach items="${users}" var="item">
                                    <option value="${item.user_id}">
                                        ${item.user_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
					<div class="form-group">
						<label for="new_time" class="col-sm-2 control-label">拜访时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_time" placeholder="办公电话" name="visit_time" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_address" class="col-sm-2 control-label">拜访地点</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_address" placeholder="拜访地点" name="visit_addr" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_detail" class="col-sm-2 control-label">拜访详情</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_detail" placeholder="拜访详情" name="visit_detail" />
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
<!-- 修改联系人模态框 -->
<div class="modal fade" id="linkmanEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAditModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_linkman_form">
                    <input type="hidden" id="edit_lkm_id" name="lkm_id"/>
                    <div class="form-group">
                        <label for="edit_lkm_name" class="col-sm-2 control-label">联系人名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_lkm_name" placeholder="联系人名称" name="lkm_name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_customerBelong" style="float:left;padding:7px 15px 0 27px;">所属客户</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_customerBelong" name="lkm_cust_id">
                                <option value="">--请选择--</option>
                                <c:forEach items="${cusList}" var="item">
                                    <option value="${item.cust_id}">
                                            ${item.cust_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label for="edit_lkm_gender" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_lkm_gender" placeholder="性别" name="lkm_gender" />
                        </div>
                    </div>--%>
                    <div class="form-group">
                        <label for="edit_lkm_gender" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="lkm_gender" id="edit_lkm_gender" value="男" > 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="lkm_gender" id="edit_lkm_gender1" value="女" > 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_phone" class="col-sm-2 control-label">办公电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_phone" placeholder="办公电话" name="lkm_phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mobile" placeholder="移动电话" name="lkm_mobile" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_email" placeholder="邮箱" name="lkm_email" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_qq" class="col-sm-2 control-label">QQ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_qq" placeholder="QQ" name="lkm_qq" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_position" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_position" placeholder="职位" name="lkm_position" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_memo" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_memo" placeholder="备注" name="lkm_memo" />
                        </div>
                    </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateLinkman()">保存修改</button>
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
<!-- 编写js代码 -->
<script type="text/javascript">
    //初始化日期插件
    $(function () {
        $(".date-picker").datepicker({
            format: "yyyy-mm-dd",
            language: "zh-CN",
            autoclose: true,
            clearBtn: true
        });
    })

    //当选择客户时，联系人必须对应
    function changeCustomer(id) {
        //先清空数据
        $('#new_visit_lkm').html('');
        $.ajax({
            type:"post",
            url:"<%=basePath%>visit/showLinkman.action",
            data:{"id":id.value},
            success:function (data) {
                console.log('info', data);
                data.forEach(
                    function (item) {
                    $('#new_visit_lkm').append("<option value="+item.lkm_id+">"+item.lkm_name+"</option>")
                    }
                )
            }
        })
    }
    //清空新建联系人窗口中的数据
	function clearVisit() {
	    $("#new_visit_cust").val("");
	    $("#new_visit_lkm").val("")
	    $("#new_visit_user").val("")
	    $("#new_time").val("")
	    $("#new_address").val("");
	    $("#new_detail").val("");
	}
	// 创建拜访信息
	function createVisit() {
	$.post("<%=basePath%>linkman/create.action",
	$("#new_visit_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("联系人创建成功！");
	            window.location.reload();
	        }else{
	            alert("联系人创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的联系人信息
	function editLinkman(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>linkman/getLinkmanById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_lkm_id").val(data.lkm_id);
                $("#edit_lkm_name").val(data.lkm_name);
                $("#edit_customerBelong").val(data.lkm_cust_id);
                if(data.lkm_gender=='男'){

                    $("#edit_lkm_gender").attr("checked","checked");
                    $("#edit_lkm_gender1").attr("checked",false);

                }else if(data.lkm_gender=='女'){

                    $("#edit_lkm_gender1").attr("checked","checked");
                    $("#edit_lkm_gender").attr("checked",false);
                }

                $("#edit_email").val(data.lkm_email);
                $("#edit_qq").val(data.lkm_qq);
                $("#edit_phone").val(data.lkm_phone);
                $("#edit_mobile").val(data.lkm_mobile);
                $("#edit_position").val(data.lkm_position);
                $("#edit_memo").val(data.lkm_memo);
	            
	        }
	    });
	}
    // 执行更新联系人操作
	function updateLinkman() {
		$.post("<%=basePath%>linkman/update.action",$("#edit_linkman_form").serialize(),function(data){
			if(data =="OK"){
				alert("联系人信息更新成功！");
				window.location.reload();
			}else{
				alert("联系人信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除联系人
	function deleteVisit(id) {
	    if(confirm('确实要删除该条记录吗?')) {
	        $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/visit/delete.action",
                data:{"id":id},
                success:function (data) {
                    if(data=="OK"){
                        alert("记录删除成功！");
                        window.location.reload();
                    }else {
                        alert("记录删除失败！");
                        window.location.reload();
                    }
                }
            })
            //ajax的不同写法
	        /**$.post("${pageContext.request.contextPath}linkman/delete.action",{"id":id},
            function(data){
	            if(data =="OK"){
	                alert("联系人删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除联系人失败！");
	                window.location.reload();
	            }
	        });*/
	    }
	}
</script>
</body>
</html>
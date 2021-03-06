<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <link rel="shortcut icon" href="../../images/favicon.ico" type="image/x-icon"/>
	<title>客户管理</title>
</head>
<body>
<div id="wrapper">
    <%--引入头部和左侧导航栏--%>
	<%@include file="head.jsp" %>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper" style="background-color: aliceblue;">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" style="margin-top: 15px;">客户信息管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default" style="margin-bottom: 15px;">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/customer/list.action">
					<div class="form-group">
						<label for="customerName">客户名称</label> 
						<input type="text" class="form-control" id="customerName" 
						                   value="${custName }" name="custName" />
					</div>
					<div class="form-group">
						<label for="customerFrom">客户来源</label> 
						<select	class="form-control" id="customerFrom" name="custSource">
							<option value="">--请选择--</option>
							<c:forEach items="${fromType}" var="item">
								<option value="${item.dict_id}"
								       <c:if test="${item.dict_id == custSource}">selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="custIndustry">所属行业</label> 
						<select	class="form-control" id="custIndustry"  name="custIndustry">
							<option value="">--请选择--</option>
							<c:forEach items="${industryType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == custIndustry}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="custLevel">客户级别</label>
						<select	class="form-control" id="custLevel" name="custLevel">
							<option value="">--请选择--</option>
							<c:forEach items="${levelType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == custLevel}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
                    <c:if test="${USER_SESSION.user_level != 3}">
                    <div class="form-group">
                        <label for="cust_user_id">负责人</label>
                        <select	class="form-control" id="cust_user_id"  name="cust_user_id">
                            <option value="">--请选择--</option>
                            <c:forEach items="${users}" var="item">
                                <option value="${item.user_id}"
                                        <c:if test="${item.user_id == cust_user_id}"> selected</c:if>>
                                        ${item.user_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    </c:if>
					<button type="submit" class="btn btn-primary"><i class="fa fa-search fa-lg" style="margin-right: 5px"></i>查询</button>
				</form>
			</div>
		</div>
        <%--权限管理--%>
        <c:if test="${USER_SESSION.user_level != 3}">
            <a href="#" class="btn btn-primary" data-toggle="modal"
                       data-target="#newCustomerDialog" onclick="clearCustomer()" style="margin-bottom: 4px">
                <i class="fa fa-plus fa-lg" style="margin-right: 5px"></i>
                新建</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/excelExport/exportCustomer.action" class="btn btn-primary"  style="margin-bottom: 4px;margin-left: 6px;">
            <i class="fa fa-share fa-lg" style="margin-right: 5px"></i>
            Excel导出</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">客户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table <%--table-bordered--%> table-hover <%--table-striped--%>">
						<thead>
							<tr>
								<%--<th>编号</th>--%>
								<th>客户名称</th>
								<th>客户来源</th>
								<th>客户所属行业</th>
								<th>客户级别</th>
								<th>固定电话</th>
                                <c:if test="${USER_SESSION.user_level!=3}">
								<th>操作</th>
                                </c:if>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<%--<td>${row.cust_id}</td>--%>
									<td>${row.cust_name}</td>
									<td>${row.cust_source}</td>
									<td>${row.cust_industry}</td>
									<td>${row.cust_level}</td>
								    <td>${row.cust_phone}</td>
                                    <c:if test="${USER_SESSION.user_level!=3}">
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.cust_id})"><i class="fa fa-edit fa-lg"></i>修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.cust_id})"><i class="fa fa-trash-o fa-lg"></i>删除</a>
									</td>
                                        </c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right" style="padding-right: 0px;">
						<yh:page url="${pageContext.request.contextPath }/customer/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 客户列表查询部分  end-->
</div>
<!-- 创建客户模态框 -->
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAddModalLabel">新建客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_customer_form">
					<div class="form-group">
						<label for="new_customerName" class="col-sm-2 control-label">
						    客户名称
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_customerName" placeholder="客户名称" name="cust_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="new_customerFrom" name="cust_source">
								<option value="">--请选择--</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}">selected</c:if>>
									${item.dict_item_name }									
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
						<div class="col-sm-10"> 
							<select	class="form-control" id="new_custIndustry"  name="cust_industry">
								<option value="">--请选择--</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>
									${item.dict_item_name }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_custLevel" name="cust_level">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
                    <div class="form-group">
                        <label for="new_cust_user" style="float:left;padding:7px 29px 0 27px;">负责人</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_cust_user" name="cust_user_id">
                                <option value="">--请选择--</option>
                                <c:forEach items="${users}" var="item">
                                    <option value="${item.user_id}">
                                            ${item.user_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
					<%--<div class="form-group">
						<label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_linkMan" placeholder="联系人" name="cust_linkman" />
						</div>
					</div>--%>
					<div class="form-group">
						<label for="new_phone" class="col-sm-2 control-label">固定电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_phone" placeholder="固定电话" name="cust_phone" />
						</div>
					</div>
					<%--<div class="form-group">
						<label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_mobile" placeholder="移动电话" name="cust_mobile" />
						</div>
					</div>--%>
					<div class="form-group">
						<label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_zipcode" placeholder="邮政编码" name="cust_zipcode" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_address" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_address" placeholder="地址" name="cust_address" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createCustomer()">创建客户</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myEditModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_customer_form">
					<input type="hidden" id="edit_cust_id" name="cust_id"/>
					<div class="form-group">
						<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_customerName" placeholder="客户名称" name="cust_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="edit_customerFrom" name="cust_source">
								<option value="">--请选择--</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>
                                            ${item.dict_item_name }
                                    </option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
						<div class="col-sm-10"> 
							<select	class="form-control" id="edit_custIndustry"  name="cust_industry">
								<option value="">--请选择--</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_custLevel" name="cust_level">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
                    <div class="form-group">
                        <label for="edit_cust_user" style="float:left;padding:7px 29px 0 27px;">负责人</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_cust_user" name="cust_user_id">
                                <option value="">--请选择--</option>
                                <c:forEach items="${users}" var="item">
                                    <option value="${item.user_id}">
                                            ${item.user_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
					<%--<div class="form-group">
						<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="cust_linkman" />
						</div>
					</div>--%>
					<div class="form-group">
						<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_phone" placeholder="固定电话" name="cust_phone" />
						</div>
					</div>
					<%--<div class="form-group">
						<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_mobile" placeholder="移动电话" name="cust_mobile" />
						</div>
					</div>--%>
					<div class="form-group">
						<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码" name="cust_zipcode" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address" placeholder="地址" name="cust_address" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
			</div>
		</div>
	</div>
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
<%--提示框--%>
<script src="../../js/spop.min.js"></script>
<%--美化confirm--%>
<script src="../../js/flavr.min.js"></script>
<%--文件上传--%>
<script src="../../js/fileinput.js"></script>
<script src="../../js/zh.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">

    //清空新建客户窗口中的数据
	function clearCustomer() {
	    $("#new_customerName").val("");
	    $("#new_customerFrom").val("");
	    $("#new_custIndustry").val("");
	    $("#new_custLevel").val("");
	    $("#new_cust_user").val("");
	    /*$("#new_linkMan").val("");*/
	    $("#new_phone").val("");
	    /*$("#new_mobile").val("");*/
	    $("#new_zipcode").val("");
	    $("#new_address").val("");
	}
	// 创建客户
	function createCustomer() {
	$.post("<%=basePath%>customer/create.action",
	$("#new_customer_form").serialize(),function(data){
	        if(data =="OK"){
                spop({
                    template: '<h4 class="spop-title">客户创建成功！</h4>',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 1000,
                    onClose : function(){
                        window.location.reload();
                    }
                });
	        }else{
                spop({
                    template: '<h4 class="spop-title">客户创建失败！</h4>',
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
	// 通过id获取修改的客户信息
	function editCustomer(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>customer/getCustomerById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_cust_id").val(data.cust_id);
	            $("#edit_customerName").val(data.cust_name);
	            $("#edit_customerFrom").val(data.cust_source);
	            $("#edit_custIndustry").val(data.cust_industry);
	            $("#edit_custLevel").val(data.cust_level);
	            $("#edit_cust_user").val(data.cust_user_id);
	            /*$("#edit_linkMan").val(data.cust_linkman);*/
	            $("#edit_phone").val(data.cust_phone);
	            /*$("#edit_mobile").val(data.cust_mobile);*/
	            $("#edit_zipcode").val(data.cust_zipcode);
	            $("#edit_address").val(data.cust_address);
	            
	        }
	    });
	}
    // 执行修改客户操作
	function updateCustomer() {
		$.post("<%=basePath%>customer/update.action",$("#edit_customer_form").serialize(),function(data){
			if(data =="OK"){
                spop({
                    template: '<h4 class="spop-title">客户信息更新成功！</h4>',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 1000,
                    onClose : function(){
                        window.location.reload();
                    }
                });
			}else{
                spop({
                    template: '<h4 class="spop-title">客户信息更新失败！</h4>',
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
	// 删除客户
	function deleteCustomer(id) {
	    new $.flavr({
            modal       : false, //关闭模态
            content     : '确定删除该客户吗 ？',
            dialog      : 'confirm',
            onConfirm   : function( $container ){
                $.post("<%=basePath%>customer/delete.action",{"id":id},
                    function(data){
                        if(data =="OK"){
                            spop({
                                template: '<h4 class="spop-title">客户删除成功！</h4>',
                                position: 'top-center',
                                style: 'success',
                                autoclose: 1000,
                                onClose : function(){
                                    window.location.reload();
                                }
                            });
                        }else{
                            spop({
                                template: '<h4 class="spop-title">客户删除失败！</h4>',
                                position: 'top-center',
                                style: 'error',
                                autoclose: 1000,
                                onClose : function(){
                                    window.location.reload();
                                }
                            });
                        }
                    });
                return false;
            },
            onCancel    : function( $container ){
            }
        })
	}
	function exportToExcel() {
        new $.flavr({
            modal       : false, //关闭模态
            content     : '确定导出客户信息吗 ？',
            dialog      : 'confirm',
            onConfirm   : function( $container ){
                window.location.href="${pageContext.request.contextPath}/excelExport/exportCustomer.action";
                return false;
            },
            onCancel    : function( $container ){
            }
        })
    }
</script>
</body>
</html>
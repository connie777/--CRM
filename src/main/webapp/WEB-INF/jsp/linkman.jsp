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
	<title>联系人管理</title>
</head>
<body>
<div id="wrapper">
    <%--引入头部和左侧导航栏--%>
	<%@include file="head.jsp" %>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">联系人管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- 多条件查询 -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/linkman/list.action">
					<div class="form-group">
						<label for="linkmanName">联系人名称</label>
						<input type="text" class="form-control" id="linkmanName"
						     value="${lkm_name}" name="lkm_name" />
					</div>
					<div class="form-group" style="margin-left: 20px;margin-right: 20px;">
                        <label>性别</label>
                        <label class="radio-inline">
                            <input type="radio" name="lkm_gender" id="male" value="男"
                                    <c:if test="${lkm_gender=='男'}">checked</c:if>>
                            男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="lkm_gender" id="female" value="女"
                                   <c:if test="${lkm_gender=='女'}">checked</c:if>>
                            女
                        </label>
					</div>
					<div class="form-group" style="margin-right: 20px">
						<label for="belongCus">所属客户</label>
						<select	class="form-control" id="belongCus"  name="lkm_cust_id">
							<option value="">--请选择--</option>
							<c:forEach items="${cusList}" var="item">
								<option value="${item.cust_id}"
                                        <c:if test="${item.cust_id == lkm_cust_id}"> selected</c:if>>
								    ${item.cust_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary"><i class="fa fa-search fa-lg" style="margin-right: 5px"></i>查询</button>
				</form>
			</div>
		</div>
        <%--权限管理--%>
        <c:if test="${USER_SESSION.user_level != 3}">
            <a href="#" class="btn btn-primary" data-toggle="modal"
                       data-target="#newLinkmanDialog" onclick="clearLinkman()"style="margin-bottom: 4px">
                <i class="fa fa-plus fa-lg" style="margin-right: 5px"></i>
                新建</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/excelExport/exportLinkman.action" class="btn btn-primary"  style="margin-bottom: 4px;margin-left: 6px;">
            <i class="fa fa-share fa-lg" style="margin-right: 5px"></i>
            Excel导出</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">联系人信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>联系人名称</th>
								<th>性别</th>
								<th>办公电话</th>
								<th>手机</th>
								<th>所属客户</th>
								<th>职位</th>
                                <c:if test="${USER_SESSION.user_level!=3}">
								<th>操作</th>
                                </c:if>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.lkm_name}</td>
									<td>${row.lkm_gender}</td>
									<td>${row.lkm_phone}</td>
									<td>${row.lkm_mobile}</td>
                                    <td>${row.lkm_name}</td>
									<td>${row.lkm_position}</td>
                                    <c:if test="${USER_SESSION.user_level!=3}">
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#linkmanEditDialog" onclick= "editLinkman(${row.lkm_id})"><i class="fa fa-edit fa-lg"></i>修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteLinkman(${row.lkm_id})"><i class="fa fa-trash-o fa-lg"></i>删除</a>
									</td>
                                    </c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<yh:page url="${pageContext.request.contextPath }/linkman/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	<!--  联系人列表查询部分  end-->
</div>
<!-- 创建联系人模态框 -->
<div class="modal fade" id="newLinkmanDialog" tabindex="-1" role="dialog"
	aria-labelledby="myAddModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAddModalLabel">新建联系人信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_linkman_form">
					<div class="form-group">
						<label for="new_lkm_name" class="col-sm-2 control-label">联系人名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_lkm_name" placeholder="联系人名称" name="lkm_name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_customerBelong" style="float:left;padding:7px 15px 0 27px;">所属客户</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_customerBelong" name="lkm_cust_id">
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
                        <label for="new_lkm_gender" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="lkm_gender" id="new_lkm_gender" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="lkm_gender" id="new_lkm_gender1" value="女"> 女
                            </label>
                        </div>
                    </div>

					<div class="form-group">
						<label for="new_phone" class="col-sm-2 control-label">办公电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_phone" placeholder="办公电话" name="lkm_phone" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_mobile" placeholder="移动电话" name="lkm_mobile" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_email" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_email" placeholder="邮箱" name="lkm_email" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_qq" class="col-sm-2 control-label">QQ</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_qq" placeholder="QQ" name="lkm_qq" />
						</div>
					</div>
                    <div class="form-group">
                        <label for="new_position" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_position" placeholder="职位" name="lkm_position" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_memo" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_memo" placeholder="备注" name="lkm_memo" />
                        </div>
                    </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createLinkman()">创建</button>
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
<%--提示框--%>
<script src="../../js/spop.min.js"></script>
<%--美化confirm--%>
<script src="../../js/flavr.min.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
//清空新建联系人窗口中的数据
	function clearLinkman() {
	    $("#new_lkm_name").val("");
	    $("#new_customerBelong").val("")
	    $("#new_lkm_gender").val("")
	    $("#new_email").val("")
	    $("#new_qq").val("");
	    $("#new_phone").val("");
	    $("#new_mobile").val("");
	    $("#new_position").val("");
	    $("#new_memo").val("");
	}
	// 创建联系人
	function createLinkman() {
	$.post("<%=basePath%>linkman/create.action",
	$("#new_linkman_form").serialize(),function(data){
	        if(data =="OK"){
                spop({
                    template: '<h4 class="spop-title">联系人创建成功！</h4>',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 1000,
                    onClose : function(){
                        window.location.reload();
                    }
                });
	        }else{
                spop({
                    template: '<h4 class="spop-title">联系人创建失败！</h4>',
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
                spop({
                    template: '<h4 class="spop-title">联系人信息更新成功！</h4>',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 1000,
                    onClose : function(){
                        window.location.reload();
                    }
                });
			}else{
                spop({
                    template: '<h4 class="spop-title">联系人信息更新失败！</h4>',
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
	// 删除联系人
	function deleteLinkman(id) {
        new $.flavr({
            modal       : false, //关闭模态
            content     : '确定删除该联系人吗 ？',
            dialog      : 'confirm',
            onConfirm   : function( $container ){
	        $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/linkman/delete.action",
                data:{"id":id},
                success:function (data) {
                    if(data=="OK"){
                        spop({
                            template: '<h4 class="spop-title">联系人删除成功！</h4>',
                            position: 'top-center',
                            style: 'success',
                            autoclose: 1000,
                            onClose : function(){
                                window.location.reload();
                            }
                        });
                    }else {
                        spop({
                            template: '<h4 class="spop-title">联系人删除失败！</h4>',
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
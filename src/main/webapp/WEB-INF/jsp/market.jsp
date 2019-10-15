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
	<title>营销管理</title>
    <link rel="shortcut icon" href="../../images/favicon.ico" type="image/x-icon"/>
    </head>
<body>
<div id="wrapper">
    <%--引入头部和左侧导航栏--%>
	<%@include file="head.jsp" %>
    <!-- 营销计划列表   查询部分  start-->
	<div id="page-wrapper" style="background-color: beige;">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header" style="margin-top: 15px;">营销计划管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- 多条件查询 -->
		<div class="panel panel-default" style="margin-bottom: 15px;">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/market/planList.action">
                    <div class="form-group "style="margin-right: 20px">
                        <label>计划名称</label>
                        <input type="text" class="form-control" value="${plan_name}" name="plan_name" />
                    </div>
                    <c:if test="${USER_SESSION.user_level!=3}">
                    <div class="form-group" style="margin-right: 20px">
                        <label>负责人</label>
                        <select	class="form-control" name="plan_principal">
                            <option value="">--请选择--</option>
                            <c:forEach items="${sellers}" var="item">
                            <option value="${item.user_id}"
                                    <c:if test="${item.user_id==seller_id}">selected</c:if>>
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
        <%--新建按钮--%>
        <c:if test="${USER_SESSION.user_level!=3}">
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newPlanDialog" onclick="clearPlan()"style="margin-bottom: 4px">
            <i class="fa fa-plus fa-lg" style="margin-right: 5px"></i>
            创建</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/excelExport/exportPlan.action" class="btn btn-primary"  style="margin-bottom: 4px;margin-left: 6px;">
            <i class="fa fa-share fa-lg" style="margin-right: 5px"></i>
            Excel导出</a>
        <%--列表显示 start--%>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">营销计划列表</div>
					<!-- /.panel-heading -->
					<table class="table table-hover<%--table-bordered table-striped--%>">
						<thead>
							<tr>
								<th>计划名称</th>
								<th>预期结束日期</th>
								<th>负责人</th>
                                <c:if test="${USER_SESSION.user_level!=3}">
								<th>操作</th>
                                </c:if>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<c:forEach items="${page.rows}" var="row">
								<tr>
                                    <td><a href="#" data-toggle="modal" data-target="#viewPlanDialog" onclick="viewPlan(${row.plan_id})">${row.plan_name}</a></td>
                                    <td>
                                        <%--利用jstl的转换出正确的日期格式--%>
                                        <fmt:formatDate value='${row.plan_end_date}' type='time' pattern='yyyy-MM-dd'/>
                                    </td>
                                    <td>${row.plan_user_name}</td>
                                    <c:if test="${USER_SESSION.user_level!=3}">
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editPlanDialog" onclick= "editPlan(${row.plan_id})"><i class="fa fa-edit fa-lg"></i>修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deletePlan(${row.plan_id})"><i class="fa fa-trash-o fa-lg"></i>删除</a>
									</td>
                                    </c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right" style="padding-right: 0px;">
						<yh:page url="${pageContext.request.contextPath }/market/planList.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
        <%--列表显示 end--%>
	<!--  营销计划列表 查询部分  end-->
</div>
<!-- 创建营销计划模态框 -->
<div class="modal fade" id="newPlanDialog" tabindex="-1" role="dialog"
	aria-labelledby="myAddModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAddModalLabel">创建营销计划</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_plan_form">
					<div class="form-group">
                        <label for="new_plan_name" class="col-sm-2 control-label">计划名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_plan_name" placeholder="计划名称" name="plan_name" />
                        </div>
					</div>
					<div class="form-group">
						<label for="new_plan_content" class="col-sm-2 control-label">计划内容</label>
						<div class="col-sm-10">
                            <input type="text" class="form-control" id="new_plan_content" placeholder="计划内容" name="plan_content" />
						</div>
					</div>
                    <div class="form-group">
                        <label for="new_plan_principal" class="col-sm-2 control-label">负责人</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_plan_principal" name="plan_principal" >
                                <option value="">请选择</option>
                                <c:forEach items="${sellers}" var="item">
                                    <option value="${item.user_id}">
                                        ${item.user_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_plan_cost" class="col-sm-2 control-label">预计成本</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_plan_cost" placeholder="预计成本" name="plan_cost" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_plan_profits" class="col-sm-2 control-label">预计收益</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_plan_profits" placeholder="预计收益" name="plan_profits" />
                        </div>
                    </div>
					<div class="form-group">
						<label for="new_plan_start_date" class="col-sm-2 control-label">开始时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control date-picker" id="new_plan_start_date" placeholder="开始时间" name="plan_start_date" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label for="new_plan_end_date" class="col-sm-2 control-label">结束时间</label>
						<div class="col-sm-10">
                            <input type="text" class="form-control date-picker" id="new_plan_end_date" placeholder="结束时间" name="plan_end_date" readonly/>
                        </div>
					</div>
                    <div class="form-group">
                        <label for="new_plan_remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_plan_remark" placeholder="备注" name="plan_remark" />
                        </div>
                    </div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createPlan()">创建</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改营销计划模态框 -->
<div class="modal fade" id="editPlanDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myAditModalLabel">修改营销计划</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_plan_form">
                    <input type="hidden" id="edit_plan_id" name="plan_id"/>

                    <div class="form-group">
                        <label for="edit_plan_name" class="col-sm-2 control-label">计划名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_plan_name" placeholder="计划名称" name="plan_name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_plan_content" class="col-sm-2 control-label">计划内容</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_plan_content" placeholder="计划内容" name="plan_content" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_plan_principal" class="col-sm-2 control-label">负责人</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_plan_principal" name="plan_principal" >
                                <option value="">--请选择--</option>
                                <c:forEach items="${sellers}" var="item">
                                    <option value="${item.user_id}">
                                            ${item.user_name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_plan_cost" class="col-sm-2 control-label">预计成本</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_plan_cost" placeholder="预计成本" name="plan_cost" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_plan_profits" class="col-sm-2 control-label">预计收益</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_plan_profits" placeholder="预计收益" name="plan_profits" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_plan_start_date" class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control date-picker" id="edit_plan_start_date" placeholder="开始时间" name="plan_start_date" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_plan_end_date" class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control date-picker" id="edit_plan_end_date" placeholder="结束时间" name="plan_end_date" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_plan_remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_plan_remark" placeholder="备注" name="plan_remark" />
                        </div>
                    </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updatePlan()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<%--查看营销计划模态框--%>
<div class="modal fade" id="viewPlanDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myViewModalLabel">查看营销计划</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="view_plan_form">
                    <input type="hidden" id="view_plan_id" name="plan_id"/>

                    <div class="form-group">
                        <label for="view_plan_name" class="col-sm-2 control-label">计划名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="view_plan_name" placeholder="计划名称" name="plan_name" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="view_plan_content" class="col-sm-2 control-label">计划内容</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="view_plan_content" placeholder="计划内容" name="plan_content" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="view_plan_principal" class="col-sm-2 control-label">负责人</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="view_plan_principal" name="plan_principal" disabled>
                                <option value="">--请选择--</option>
                                <c:forEach items="${sellers}" var="item">
                                    <option value="${item.user_id}">
                                            ${item.user_name}
                                    </option>
                                </c:forEach>
                            </select></div>
                    </div>
                    <div class="form-group">
                        <label for="view_plan_cost" class="col-sm-2 control-label">预计成本</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="view_plan_cost" placeholder="预计成本" name="plan_cost" readonly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="view_plan_profits" class="col-sm-2 control-label">预计收益</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="view_plan_profits" placeholder="预计收益" name="plan_profits" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="view_plan_start_date" class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control date-picker" id="view_plan_start_date" placeholder="开始时间" name="plan_start_date" readonly disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="view_plan_end_date" class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control date-picker" id="view_plan_end_date" placeholder="结束时间" name="plan_end_date" readonly disabled/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="view_plan_remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="view_plan_remark" placeholder="备注" name="plan_remark" readonly/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
<%--引入日期选择器--%>
<script src="../../js/bootstrap-datepicker.js"></script>
<script src="../../js/datepicker.zh-CN.min.js"></script>
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
    //清空新建营销计划窗口中的数据
	function clearPlan() {
	    $("#new_plan_name").val("");
	    $("#new_plan_content").val("");
	    $("#new_plan_cost").val("");
	    $("#new_plan_profits").val("");
	    /*$("#new_plan_principal").val("");*/
	    $("#new_plan_start_date").val("");
	    $("#new_plan_end_date").val("");
	    $("#new_plan_remark").val("");
	}
	// 创建营销计划
	function createPlan() {
        console.log($("#new_plan_form").serialize());
        $.post("<%=basePath%>market/createPlan.action",
        $("#new_plan_form").serialize(),function(data){
            console.log(data);
                if(data.result =="SUCCESS"){
                    spop({
                        template: '<h4 class="spop-title">营销计划创建成功！</h4>',
                        position: 'top-center',
                        style: 'success',
                        autoclose: 1000,
                        onClose : function(){
                            window.location.reload();
                        }
                    });
                }else{
                    spop({
                        template: '<h4 class="spop-title">营销计划创建失败！</h4>',
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
    // 查看营销计划
    function viewPlan(id){
        $.ajax({
            type:"get",
            url:"<%=basePath%>market/getPlanById.action",
            data:{"id":id},
            success:function(data) {
                console.log(data);
                //$("#edit_plan_id").val(data.plan_id);
                $("#view_plan_name").val(data.plan_name);
                $("#view_plan_content").val(data.plan_content);
                $("#view_plan_cost").val(data.plan_cost);
                $("#view_plan_principal").val(data.plan_principal)
                $("#view_plan_profits").val(data.plan_profits);
                $("#view_plan_start_date").val(dateFormat(data.plan_start_date));
                $("#view_plan_end_date").val(dateFormat(data.plan_end_date));
                $("#view_plan_remark").val(data.plan_remark);
            }
        });
    }
	// 通过id获取修改的营销计划信息
	function editPlan(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>market/getPlanById.action",
	        data:{"id":id},
	        success:function(data) {
                console.log(data);
	            $("#edit_plan_id").val(data.plan_id);
                $("#edit_plan_name").val(data.plan_name);
                $("#edit_plan_content").val(data.plan_content);
                $("#edit_plan_cost").val(data.plan_cost);
                $("#edit_plan_principal").val(data.plan_principal)
                $("#edit_plan_profits").val(data.plan_profits);
                $("#edit_plan_start_date").val(dateFormat(data.plan_start_date));
                $("#edit_plan_end_date").val(dateFormat(data.plan_end_date));
                $("#edit_plan_remark").val(data.plan_remark);
	        }
	    });
	}
    // 执行更新营销计划操作
	function updatePlan() {
		$.post("<%=basePath%>market/updatePlan.action",$("#edit_plan_form").serialize(),function(data){
			if(data.result =="SUCCESS"){
                spop({
                    template: '<h4 class="spop-title">营销计划更新成功！</h4>',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 1000,
                    onClose : function(){
                        window.location.reload();
                    }
                });
			}else{
                spop({
                    template: '<h4 class="spop-title">营销计划更新失败！</h4>',
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
	// 删除营销计划
	function deletePlan(id) {
        new $.flavr({
            modal       : false, //关闭模态
            content     : '确定删除该条计划吗 ？',
            dialog      : 'confirm',
            onConfirm   : function( $container ){
	        $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/market/deletePlan.action",
                data:{"id":id},
                success:function (data) {
                    if(data.result=="SUCCESS"){
                        spop({
                            template: '<h4 class="spop-title">营销计划删除成功！</h4>',
                            position: 'top-center',
                            style: 'success',
                            autoclose: 1000,
                            onClose : function(){
                                window.location.reload();
                            }
                        });
                    }else {
                        spop({
                            template: '<h4 class="spop-title">营销计划删除失败！</h4>',
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
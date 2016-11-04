<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sn" uri="http://www.sumscope.com/taglib"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<<html lang="en">
<head>
    <meta charset="UTF-8"  name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
    <title>记账</title>
    <script src="<sn:webroot/>/js/jquery.min.js"></script>
    <script src="<sn:webroot/>/js/jquery.mobile-1.4.5.min.js"></script>
    <script src="<sn:webroot/>/js/jquery.nbs.tag.ajax.js" ></script>
    <link rel="stylesheet" href="<sn:webroot/>/css/jquery.mobile-1.4.5.min.css">
    <link rel="stylesheet" href="<sn:webroot/>/css/jqm-demos.css">
</head>
<body>
<div data-role="page" class="jqm-demos" data-quicklinks="true">
    <div data-role="header">
        <div>
        	<sn:dataset name="ds1">select * from account_book where create_user = {param.username} or id in (select distinct account_book_id from account_book_user_rel where username={param.username})</sn:dataset>
            <fieldset data-role="fieldcontain" style="float:right;margin: 0;padding:0;">
                <select name="account_book" id="account_book" data-native-menu="false">
                	<sn:repeat varStatus="sts" var="item" items="${ds1}">
						 <option value="${item.id}">${item.name}</option>
					</sn:repeat>
                </select>
            </fieldset>
            <a href="#accountBookDialog" data-rel="popup"  data-transition="slidefade" data-position-to="window" class="ui-btn ui-icon-plus ui-btn-icon-notext"></a>
            <div data-role="popup" id="accountBookDialog">
                <a href="#" data-rel="back" id="account_book_btn_close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
                <div data-role="header">
                    <h1>添加账本</h1>
                </div>
                <div data-role="main" class="ui-content">

                    <form method="get" action="">
                        <input name="text" id="book_name" value="" placeholder="账本名称" type="text">
                    </form>
                </div>
                <div data-role="footer">
                    <button class="ui-btn" id="account_book_btn" style="width: 100%">确定</button>
                </div>
            </div>
            <a href="#accountDialog" data-rel="popup"  data-transition="flow" data-position-to="window" class="ui-btn ui-icon-calendar ui-btn-icon-notext"></a> 
            <div data-role="popup" id="accountDialog">
                <a href="#" data-rel="back" id="account_btn2_close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
                <div data-role="header">
                    <h1>添加账户</h1>
                </div>
                <div data-role="main" class="ui-content">
                    <form method="get" action="">
                        <input name="text" id="account_name" value="" placeholder="账户名称" type="text">
                        <input name="text" id="account_balance" value="" placeholder="余额" type="text">
                    </form>
                </div>
                <div data-role="footer">
                    <button class="ui-btn" id="account_btn2" style="width: 100%">确定</button>
                </div>
            </div>
            <a href="#myPopupDialog" data-rel="popup"  data-transition="slidedown" data-position-to="window" class="ui-btn ui-icon-edit ui-btn-icon-notext"></a>
            <a href="#shareDialog" data-rel="popup"  data-transition="turn" data-position-to="window" class="ui-btn ui-icon-action ui-btn-icon-notext"></a>
            <div data-role="popup" id="shareDialog">
                <a href="#" data-rel="back" id="share_btn_close" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
                <div data-role="header">
                    <h1>分享</h1>
                </div>
                <div data-role="main" class="ui-content">

                    <form method="get" action="">
                        <input name="text" id="share_name" value="" placeholder="分享给谁？" type="text">
                    </form>

                </div>
                <div data-role="footer">
                    <button class="ui-btn" id="share_btn" style="width: 100%">确定</button>
                </div>
            </div>
        </div>
    </div>

    <div data-demo-html="true" style="margin-top:4px;">
        <div data-role="tabs">
            <div data-role="navbar">
                <ul>
                    <li><a href="#one" data-theme="a" data-ajax="false" class="ui-btn-active ui-state-persist">明细</a></li>
                    <li><a href="#two" data-theme="a" data-ajax="false">账户</a></li>
                </ul>
            </div>

            <div id="one" class="ui-content">
            	<span id="bookDetail"></span>
                <table data-role="table" id="myTable" data-mode="columntoggle" class="ui-responsive">
                    <thead>
                    <tr>
                        <th data-priority="1">用途</th>
                        <th>费用</th>
                        <th data-priority="1">收支</th>
                        <th data-priority="1">时间</th>
                        <th data-priority="1">操作</th>
                    </tr>
                    </thead>
                    <tbody id="account_list">
                    </tbody>
                </table>
            </div>
            <div id="two" class="ui-content">
                <ul data-role="listview">
                	<sn:dataset name="ds2">select * from account where account_book_id = '1'</sn:dataset>
                	<sn:repeat varStatus="sts" var="item" items="${ds2}">
						 <li id="${item.id}"><a href="#">${item.name}</a></li>
					</sn:repeat>
                </ul>
            </div>
        </div>
        <div data-role="footer" data-position="fixed" data-tap-toggle="false">
            <a href="#myPopupDialog" data-rel="popup"  data-transition="slideup" data-position-to="window" class="ui-btn" style="width:100%;">记一笔</a>
            <div data-role="popup" id="myPopupDialog">
                <a id="account_btn_close" href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
                <div data-role="header">
                    <h1>记一笔</h1>
                </div>
                <div data-role="main" class="ui-content">

                    <form method="get" action="">
                        <select id="sz" name="sz">
                            <option value="0">支出</option>
                            <option value="1">收入</option>
                        </select>
                        <input name="text" id="yt" value="" placeholder="用途" type="text">
                        <input name="text" id="fy" value="" placeholder="费用" type="text">
                        <input type="date" name="date" id="date">
                        <select id="account" name=""account"">
	                        <sn:repeat varStatus="sts" var="item" items="${ds2}">
								 <option value="${item.id}">${item.name}</option>
							</sn:repeat>
                        </select>
                    </form>

                </div>
                <div data-role="footer">
                    <button class="ui-btn" id="account_btn" style="width: 100%">确定</button>
                </div>
            </div>
        </div><!-- /footer -->
    </div>
</div>
<script>
	var username = "<%=request.getParameter("username")%>";
	
	 var tr = '<tr id="tr_#id#">\
         <td>#purpose#</td>\
         <td>#cost#</td>\
         <td>#sts#</td>\
         <td>#cts#</td>\
         <td><a href="#" onclick="javascript:deleteDetail(\'#id#\');" class="ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all">delete</a></td>\
     </tr>';
     function initDetailList(){
    	 $.nbs.tagBiz({
    			webroot : '<sn:webroot/>',
    	   		biz_rel : 'detail_list',
    	   		ds_rel	: 'accounting.accounting',
    	   		async   : false,
    	   		arg		: {username:username,account_book_id:$("#account_book").val()},
    	   		callback: function(json){
    	   			$("#account_list").empty();
    	   			if(json.res){
    	   				$.each(json.ret.res,function(i,n){
    	   					var _tr = tr;
    	   					var _type = "支出";
    	   					if(n.type=='1'){
    	   						_type = "收入";
    	   					}
    	 	      			_tr = _tr.replace(/#purpose#/g,n.purpose);
    	 	      			_tr = _tr.replace(/#cost#/g,n.cost);
    	 	      			_tr = _tr.replace(/#sts#/g,_type);
    	 	      			_tr = _tr.replace(/#cts#/g,n.cts);
    	 	      			_tr = _tr.replace(/#id#/g,n.id);
    	 	      			$("#account_list").append(_tr);
    	   				});
    	   				$("#myTable").table("refresh");
    	   			}
    	 		}
    	 	});
     }
     function deleteDetail(id){
    	 $.post("<sn:webroot/>/restful/detail/delete.jhtml",{id:id},function(json){
      	   if(json.res){
      		   $("#tr_"+id).remove();
  				$("#myTable").table("refresh");
  				initBookDetail();
  			}
         });
     }
    function initBookDetail(){
    	$("#bookDetail").empty();
    	$.nbs.tagBiz({
			webroot : '<sn:webroot/>',
	   		biz_rel : 'book_get',
	   		ds_rel	: 'accounting.accounting',
	   		async   : false,
	   		arg		: {id:$("#account_book").val()},
	   		callback: function(json){
	   			if(json.res){
	   				$.each(json.ret.res,function(i,n){
	   					if(i==0){
	   						$("#bookDetail").text("总收入："+n.income+"，总支出："+n.outcome+"，剩余："+n.balance);
	   					}
	   				});
	   			}
	 		}
	 	});
    }
     
    $(function(){
    	$("#account_book_btn").on("click",function(){
    		var arg = {};
    		arg.name = $("#book_name").val();
    		 arg.create_user=username;
             $.nbs.tagBiz({
            	webroot : '<sn:webroot/>',
           		biz_rel : 'book_insert',
           		ds_rel	: 'accounting.accounting',
           		async   : false,
           		arg		: arg,
           		callback: function(json){
           			console.log(json);
           			$("#account_book_btn_close").click();
           			if(json.res){
           			}
         		}
         	});
    	});
    	$("#share_btn").on("click",function(){
    		var arg = {};
    		arg.name = $("#share_name").val();
    		 arg.account_book_id= $("#account_book").val();
             $.nbs.tagBiz({
            	 webroot : '<sn:webroot/>', 
           		biz_rel : 'share_insert',
           		ds_rel	: 'accounting.accounting',
           		async   : false,
           		arg		: arg,
           		callback: function(json){
           			console.log(json);
           			$("#share_btn_close").click();
           			if(json.res){
           			}
         		}
         	});
    	});
    	$("#account_btn2").on("click",function(){
    		var arg = {};
    		arg.name = $("#account_name").val();
    		arg.balance = $("#account_balance").val();
    		 arg.create_user=username;
    		 arg.account_book_id = $("#account_book").val();
             $.nbs.tagBiz({
            	 webroot : '<sn:webroot/>', 
           		biz_rel : 'book_account_insert',
           		ds_rel	: 'accounting.accounting',
           		async   : false,
           		arg		: arg,
           		callback: function(json){
           			$("#account_btn2_close").click();
           			if(json.res){
           			}
         		}
         	});
    	});
        $("#account_btn").on("click",function(){
           var arg  = {};
           arg.type = $("#sz").val();
           arg.purpose = $("#yt").val();
           arg.cost = $("#fy").val();
           arg.cost_time = $("#date").val();
           arg.account_id = $("#account").val();
           arg.account_book_id = $("#account_book").val();
           arg.create_user=username;
           $.post("<sn:webroot/>/restful/detail/insert.jhtml",arg,function(json){
        	   if(json.res){
    				var n = arg;
    				var _tr = tr;
 					var _type = "支出";
 					if(n.type=='1'){
 						_type = "收入";
 					}
	      			_tr = _tr.replace(/#purpose#/g,n.purpose);
	      			_tr = _tr.replace(/#cost#/g,n.cost);
	      			_tr = _tr.replace(/#sts#/g,_type);
	      			_tr = _tr.replace(/#cts#/g,n.cost_time);
	      			$("#account_list").prepend(_tr);
    				$("#account_btn_close").click();
    				$("#myTable").table("refresh");
    				initBookDetail();
    			}
           });
        });
        $("#account_book").on("change",function(){
        	initDetailList();
        	initBookDetail();
        });
        initDetailList();
        initBookDetail();
    });
</script>
</body>
</html>
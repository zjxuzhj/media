<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>音乐</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="http://localhost:8080/mango/">
				<img src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif" alt="xxx">
			</a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd" width="320" height="50"></div>	
	</div>
		<%@ include file="header.jsp" %>
		<%@ include file="menu.jsp" %>
	</div>	
<div class="container music_mediaList">
		<div class="span6">
			<div class="hotProductCategory">
				<!-- 一级分类显示 -->
				<s:iterator var="c" value="categoryList">
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath}/multmedia_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
							</dt>
								<!-- 显示二级分类 -->
								<s:iterator var="cs" value="#c.categorySeconds">
									<dd>
										<a href="${pageContext.request.contextPath}/multmedia_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>
									</dd>
								</s:iterator>	
						</dl>
					</s:iterator>	
			</div>
		</div>
		<div class="span18 last">
			
			<form id="productForm" action="${pageContext.request.contextPath}/image/蔬菜 - Powered By Mango Team.htm" method="get">
				<input type="hidden" id="brandId" name="brandId" value="">
				<input type="hidden" id="promotionId" name="promotionId" value="">
				<input type="hidden" id="orderType" name="orderType" value="">
				<input type="hidden" id="pageNumber" name="pageNumber" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="20">
					
				<div id="result" class="result table clearfix">
						<ul>
						<s:iterator var="p" value="pageBean.list">
						<li>
							<a href="${pageContext.request.contextPath}/multmedia_findByPid.action?pid=<s:property value="#p.pid"/>">
								<img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" width="170" height="170"  style="display: inline-block;">
								   
								<span style='color:green'>
								 <s:property value="#p.pname"/>
								</span>
								 
								<span class="price">
									商城价： ￥<s:property value="#p.shop_price"/>
								</span>
								 
							</a>
						</li>
						</s:iterator>	
						</ul>
				</div>
	<div class="pagination">
		第  <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
			<s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?csid=<s:property value="csid"/>&page=1" class="firstPage">&nbsp;</a>		
				<a href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>	
			</s:if>	
			<s:iterator var="i" begin="1" end="pageBean.totalPage" step="1">
				<s:if test="pageBean.page==#i">
					<span class="currentPage"><s:property value="#i"/></span>
				</s:if>
				<s:else>
					<a href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:else>
			</s:iterator>
				
			<s:if test="pageBean.page != pageBean.totalPage">
				<a class="nextPage" href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
			</s:if>	
	</div>
			</form>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd" width="950" height="52"></div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a >关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a >诚聘英才</a>
						|
					</li>
					<li>
						<a >法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						
					</li>

		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
	</div>
</div>
</body></html>
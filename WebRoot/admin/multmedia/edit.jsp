<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/jquery/jquery.datepick.css" type="text/css">
	</HEAD>
	<body>
		<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/multmedia_save.action" method="post" enctype="multipart/form-data">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑多媒体</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						媒体名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="mname" value="<s:property value="model.mname"/>" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						是否是热门：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input type="radio" name="is_hot" checked value="1"/>是
						<input type="radio" name="is_hot"  value="0"/>否
					</td>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						三级分类：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						
						<select name="ctid" >
							<s:iterator var="ct" value="ctList">
						   	 <option value="<s:property value="#ct.ctid"/>"><s:property value="#ct.ctname"/></option>
						    </s:iterator>
						</select>

					</td>
				</tr>
				
				
				<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" colSpan="3">
						<input type="file" name="upload" size="30" value="" id="userAction_save_do_upload"/>
					</td>
				</tr>
				<TR>
					<TD class="ta_01" align="center" bgColor="#f5fafe">
						描述：
					</TD>
					<TD class="ta_01" bgColor="#ffffff" colSpan="3">
						<textarea name="mdesc" cols="30" rows="3" id="userAction_save_do_remark" style="WIDTH: 96%"><s:property value="model.mdesc"/></textarea>
					</TD>
				</TR>
				<TR>
					<td align="center" colSpan="4" class="sep1">
						<img src="${pageContext.request.contextPath}/images/shim.gif">
					</td>
				</TR>


				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" name="submit" value="&#30830;&#23450;" class="button_ok">
							&#30830;&#23450;
						</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="&#37325;&#32622;" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
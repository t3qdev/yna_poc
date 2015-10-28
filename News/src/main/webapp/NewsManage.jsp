<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,com.t3q.news.dto.NewsDTO"%>
	
	
<%

	List<NewsDTO> list = (List<NewsDTO>)request.getAttribute("NEWS_LIST");
%>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3;url='/News/NewsServlet'" />
<title>분산 플랫폼 Concept 검증 Demo</title>

<style>
<!--
.nmsw_linked {
	color: white;
	background-color: rgb(94, 150, 194);
}
-->
</style>


<style type="text/css">
<!--
a:link {
	text-decoration: none;
	color: #000000;
}

a:visited {
	text-decoration: none;
	color: #000000;
}

a:active {
	text-decoration: none;
	color: #000000;
}

a:hover {
	text-decoration: none;
	color: #ffffff;
}
-->
</style>

<script language="JavaScript">
<!--
	function namosw_cell_rollover(cell, classname) {
		if (document.all || document.getElementById) {
			cell.classBackup = cell.className;
			cell.className = classname;
		}
	}

	function namosw_cell_rollout(cell) {
		if (document.all || document.getElementById) {
			cell.className = cell.classBackup;
		}
	}
// -->
</script>
</head>

<body bgcolor="whitesmoke" text="black">
	<table border="0" width="900" align="center">
		<tr>
			<td width="200" bordercolor="white" bgcolor="#666666" height="50"
				valign="middle">
				<p align="center">
					<b><font size="4" face="맑은 고딕" color="white">통합 CMS</font></b>
				</p>
			</td>
			<td width="700" height="50" bgcolor="#CCCCCC" bordercolor="white"
				valign="middle">
				<p>
					<b><font face="맑은 고딕"><span style="font-size: 16pt;">&nbsp;&nbsp;&nbsp;</span><span
							style="font-size: 14pt;">&nbsp;기사 관리</span></font></b>
				</p>
			</td>
		</tr>
		<tr>
			<td width="200" bordercolor="white" height="5"></td>
			<td width="700" bordercolor="white" height="5"></td>
		</tr>
		<tr>
			<td width="200" bordercolor="white" height="700" valign="top"
				bgcolor="#ACD6F6">

				<p align="center">&nbsp;</p>
				<table border="0" cellpadding="4" width="184" align="center"
					cellspacing="4">
					<tr>
						<td width="184" align="center" bgcolor="white" valign="middle"
							OnMouseOut="namosw_cell_rollout(this)"
							OnMouseOver="namosw_cell_rollover(this, 'nmsw_linked')"
							height="35">

							<p align="left">
								<b><font size="2" face="맑은 고딕">&nbsp;<a
										href="/News/NewsServlet">기사 관리</a></font></b>
							</p>
						</td>
					</tr>
					<tr>
						<td width="184" bgcolor="white" align="center" valign="middle"
							height="35" OnMouseOut="namosw_cell_rollout(this)"
							OnMouseOver="namosw_cell_rollover(this, 'nmsw_linked')">

							<p align="left">
								<b><font size="2" face="맑은 고딕">&nbsp;<a
										href="CreateNews.jsp">기사 작성</a></font></b>
							</p>
						</td>
					</tr>
				</table>
				<p align="center">&nbsp;</p>

			</td>
			<td width="700" bordercolor="white" align="left" valign="top"
				bgcolor="white">
				<p>&nbsp;</p>
				<p>
					&nbsp;&nbsp;&nbsp;<font face="맑은 고딕"><b>&nbsp;&nbsp;◆
							데스크</b></font>
				</p>
				<table border="1" align="center" width="640" bgcolor="#FAFAFA"
					bordercolor="#CCCCCC" cellspacing="0" bordercolordark="#999999"
					bordercolorlight="white">
					<tr>
						<td width="44" bgcolor="#D7E4BD" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>순번</b></font>
							</p>
						</td>
						<td width="356" bgcolor="#D7E4BD">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>기사 제목</b></font>
							</p>
						</td>
						<td width="144" bgcolor="#D7E4BD">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>등록일시</b></font>
							</p>
						</td>
						<td width="78" bgcolor="#D7E4BD">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>부서</b></font>
							</p>
						</td>
					</tr>
					
<%


for(int i=list.size()-1   ; i >= 0 ; i--){
	
	//for(int i= 0 ; i < list.size() ; i++){
	NewsDTO  news = list.get(i);
	
%>	
					
					<tr>
						<td width="44" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕"><b><%=news.getId() %></b></font>
							</p>
						</td>
						<td width="356">
							<p align="left">
								<font size="2" face="맑은 고딕">&nbsp;&nbsp;<%=news.getTitle() %></font>
							</p>
						</td>
						<td width="144">
							<p align="center">
								<font size="2" face="맑은 고딕"><%=news.getRegDate() %></font>
							</p>
						</td>
						<td width="78" align="center" valign="middle">
							<p align="center">
								<font size="2" face="맑은 고딕"><%=news.getPart() %></font>
							</p>
						</td>
					</tr>
<%
}

%>	
		
				</table>


			</td>
		</tr>
	</table>
</body>

</html>

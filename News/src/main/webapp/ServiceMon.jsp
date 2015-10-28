<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
					<b><font size="4" face="맑은 고딕" color="white">분산관리자</font></b>
				</p>
			</td>
			<td width="700" height="50" bgcolor="#CCCCCC" bordercolor="white"
				valign="middle">
				<p>
					<b><font face="맑은 고딕"><span style="font-size: 16pt;">&nbsp;&nbsp;&nbsp;</span><span
							style="font-size: 14pt;">&nbsp;서비스 등록</span></font></b>
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
										href="ZKMon.jsp">코디네이터 관제</a></font></b>
							</p>
						</td>
					</tr>
					<tr>
						<td width="184" bgcolor="white" align="center" valign="middle"
							height="35" OnMouseOut="namosw_cell_rollout(this)"
							OnMouseOver="namosw_cell_rollover(this, 'nmsw_linked')">

							<p align="left">
								<b><font size="2" face="맑은 고딕">&nbsp;<a
										href="RegServiceList.jsp">서비스 등록</a></font></b>
							</p>
						</td>
					</tr>
					<tr>
						<td width="184" bgcolor="white" align="center" valign="middle"
							height="35" OnMouseOut="namosw_cell_rollout(this)"
							OnMouseOver="namosw_cell_rollover(this, 'nmsw_linked')">

							<p align="left">
								<b><font size="2" face="맑은 고딕">&nbsp;<a
										href="ServiceMon.jsp">서비스 관리</a></font></b>
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
							서비스 관리</b></font>
				</p>
				<p>
					&nbsp;<font face="맑은 고딕"><b>&nbsp;&nbsp;&nbsp;&nbsp;/news</b></font>
				</p>
				<p align="center">
					<img src="img/monitor_news.jpg" width="632" height="290" border="0"
						usemap="#ImageMap1">
				</p>
				<p align="left">
					<font face="맑은 고딕"><b>&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/cms
					</b></font>
				</p>
				<p align="center">
					<img src="img/monitor_cms.jpg" width="632" height="279" border="0">
				</p>
				<p align="left">
					&nbsp;&nbsp;&nbsp;&nbsp;<font face="맑은 고딕"><b>&nbsp;&nbsp;<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/wcms
					</b></font>
				</p>
				<p align="center">
					<img src="img/monitor_wcms.jpg" width="632" height="261" border="0">
				</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>





			</td>
		</tr>
	</table>
</body>

</html>

<map name="ImageMap1">
	<area shape="rect" coords="254, 11, 310, 63" href="이미지맵">
</map>
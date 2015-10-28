<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
							등록된 서비스</b></font>
				</p>
				<table border="1" align="center" width="640" bgcolor="#FAFAFA"
					bordercolor="#CCCCCC" cellspacing="0" bordercolordark="#999999"
					bordercolorlight="white">
					<tr>
						<td width="65" bgcolor="#D7E4BD" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>순번</b></font>
							</p>
						</td>
						<td width="286" bgcolor="#D7E4BD">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>서비스</b></font>
							</p>
						</td>
						<td width="201" bgcolor="#D7E4BD">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>등록파일</b></font>
							</p>
						</td>
						<td width="92" bgcolor="#D7E4BD">
							<p align="center">
								<font size="2" face="맑은 고딕"><b>삭제</b></font>
							</p>
						</td>
					</tr>
					<tr>
						<td width="65" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕">1</font>
							</p>
						</td>
						<td width="286">
							<p align="center">
								<font size="2" face="맑은 고딕">/news</font>
							</p>
						</td>
						<td width="201">
							<p align="center">
								<font size="2" face="맑은 고딕">news.war</font>
							</p>
						</td>
						<td width="92" align="center" valign="middle">
							<p align="center">
								<font size="2" face="맑은 고딕"><img src="img/btn_delete.jpg"
									width="51" height="21" border="0"></font>
							</p>
						</td>
					</tr>
					<tr>
						<td width="65" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕">2</font>
							</p>
						</td>
						<td width="286">
							<p align="center">
								<font size="2" face="맑은 고딕">/cms</font>
							</p>
						</td>
						<td width="201">
							<p align="center">
								<font size="2" face="맑은 고딕">cms.war</font>
							</p>
						</td>
						<td width="92" align="center" valign="middle">
							<p align="center">
								<font size="2" face="맑은 고딕"><img src="img/btn_delete.jpg"
									width="51" height="21" border="0"></font>
							</p>
						</td>
					</tr>
					<tr>
						<td width="65" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕">3</font>
							</p>
						</td>
						<td width="286">
							<p align="center">
								<font size="2" face="맑은 고딕">/wcms</font>
							</p>
						</td>
						<td width="201">
							<p align="center">
								<font size="2" face="맑은 고딕">wcms.war</font>
							</p>
						</td>
						<td width="92" align="center" valign="middle">
							<p align="center">
								<font size="2" face="맑은 고딕"><img src="img/btn_delete.jpg"
									width="51" height="21" border="0"></font>
							</p>
						</td>
					</tr>
					<tr>
						<td width="65" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕">&nbsp;</font>
							</p>
						</td>
						<td width="286">
							<p align="center">
								<font size="2" face="맑은 고딕">&nbsp;</font>
							</p>
						</td>
						<td width="201">
							<p align="center">
								<font size="2" face="맑은 고딕">&nbsp;</font>
							</p>
						</td>
						<td width="92">
							<p align="center">
								<font size="2" face="맑은 고딕">&nbsp;</font>
							</p>
						</td>
					</tr>
				</table>
				<p>&nbsp;</p>
				<p>
					&nbsp;&nbsp;&nbsp;<font face="맑은 고딕"><b>&nbsp;&nbsp;◆
							서비스 등록</b></font>
				</p>
				<table border="1" align="center" width="640" bgcolor="#FAFAFA"
					bordercolor="#CCCCCC" cellspacing="0" bordercolordark="#999999"
					bordercolorlight="white">
					<tr>
						<td width="79" bgcolor="#D7E4BD" height="35">
							<p align="center">
								<font size="2" face="맑은 고딕">서비스 명</font>
							</p>
						</td>
						<td width="166" bgcolor="white">
							<p align="center">
								<font size="2" face="맑은 고딕"><input type="text"
									name="formtext1" maxlength="20" size="20"
									style="background-color: rgb(232, 236, 216); padding: 2px; border-width: 1px; border-color: rgb(153, 153, 153); border-style: solid;"></font>
							</p>

						</td>
						<td width="86" bgcolor="#D7E4BD">
							<p align="center">
								<font size="2" face="맑은 고딕">파일찾기</font>
							</p>
						</td>
						<td width="200" bgcolor="white">

							<p align="center">
								<font size="2" face="맑은 고딕"><input type="text"
									name="formtext2" maxlength="20" size="26"
									style="background-color: rgb(232, 236, 216); padding: 2px; border-width: 1px; border-color: rgb(153, 153, 153); border-style: solid;"></font>
							</p>

						</td>
						<td width="87" bgcolor="white">
							<p align="center">
								<font size="2" face="맑은 고딕"><img
									src="img/btn_register.jpg" width="52" height="20" border="0"></font>
							</p>
						</td>
					</tr>
				</table>
				<p>&nbsp;</p>


			</td>
		</tr>
	</table>
</body>

</html>
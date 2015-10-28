<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.t3q.zookeeper.ZKClientConnectionForAppClient,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="2;url='/News/ZKMon.jsp'" />
<title>분산 플랫폼 Concept 검증 Demo</title>

<style>
<!--
.nmsw_linked { color:white; background-color:rgb(94,150,194); }
-->
</style>


<style type="text/css">
 <!--
a:link { text-decoration:none; color:#000000; }
 a:visited { text-decoration:none; color:#000000; }
 a:active { text-decoration:none; color:#000000; }
 a:hover { text-decoration:none; color:#ffffff; }
 -->
 </style>
 
<script language="JavaScript"><!--
function namosw_cell_rollover(cell, classname) {
  if (document.all || document.getElementById) {
    cell.classBackup = cell.className;
    cell.className   = classname;
  }
}

function namosw_cell_rollout(cell)
{
  if (document.all || document.getElementById) {
    cell.className   = cell.classBackup;
  }
}
// -->
</script>
</head>

<body bgcolor="whitesmoke" text="black">
<table border="0" width="900" align="center">
    <tr>
        <td width="200" bordercolor="white" bgcolor="#666666" height="50" valign="middle">
            <p align="center"><b><font size="4" face="맑은 고딕" color="white">분산관리자</font></b></p>
</td>
        <td width="700" height="50" bgcolor="#CCCCCC" bordercolor="white" valign="middle">            <p><b><font face="맑은 고딕"><span style="font-size:16pt;">&nbsp;&nbsp;&nbsp;</span><span style="font-size:14pt;">코디네이터 관제</span></font></b></p>
</td>
    </tr>
    <tr>
        <td width="200" bordercolor="white" height="5"></td>
        <td width="700" bordercolor="white" height="5"></td>
    </tr>
    <tr>
        <td width="200" bordercolor="white" height="700" valign="top" bgcolor="#ACD6F6">

            <p align="center">&nbsp;</p>
            <table border="0" cellpadding="4" width="184" align="center" cellspacing="4">
                <tr>
                    <td width="184" align="center" bgcolor="white" valign="middle" OnMouseOut="namosw_cell_rollout(this)" OnMouseOver="namosw_cell_rollover(this, 'nmsw_linked')" height="35">

                        <p align="left"><b><font size="2" face="맑은 고딕">&nbsp;<a href="ZKMon.jsp">코디네이터 관제</a></font></b></p>
</td>
                </tr>
                <tr>
                    <td width="184" bgcolor="white" align="center" valign="middle" height="35" OnMouseOut="namosw_cell_rollout(this)" OnMouseOver="namosw_cell_rollover(this, 'nmsw_linked')">

                        <p align="left"><b><font size="2" face="맑은 고딕">&nbsp;<a href="RegServiceList.jsp">서비스 등록</a></font></b></p>
</td>
                </tr>
                <tr>
                    <td width="184" bgcolor="white" align="center" valign="middle" height="35" OnMouseOut="namosw_cell_rollout(this)" OnMouseOver="namosw_cell_rollover(this, 'nmsw_linked')">

                        <p align="left"><b><font size="2" face="맑은 고딕">&nbsp;<a href="ServiceMon.jsp">서비스 관리</a></font></b></p>
</td>
                </tr>
            </table>            <p align="center">&nbsp;</p>

</td>
        <td width="700" bordercolor="white" align="center" valign="top" bgcolor="white">
            <p><br>&nbsp;</p>
			
<!-- 첫번째 NEWS 표 -->

            <table border="0" cellpadding="0" cellspacing="0" width="600">
                <tr>
                    <td width="190"  bgcolor="#D7E4BD" align="center" valign="middle">
                        <p align="center"><b><font size="4" face="맑은 고딕">/news</font></b></p>
</td>
                    <td width="379" align="center" valign="middle" bgcolor="white">
                        <table border="0" cellpadding="4" cellspacing="5" width="400">
                        
<%

		ZKClientConnectionForAppClient client = new ZKClientConnectionForAppClient();
		List<String> servers = new ArrayList();

		try {
			client.startZKClient("127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183", "/NewsEJB3");
				
		 
			servers = client.zk.getChildren("/NewsEJB3",	client);
			//System.out.println("======= 현재 /NewsEJB3의 서버 정보="+servers+"입니다. ");
			client.zk.close(); 
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		
		for( int i =0 ; i < servers.size() ;i++){
%>       
                            <tr>
                                <td width="140" align="center" valign="middle"><img src="img/arrow0.jpg" width="100" height="30" border="0"></td>
                                <td width="260" bgcolor="#EBF1DE" height="34" align="center" valign="middle">

                                    <p align="center"><font face="맑은 고딕"><span style="font-size:11pt;"><%=servers.get(i) %></span></font></p>
                               </td>
                            </tr>
<%
		}
%>     
            </table></td>
                </tr>
            </table>

<!-- 첫번째 NEWS 표 end  -->

            <p>&nbsp;</p>

<!-- 두번째 CMS 표 -->

            <table border="0" cellpadding="0" cellspacing="0" width="600">
                <tr>
                    <td width="190"  bgcolor="#C6D9F1" align="center" valign="middle">

                        <p align="center"><b><font size="4" face="맑은 고딕">/cms</font></b></p>
</td>
                    <td width="379" align="center" valign="middle" bgcolor="white">

                        <table border="0" cellpadding="4" cellspacing="5" width="400">
                            <tr>
                                <td width="140" align="center" valign="middle"><img src="img/arrow0.jpg" width="100" height="30" border="0"></td>
                                <td width="260" bgcolor="#DCE6F2" height="34" align="center" valign="middle">
                                    <p align="center"><font face="맑은 고딕"><span style="font-size:11pt;">192.168.0.1:8080</span></font></p>
</td>
                </tr>
                            <tr>
                                <td width="140" align="center" valign="middle"><img src="img/arrow0.jpg" width="100" height="30" border="0"></td>
                                <td width="260" bgcolor="#DCE6F2" height="34" align="center" valign="middle">                        

                                    <p align="center"><font face="맑은 고딕"><span style="font-size:11pt;">192.168.0.2:8080</span></font></p>
</td>
                </tr>
                            <tr>
                                <td width="140" align="center" valign="middle"><img src="img/arrow0.jpg" width="100" height="30" border="0"></td>
                                <td width="260" bgcolor="#DCE6F2" height="34" align="center" valign="middle">                        

                                    <p align="center"><font face="맑은 고딕"><span style="font-size:11pt;">192.168.0.3:8080</span></font></p>
</td>
                </tr>
            </table></td>
                </tr>
            </table> 
			
<!-- 두번째 CMS 표 END -->


			           <p>&nbsp;</p>

<!-- 세번째 WCMS 표 -->


            <table border="0" cellpadding="0" cellspacing="0" width="600">
                <tr>
                    <td width="190"  bgcolor="#DDD9C3" align="center" valign="middle">

                        <p align="center"><b><font size="4" face="맑은 고딕">/wcms</font></b></p>
</td>
                    <td width="379" align="center" valign="middle" bgcolor="white">

                        <table border="0" cellpadding="4" cellspacing="5" width="400">
                            <tr>
                                <td width="140" align="center" valign="middle"><img src="img/arrow0.jpg" width="100" height="30" border="0"></td>
                                <td width="260" bgcolor="#EEECE1" height="34" align="center" valign="middle">
                                    <p align="center"><font face="맑은 고딕"><span style="font-size:11pt;">192.168.0.1:8080</span></font></p>
</td>
                </tr>
                            <tr>
                                <td width="140" align="center" valign="middle"><img src="img/arrow0.jpg" width="100" height="30" border="0"></td>
                                <td width="260" bgcolor="#EEECE1" height="34" align="center" valign="middle">                        

                                    <p align="center"><font face="맑은 고딕"><span style="font-size:11pt;">192.168.0.2:8080</span></font></p>
</td>
                </tr>
                            <tr>
                                <td width="140" align="center" valign="middle"><img src="img/arrow0.jpg" width="100" height="30" border="0"></td>
                                <td width="260" bgcolor="#EEECE1" height="34" align="center" valign="middle">                        

                                    <p align="center"><font face="맑은 고딕"><span style="font-size:11pt;">192.168.0.3:8080</span></font></p>
</td>
                </tr>
            </table></td>
                </tr>
            </table>            
			
<!-- 세번째 WCMS 표 -->
			
			<p>&nbsp;</p>

</td>
    </tr>
</table>
</body>

</html>

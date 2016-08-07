<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티 글쓰기</title>
</head>
<body>
<div id="centered">
	
	<br />
	<form>	
		<table>
		   <tr style="background-color:#eaeaea;">
		            <td colspan="3" style="width:200px; line-height:250%;">
		            분류
		            <select name="content_type_code" >
		                           
		           </select>          
		          &nbsp;&nbsp;&nbsp;&nbsp;<b>글쓴이 : 장영완</b>
		          &nbsp;&nbsp;&nbsp;&nbsp;제목 : <input type="text" name="board_subject" size="80" maxlength="150" value="">
		    </tr>
		    <tr>
		        <td colspan="3" style="text-align: left"><input type="checkbox" name="ishide" value="true">비공개</td>
		    </tr>
		    <tr>
		        <td colspan="3">
		            <textarea name="board_content" style="width: 900px; height: 400px"></textarea>
		            <br><br>
		        </td>
		    </tr>
		    <tr>
		        <td style="width:300px;">        
		            <select id="uploaded_file_list" multiple="multiple"  title="Attached File List" style="width: 300px; height: 100px;">
		                <option></option>
		            </select>
		        </td>
		        <td  style="width:90px;">
		            <input type="button" name="addFile" value="파일첨부">
		            <br><br>
		            <input type="button" name="delFile" value="선택삭제">
		        </td>
		        <td style="text-align:left">
		            파일을 첨부해야 하는 경우 파일첨부 버튼을 클릭하여 주십시오.
		            <br>첨부된 파일의 리스트 제거를 원할경우 리스트 선택후 선택삭제 버튼을 클릭하시면 됩니다.
		        </td>
		    </tr>
		</table>
		<br>
		<input type="button" name="back" value="돌아가기">
		<input type="submit" name="submit" value="등록">
	</form>
	<br />
</div>
</body>
</html>
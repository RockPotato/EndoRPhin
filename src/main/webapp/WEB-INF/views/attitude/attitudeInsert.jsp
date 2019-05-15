<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="modal fade" id="attitudeInsert" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel" style="color: black">
  <div class="modal-dialog modal-80size" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header"><h2>근태항목 등록</h2>
      </div>
      <div class="modal-body">
        <div class="form-group">
						<form action="${cp}/attitude/insertAttitude" method="get">
							<label for="inputName">근태 코드</label> <input type="text" 
								class="form-control" id="attitudeCode" name="attitudeCode" placeholder="근태코드를 입력해 주세요">
								
								<input type="button" id="emplCheck" name="emplCheck" value="중복체크"/> 
								<span id="duplicate"></span>
								
					</div>
					<div class="form-group">
						<label for="InputEmail">근태명</label> <input type="text"
							class="form-control" id="attitudeName" name="attitudeName" placeholder="근태명을 입력해주세요">
					</div>
					
					
					<div class="form-group">
						<table>
							<tr>
								<td><label for="inputPassword">유/무급 분류</label></td>
								<td><select id="paidStatus" name="paidStatus" class="form-control">
										<option value="유급">유급</option>
										<option value="무급">무급</option>
								</select></td>
							
							</tr>
							</table>
						</div>
						
						<div class="form-group">
						<label for="InputEmail">기준일수</label> <input type="text"
							class="form-control" id="baseDays" name="baseDays" placeholder="기준일수를 입력해주세요">
					</div>
						
						
						<div class="form-group">
						<label for="InputEmail">비고</label> <input type="text"
							class="form-control" id="relate" name="relate" placeholder="비고란을 입력해주세요">
					</div>
					
					
      </div>
      <div class="modal-footer">
      <button type="submit" class="btn btn-default">등록</button>
					</form>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>



















</body>
</html>
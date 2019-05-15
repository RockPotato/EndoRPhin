<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<body>
    <form name="form" action="/boardUpdateSave">
        <table border="1" style="width:600px">
            <caption>게시판 수정</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
                <tr>
                    <td>작성자</td> 
                    <td><input type="text" name="userId" size="20" maxlength="20" value="${boardInfo.userId}"></td> 
                </tr>
                <tr>
                    <td>제목</td> 
                    <td><input type="text" name="title" size="70" maxlength="250" value="${boardInfo.title}"></td> 
                </tr>
                <tr>
                    <td>내용</td> 
                    <td><textarea name="contents" rows="5" cols="60">${boardInfo.contents}</textarea></td> 
                </tr>
            </tbody>
        </table>    
        <input type="hidden" name="boardNo" value="${boardInfo.boardNo}"> 
        <a href="#" onclick="form.submit()">저장</a>
    </form>    
</body>

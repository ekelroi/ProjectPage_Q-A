<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">
   <h2>Q&amp;A등록</h2>
   <form:form action="questAnswerWrite.do" enctype="multipart/form-data" commandName="questAnswerVO" id="register_form">
      <table class="qna-write-mainTable">
         <colgroup>
            <col width="15%" />
            <col width="85%" />
         </colgroup>
         <tr>
            <th style="border-bottom:1px solid lightgray;"><label for="q_id">작성자</label></th>
            <td style="border-bottom:1px solid lightgray;"><%= session.getAttribute("user_id") %></td>
         </tr>
         <tr>
            <th><label for="q_title">제목</label></th>
            <td><form:input path="q_title" id="q_title" maxlength="50"/></td>
          </tr>
          <tr class="qna-write-tr">
          	<th>이미지/파일 업로드</th>
          	<td>
          		<input class="upload-name" value="파일선택" disabled="disabled" > 
          		
          		<label for="q_upload">업로드</label> 
          		<input type="file" id="q_upload" class="upload-hidden" name="q_upload">
          	</td>
          </tr>
      </table>
      
     <p class="qna-p">
         <form:textarea path="question" id="qna-write-question" style="resize: none;" maxlength="4000" />
      </p>
 		<div class="qna-align-right">(<span id="checkChar">0</span>/4000)</div>
      <div class="align-center">
         <input type="submit" value="등록">
         <input type="button" value="목록" onclick="location.href='questAnswerList.do'">
      </div>

   </form:form>
</div>

<script type="text/javascript">
  /* 유효성 체크 */
	$('#register_form').submit(function(){ 
		if ($('#q_title').val() == '') {//null data 유효성체크
			alert('제목을 입력하세요');
			$('#q_title').focus();
			return false;
		}
		if(!maxLengthCheck("q_title", "제목")){//maxdata
             return false;
        }
		if ($('#qna-write-question').val() == '') {//null data 유효성체크
			alert('내용을 입력하세요');ㅁ
			$('#question').focus();
			return false;
		}
		  
	});
   
  /* 글자 수 체크 */
		document.getElementById('qna-write-question').onkeyup=function(){
		//입력한 글자 수
						//this = textarea , value : 입력한 값, length : 입력한 글자 수
		var inputLength = this.value.length;
		//남은 글자 수를 구함
		var remain = inputLength;
			
		//문서 객체에 반영
		var letter = document.getElementById('checkChar');
		letter.innerHTML = remain;
		};
		
   /* 파일 업로드시 파일 명 추출  */
	$(document).ready(function(){ 
	var fileTarget = $('.qna-write-tr .upload-hidden'); 
	
	fileTarget.on('change', function(){ // 값이 변경되면
 	if(window.FileReader){ // modern browser 
		var filename = $(this)[0].files[0].name; 
 	} else { // old IE 
 		var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
	} 

	// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename); 
	}); 
});


	 
/*----------------------------------------------------------------------------------------------------------------------------------*/	 
	/**
	 * 바이트 문자 입력가능 문자수 체크
	 * 
	 * @param id : tag id 
	 * @param title : tag title
	 * @param maxLength : 최대 입력가능 수 (byte)
	 * @returns {Boolean}
	 */
	function maxLengthCheck(id, title, maxLength){
	     var obj = $("#"+id);
	     if(maxLength == null) {
	         maxLength = obj.attr("maxLength") != null ? obj.attr("maxLength") : 1000;
	     }
	     if(Number(byteCheck(obj)) > Number(maxLength)) {
	         alert(title + "이(가) 입력가능문자수를 초과하였습니다.\n(영문, 숫자, 일반 특수문자 : " + maxLength + " / 한글, 한자, 기타 특수문자 : " + parseInt(maxLength/2, 10) + ").");
	         obj.focus();
	         return false;
	     } else {
	         return true;
	    }
	}
	/**
	 * 바이트수 반환  
	 * 
	 * @param el : tag jquery object
	 * @returns {Number}
	 */
	function byteCheck(el){
	    var codeByte = 0;
	    for (var idx = 0; idx < el.val().length; idx++) {
	        var oneChar = escape(el.val().charAt(idx));
	        if ( oneChar.length == 1 ) {
	            codeByte ++;
	        } else if (oneChar.indexOf("%u") != -1) {
	            codeByte += 2;
	        } else if (oneChar.indexOf("%") != -1) {
	            codeByte ++;
	        }
	    }
	    return codeByte;
	}
</script>
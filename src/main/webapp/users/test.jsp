<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="admin-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
        <script  src="https://code.jquery.com/jquery-3.3.1.js"  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="  crossorigin="anonymous"></script>
        <title>test1</title>
        
<script type="text/javascript">
    function sendit() {
        var mName = document.getElementById("mName");
        var mJumin1 = document.getElementById("mJumin1");
        var mJumin2 = document.getElementById("mJumin2");
        var mJuminNumber = mJumin1.value + mJumin2.value;

        //주민번호 앞자리(mJumin1)에 공백을 제거하고도 아무 입력이 되지않았을 경우 
        if(mJumin1.value.replace(/\s/g,"") == "")
        {
            alert("주민등록번호 앞자리를 입력해 주세요");
            mJumin1.focus();
            return false;
        }

        //주민번호 앞자리(mJumin1)가 6자리가 안 될 경우 
        if(mJumin1.value.length < 6)
        {
            alert("주민등록번호 앞자리를 정확히 입력해 주세요");
            mJumin1.focus();
            return false;
        }
    
        //주민번호 뒷자리(mJumin2)에 공백을 제거하고도 아무 입력이 되지않았을 경우 
        if(mJumin2.value.replace(/\s/g,"") == "")
        {
            alert("주민등록번호 뒷자리를 입력해 주세요");
            mJumin2.focus();
            return false;
        }
    
        //주민번호 뒷자리(mJumin2)가 7자리가 안 될 경우 
        if(mJumin2.value.length < 7)
        {
            alert("주민등록번호 뒷자리를 정확히 입력해 주세요");
            mJumin2.focus();
            return false;
        }

        //올바른 주민등록번호가 입력되는지 검사
      var total = 0;
        var cnt = 2;
        for (var i = 0; i < mJuminNumber.length - 1; i++) {
            if (cnt > 9) {
                cnt = 2;
            }
            total += parseInt(mJuminNumber.charAt(i)) * cnt;

            cnt++;

        }

        var check = (11 - (total % 11)) % 10;

        if(parseInt(check) != parseInt(mJuminNumber.charAt(12)))
        {
            alert("잘못된 주민등록번호 입니다.");
            mJumin1.value = "";
            mJumin2.value = "";
            mJumin1.focus();
            return false;
         }
}
</script>        
        
    </head>
    
    <body>


 <tr>
      <td><strong>이름</td>
      <td><input name="mName" type="text" id="mName" size="10" /></td>
      <td><strong>주민등록번호</td>
      <td><input name="mJumin1" type="text" id="mJumin1" maxlength="6"/> 
       - <input name="mJumin2" type="password" id="mJumin2" maxlength="7" />
      </td>
</tr>

<img src="button_ok.gif" alt="확인" onclick="javascript:sendit();"/>





    </body>
</html>
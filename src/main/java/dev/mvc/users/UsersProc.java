package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;



@Component("dev.mvc.users.UsersProc")
public class UsersProc implements UsersProcInter{
  @Autowired
  private UsersDAOInter usersDAO;
  
  public UsersProc() {
    System.out.println(" --> UsersProc created.");
  }
  
  @Override
  public int checkID(String userID) {
    int cnt = this.usersDAO.checkID(userID);
    return cnt;
  }

  @Override
  public int create(UsersVO usersVO) {
    int cnt = this.usersDAO.create(usersVO);
    return cnt;
  }
  
  @Override
  public List<UsersVO> list() {
    List<UsersVO> list = this.usersDAO.list();
    return list;
  }
  
  @Override
  public UsersVO read(int userno) {
    UsersVO usersVO = this.usersDAO.read(userno);
    return usersVO;
  }
  
  @Override
  public int update(UsersVO usersVO) {
    int cnt = this.usersDAO.update(usersVO);
    return cnt;
  }
  
  @Override
  public int delete(int userno) {
    int cnt = this.usersDAO.delete(userno);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = this.usersDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = this.usersDAO.passwd_update(map);
    return cnt;
  }
  
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = this.usersDAO.search_count(hashMap);
    return count;
  }
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명 
   * @param cateno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  @Override
  public String pagingBox(String listFile, int userno, int search_count, int nowPage, String word){ 
    int totalPage = (int)(Math.ceil((double)search_count/Users.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Users.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Users.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Users.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Users.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
    // str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _nowPage = (nowGrp-1) * Users.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+_nowPage+"&userno="+userno+"'>이전</A></span>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){   // 마지막 페이지를 넘어갔다면 페이지 출력 종료
        break; 
      } 
  
      if (nowPage == i){    // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{       
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"&userno="+userno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _nowPage = (nowGrp * Users.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+_nowPage+"&userno="+userno+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override
  public List<UsersVO> list_by_userno_search(HashMap<String, Object> map) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Users.RECORD_PER_PAGE;
   
    // 시작 rownum
    // 1 페이지: 0 + 1,  2 페이지: 10 + 1,  3 페이지: 20 + 1 
    int startNum = beginOfPage + 1; 
    //  종료 rownum
    // 1 페이지: 0 + 10, 2 페이지: 0 + 20,  3 페이지: 0 + 30
    int endNum = beginOfPage + Users.RECORD_PER_PAGE;   
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<UsersVO> list = this.usersDAO.list_by_userno_search(map);
    
    // --------------------------------------------------------------
    // 제목, 내용 글자수 조정
    // --------------------------------------------------------------
    String nickname = "";
    String user_name = "";
    for (UsersVO usersVO: list) {
      nickname = usersVO.getNickname();
      if (nickname.length() >= 25) {
        nickname = Tool.textLength(nickname, 25);
        usersVO.setNickname(nickname);
      }
      
      user_name = usersVO.getUser_name();
      if (user_name.length() >= 100) {
        user_name = Tool.textLength(user_name, 100);
        usersVO.setUser_name(user_name);
      }
    }
    // --------------------------------------------------------------    
    
    return list;
  }

  @Override
  public int login(Map<Object, Object> map) {
    int cnt = this.usersDAO.login(map);
    return cnt;
  }

  @Override
  public UsersVO readByid(String userID) {
    UsersVO usersVO = this.usersDAO.readByid(userID);
    return usersVO;
  }
  
  @Override
  public boolean isUsers(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    
    String userID = (String)session.getAttribute("userID");
    
    if (userID != null){
      sw = true; // 로그인 한 경우
    }
    return sw;
  }  











}

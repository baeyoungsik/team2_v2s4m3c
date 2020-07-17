package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Qualifier;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;





@Controller
public class UsersCont {
  @Autowired
  // @Qualifier("dev.mvc.users.UsersProc")
  private UsersProc usersProc = null;
  
  public UsersCont(){
    System.out.println("--> UsersCont created.");
  }
  
  /**
   * 등록 폼
   * @return
   */
  // http://localhost:9090/team2/users/create.do  
  @RequestMapping(value="/users/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/users/create");  // webapp/users/create.jsp
    return mav;
  }
  
  /**
   * 등록 처리
   * @param cateVO
   * @return
   */
 @RequestMapping(value="/users/create.do", method=RequestMethod.POST )
 public ModelAndView create(UsersVO usersVO) {
   ModelAndView mav = new ModelAndView();
   
   // System.out.println("id: " + memberVO.getId());
   
   int cnt = this.usersProc.create(usersVO);
   mav.addObject("cnt", cnt);   // request에 저장
   mav.addObject("url", "create_msg");   // create_msg.jsp redirect parameter 적용
   
   mav.setViewName("redirect:/users/msg.do"); 
   
   return mav;
 }
 
 
 /**
  * ID 중복 체크
  * @return
  */
 // http://localhost:9090/team2/users/checkID.do?userID=user1
 @ResponseBody
 @RequestMapping(value="/users/checkID.do", method=RequestMethod.GET,
                           produces = "text/plain;charset=UTF-8")
 
 public String checkID(String userID) {
   int cnt =this.usersProc.checkID(userID);
     
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
     
   return json.toString();
 }
 
 /**
  * 전체 목록
  * @return
  */

  @RequestMapping(value="/users/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<UsersVO> list = this.usersProc.list();
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    mav.setViewName("/users/list");  // webapp/users/list.jsp
    return mav;
  }
  

  /**
   * 조회 + 수정폼
   * @param  userno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/users/a_read.do", method=RequestMethod.GET )
  public ModelAndView read1(int userno) {
   // request.setAttribute("categrpno", int categrpno) 작동 안됨.
    ModelAndView mav = new ModelAndView();
    
    UsersVO usersVO = this.usersProc.read(userno);
    mav.addObject("usersVO", usersVO);   // request 객체에 저장
    
    List<UsersVO> list = this.usersProc.list();
    mav.addObject("list", list); // request 객체에 저장
    
    mav.setViewName("/users/read");  // webapp/member/read.jsp
    return mav;  // forward
  }
  
  /**
   * 조회 + 수정폼
   * @param  userno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/users/read.do", method=RequestMethod.GET )
  public ModelAndView read(int userno) {
   // request.setAttribute("categrpno", int categrpno) 작동 안됨.
    ModelAndView mav = new ModelAndView();
    
    UsersVO usersVO = this.usersProc.read(userno);
    mav.addObject("usersVO", usersVO);   // request 객체에 저장
    
    List<UsersVO> list = this.usersProc.list();
    mav.addObject("list", list); // request 객체에 저장
    
    mav.setViewName("/users/mypage");  // webapp/member/read.jsp
    return mav;  // forward
  }
  
  //http://localhost:9090/team2/users/update.do  
  /**
   * 회원정보 수정 처리
   * @param usersVO
   * @return
   */
 @RequestMapping(value="/users/update.do", method=RequestMethod.POST )
 public ModelAndView update(UsersVO usersVO) {
   //  CategrpVO", categrpVO <FORM> 태그의 값으로 자동 생성됨.
   //  request.setAttribute("CategrpVO", categrpVO);  자동실행
   
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.usersProc.update(usersVO);
   mav.addObject("cnt", cnt);   // request에 저장
   mav.addObject("userno", usersVO.getUserno());   // redirect parameter 적용
   mav.addObject("url", "update_msg");   // create_msg.jsp redirect parameter 적용
   
   mav.setViewName("redirect:/users/msg.do");
     
   return mav;
 }
 
 /**
  * 회원 삭제폼
  * @param  userno 삭제할 회원 번호
  * @return
  */
 @RequestMapping(value="/users/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int userno) {
   ModelAndView mav = new ModelAndView();
   
   UsersVO usersVO = this.usersProc.read(userno);
   mav.addObject("usersVO", usersVO);   // request 객체에 저장
          
   mav.setViewName("/users/delete");  // 
   return mav;
 }
 
 /**
  * 삭제 처리
  * @param 
  * @return
  */
 @RequestMapping(value="/users/delete.do", method=RequestMethod.POST )
 public ModelAndView delete_proc(int userno) {
   ModelAndView mav = new ModelAndView();
   
   UsersVO usersVO = this.usersProc.read(userno);
   mav.addObject("usersVO", usersVO);   // request 객체에 저장
   mav.addObject("user_name", usersVO.getUser_name());  // request 객체에 저장
   
   int cnt = this.usersProc.delete(userno); // 삭제 처리
   mav.addObject("cnt", cnt);  // request 객체에 저장
   mav.addObject("url", "delete_msg");   // create_msg.jsp redirect parameter 적용
   
   mav.setViewName("redirect:/users/msg.do");
                                        
   return mav;
 }
 
 /**
  * 패스워드를 변경합니다.
  * @param memberno
  * @return
  */
 @RequestMapping(value="/users/passwd_update.do", method=RequestMethod.GET)
 public ModelAndView passwd_update(int userno){
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/users/passwd_update");
   
   return mav;
 }
 
 /**
  * 패스워드 변경
  * @param memberno  회원 번호
  * @param current_passwd 현재 패스워드
  * @param new_passwd 새로운 패스워드
  * @return
  */
 @RequestMapping(value="/users/passwd_update.do", method=RequestMethod.POST)
 public ModelAndView passwd_update(int userno, String current_passwd, String new_passwd){
   ModelAndView mav = new ModelAndView();
   
   // 현재 패스워드 검사
   HashMap<Object, Object> map = new HashMap<Object, Object>();
   map.put("userno", userno);
   map.put("userpw", current_passwd);
   
   int cnt = usersProc.passwd_check(map);
   int update_cnt = 0; // 변경된 패스워드 수
   
   if (cnt == 1) { // 현재 패스워드가 일치하지 않는 경우
     map.put("userpw", new_passwd);
     update_cnt = usersProc.passwd_update(map);  // 패스워드 변경
     mav.addObject("update_cnt", update_cnt);    
   }
   
   mav.addObject("cnt", cnt);  
   mav.addObject("url", "passwd_update_msg");
   
   mav.setViewName("redirect:/users/msg.do");
   
   return mav;
 }
 
 /**
  * 메시지
  * @param memberno
  * @return
  */
 @RequestMapping(value="/users/msg.do", method=RequestMethod.GET)
 public ModelAndView msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // 등록 처리 메시지: create_msg -> /users/create_msg.jsp
   // 수정 처리 메시지: update_msg ->/users/update_msg.jsp
   // 삭제 처리 메시지: delete_msg ->/users/delete_msg.jsp
   mav.setViewName("/users/" + url);  
   
   return mav; // forward
 }
 
 /**
  * 목록 + 검색 + 페이징 지원  //  
  * http://localhost:9090/resort/contents/list.do
  * http://localhost:9090/resort/users/list1.do?userno=1&word=스위스&nowPage=1
  * @param cateno
  * @param word
  * @param nowPage
  * @return
  */
 @RequestMapping(value = "/users/list1.do", 
                                      method = RequestMethod.GET)
 public ModelAndView list_by_userno_search(
     @RequestParam(value="userno", defaultValue="1") int userno,
     @RequestParam(value="word", defaultValue="") String word,
     @RequestParam(value="nowPage", defaultValue="1") int nowPage
     ) { 
   System.out.println("--> nowPage: " + nowPage);
   
   ModelAndView mav = new ModelAndView();
   
   // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("userno", userno); // #{userno}
   map.put("word", word);     // #{word}
   map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
   
   // 검색 목록
   List<UsersVO> list = usersProc.list_by_userno_search(map);
   mav.addObject("list", list);
   
   // 검색된 레코드 갯수
     int search_count = usersProc.search_count(map);
     mav.addObject("search_count", search_count);
   
     UsersVO usersVO = usersProc.read(userno);
     mav.addObject("usersVO", usersVO);
     
  /*
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
    * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
    * 
    * @param listFile 목록 파일명 
    * @param cateno 카테고리번호 
    * @param search_count 검색(전체) 레코드수 
    * @param nowPage     현재 페이지
    * @param word 검색어
    * @return 페이징 생성 문자열
    * 
    * */
     
   String paging = usersProc.pagingBox("list1.do", userno, search_count, nowPage, word);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);

   // /contents/list_by_cateno_search_paging.jsp
   mav.setViewName("/users/list_by_userno_search");   
   
   return mav;
 }  
 
 
 /**
  * 로그인 폼
  * @return
  */
 // http://localhost:9090/resort/users/login.do 
 @RequestMapping(value = "/users/login.do", 
                            method = RequestMethod.GET)
 public ModelAndView login(HttpServletRequest request) {
   ModelAndView mav = new ModelAndView();
   
   Cookie[] cookies = request.getCookies();
   Cookie cookie = null;

   String ck_id = ""; // id 저장 
   String ck_id_save = ""; // id 저장 여부를 체크
   String ck_passwd = ""; // passwd 저장 
   String ck_passwd_save = ""; // passwd 저장 여부를 체크

   if (cookies != null) {
     for (int i=0; i < cookies.length; i++){
       cookie = cookies[i]; // 쿠키 객체 추출
       
       if (cookie.getName().equals("ck_id")){
         ck_id = cookie.getValue(); 
       }else if(cookie.getName().equals("ck_id_save")){
         ck_id_save = cookie.getValue();  // Y, N
       }else if (cookie.getName().equals("ck_passwd")){
         ck_passwd = cookie.getValue();         // 1234
       }else if(cookie.getName().equals("ck_passwd_save")){
         ck_passwd_save = cookie.getValue();  // Y, N
       }
     }
   }
   
   mav.addObject("ck_id", ck_id);
   mav.addObject("ck_id_save", ck_id_save);
   mav.addObject("ck_passwd", ck_passwd);
   mav.addObject("ck_passwd_save", ck_passwd_save);
   
   mav.setViewName("/users/login_ck_form");
   
   return mav;
 }
 
 /**
  * 로그인 처리
  * @param request   Cookie를 읽기위해 필요
  * @param response  Cookie를 쓰기위해 필요
  * @param session    로그인정보를 메모리에 기록
  * @param id 회원 아이디
  * @param passwd  회원 패스워드
  * @param id_save  회원 아이디 저장 여부
  * @param passwd_save 회원 패스워드 저장 여부
  * @return
  */
 // http://localhost:9090/resort/users/login.do 
 @RequestMapping(value = "/users/login.do", 
                            method = RequestMethod.POST)
 public ModelAndView login_proc(HttpServletRequest request,
                                                HttpServletResponse response,
                                                HttpSession session,
                                                String userID, String userpw,
                                                @RequestParam(value="id_save", defaultValue="") String id_save,
                                                @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
   ModelAndView mav = new ModelAndView();
   Map<Object, Object> map = new HashMap<Object, Object>();
   map.put("userID", userID);
   map.put("userpw", userpw);
   
   int count = usersProc.login(map);
   if (count == 1) { // 로그인 성공
     // System.out.println(id + " 로그인 성공");
     UsersVO usersVO = usersProc.readByid(userID);
     session.setAttribute("userno", usersVO.getUserno());
     session.setAttribute("userID", userID);
     session.setAttribute("user_name", usersVO.getUser_name());
     session.setAttribute("nickname", usersVO.getNickname());
     
     
     // -------------------------------------------------------------------
     // id 관련 쿠기 저장
     // -------------------------------------------------------------------
     if (id_save.equals("Y")) { // id를 저장할 경우
       Cookie ck_id = new Cookie("ck_id", userID);
       ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
       response.addCookie(ck_id);
     } else { // N, id를 저장하지 않는 경우
       Cookie ck_id = new Cookie("ck_id", "");
       ck_id.setMaxAge(0);
       response.addCookie(ck_id);
     }
     // id를 저장할지 선택하는  CheckBox 체크 여부
     Cookie ck_id_save = new Cookie("ck_id_save", id_save);
     ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
     response.addCookie(ck_id_save);
     // -------------------------------------------------------------------

     // -------------------------------------------------------------------
     // Password 관련 쿠기 저장
     // -------------------------------------------------------------------
     if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
       Cookie ck_passwd = new Cookie("ck_passwd", userpw);
       ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
       response.addCookie(ck_passwd);
     } else { // N, 패스워드를 저장하지 않을 경우
       Cookie ck_passwd = new Cookie("ck_passwd", "");
       ck_passwd.setMaxAge(0);
       response.addCookie(ck_passwd);
     }
     // passwd를 저장할지 선택하는  CheckBox 체크 여부
     Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
     ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
     response.addCookie(ck_passwd_save);
     // -------------------------------------------------------------------
     
     mav.setViewName("redirect:/index.do");  
   } else {
     mav.setViewName("redirect:/users/login_fail_msg.jsp");
   }
       
   return mav;
 }
 
 /**
  * 로그아웃 처리
  * @param session
  * @return
  */
 @RequestMapping(value="/users/logout.do", 
                            method=RequestMethod.GET)
 public ModelAndView logout(HttpSession session){
   ModelAndView mav = new ModelAndView();
   session.invalidate(); // 모든 session 변수 삭제
   
   mav.setViewName("redirect:/index.jsp");
   
   
//   mav.setViewName("redirect:/users/logout_msg.jsp");
   
   return mav;
 }
  
  
  
  
}

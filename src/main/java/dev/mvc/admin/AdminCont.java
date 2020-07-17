package dev.mvc.admin;

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
public class AdminCont {
  @Autowired
  private AdminProc adminProc = null;
  //@Qualifier("dev.mvc.admin.AdminProc")
  
  public AdminCont(){
    System.out.println("--> AdminCont created.");
  }
  
  /**
   * 등록 폼
   * @return
   */
  // http://localhost:9090/team2/admin/create.do  
  @RequestMapping(value="/admin/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/admin/create");  // webapp/admin/create.jsp
    return mav;
  }
  
  /**
   * 등록 처리
   * @param adminVO
   * @return
   */
 @RequestMapping(value="/admin/create.do", method=RequestMethod.POST )
 public ModelAndView create(AdminVO adminVO) {
   ModelAndView mav = new ModelAndView();
   
   // System.out.println("id: " + memberVO.getId());
   
   int cnt = this.adminProc.create(adminVO);
   mav.addObject("cnt", cnt);   // request에 저장
   mav.addObject("url", "create_msg");   // create_msg.jsp redirect parameter 적용
   
   mav.setViewName("redirect:/admin/msg.do"); 
   
   return mav;
 }
  
  /**
   * ID 중복 체크
   * @return
   */
  // http://localhost:9090/team2/admin/checkID.do?adminID=user1
  @ResponseBody
  @RequestMapping(value="/admin/checkID.do", method=RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  
    public String checkID(String adminID) {
    int cnt =this.adminProc.checkID(adminID);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
      
    return json.toString();
  }
  
  /**
   * 전체 목록
   * @return
   */

   @RequestMapping(value="/admin/list.do", method=RequestMethod.GET )
   public ModelAndView list() {
     ModelAndView mav = new ModelAndView();
     
     List<AdminVO> list = this.adminProc.list();
     mav.addObject("list", list); // request.setAttribute("list", list);
     
     mav.setViewName("/admin/list");  // webapp/users/list.jsp
     return mav;
   }
   
   /**
    * 조회 + 수정폼
    * @param  adminno 조회할 카테고리 번호
    * @return
    */
   @RequestMapping(value="/admin/read.do", method=RequestMethod.GET )
   public ModelAndView read(int adminno) {
     ModelAndView mav = new ModelAndView();
     
     AdminVO adminVO = this.adminProc.read(adminno);
     mav.addObject("adminVO", adminVO);   // request 객체에 저장
     
     List<AdminVO> list = this.adminProc.list();
     mav.addObject("list", list); // request 객체에 저장
     
     mav.setViewName("/admin/read");  // webapp/member/read.jsp
     return mav;  // forward
   }
   
   //http://localhost:9090/team2/admin/update.do  
   /**
    * 회원정보 수정 처리
    * @param usersVO
    * @return
    */
  @RequestMapping(value="/admin/update.do", method=RequestMethod.POST )
  public ModelAndView update(AdminVO adminVO) {
    //  CategrpVO", categrpVO <FORM> 태그의 값으로 자동 생성됨.
    //  request.setAttribute("CategrpVO", categrpVO);  자동실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.adminProc.update(adminVO);
    mav.addObject("cnt", cnt);   // request에 저장
    mav.addObject("adminno", adminVO.getAdminno());   // redirect parameter 적용
    mav.addObject("url", "update_msg");   // create_msg.jsp redirect parameter 적용
    
    mav.setViewName("redirect:/admin/msg.do");
      
    return mav;
  }
  
  /**
   * 회원 삭제폼
   * @param  adminno 삭제할 회원 번호
   * @return
   */
  @RequestMapping(value="/admin/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int adminno) {
    ModelAndView mav = new ModelAndView();
    
    AdminVO adminVO = this.adminProc.read(adminno);
    mav.addObject("adminVO", adminVO);   // request 객체에 저장
           
    mav.setViewName("/admin/delete");  // 
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param 
   * @return
   */
  @RequestMapping(value="/admin/delete.do", method=RequestMethod.POST )
  public ModelAndView delete_proc(int adminno) {
    ModelAndView mav = new ModelAndView();
    
    AdminVO adminVO = this.adminProc.read(adminno);
    mav.addObject("adminVO", adminVO);   // request 객체에 저장
    mav.addObject("admin_name", adminVO.getAdmin_name());  // request 객체에 저장
    
    int cnt = this.adminProc.delete(adminno); // 삭제 처리
    mav.addObject("cnt", cnt);  // request 객체에 저장
    mav.addObject("url", "delete_msg");   // create_msg.jsp redirect parameter 적용
    
    mav.setViewName("redirect:/admin/msg.do");
                                         
    return mav;
  }
  
  /**
   * 메시지
   * @param memberno
   * @return
   */
  @RequestMapping(value="/admin/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // 등록 처리 메시지: create_msg -> /users/create_msg.jsp
    // 수정 처리 메시지: update_msg ->/users/update_msg.jsp
    // 삭제 처리 메시지: delete_msg ->/users/delete_msg.jsp
    mav.setViewName("/admin/" + url);  
    
    return mav; // forward
  }
  
  /**
   * 패스워드를 변경합니다.
   * @param memberno
   * @return
   */
  @RequestMapping(value="/admin/passwd_update.do", method=RequestMethod.GET)
  public ModelAndView passwd_update(int adminno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/admin/passwd_update");
    
    return mav;
  }
  
  /**
   * 패스워드 변경
   * @param memberno  회원 번호
   * @param current_passwd 현재 패스워드
   * @param new_passwd 새로운 패스워드
   * @return
   */
  @RequestMapping(value="/admin/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(int adminno, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    // 현재 패스워드 검사
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("adminno", adminno);
    map.put("adminpw", current_passwd);
    
    int cnt = adminProc.passwd_check(map);
    int update_cnt = 0; // 변경된 패스워드 수
    
    if (cnt == 1) { // 현재 패스워드가 일치하지 않는 경우
      map.put("adminpw", new_passwd);
      update_cnt = adminProc.passwd_update(map);  // 패스워드 변경
      mav.addObject("update_cnt", update_cnt);    
    }
    
    mav.addObject("cnt", cnt);  
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/admin/msg.do");
    
    return mav;
  }
  
  /**
   * 관리자 목록
   * @return
   */
  // http://localhost:9090/ojt/admin/list.do
  @ResponseBody
  @RequestMapping(value = "/admin/list.do", 
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
  public String adminlist(String id, String passwd) {
    return adminProc.adminlist();
  }
  
//  /**
//   * 관리자 로그인 폼
//   * @return
//   */
//  // http://localhost:9090/ojt/admin/login.do 
//  @RequestMapping(value = "/admin/login.do", 
//                             method = RequestMethod.GET)
//  public ModelAndView login(HttpServletRequest request) {
//    ModelAndView mav = new ModelAndView();
//    
//    mav.setViewName("/admin/login_form");
//    return mav;
//  }
//  
//  /**
//   * 관리자 로그인 처리
//   * @return
//   */
//  // http://localhost:9090/ojt/admin/login.do 
//  @RequestMapping(value = "/admin/login.do", 
//                             method = RequestMethod.POST)
//  public ModelAndView login_proc(HttpServletRequest request,
//                                                 HttpServletResponse response,
//                                                 HttpSession session,
//                                                 String id_admin, String passwd_admin) {
//    ModelAndView mav = new ModelAndView();
//    
//    boolean sw = adminProc.login(id_admin, passwd_admin);
//    if (sw == true) { // 로그인 성공
//      session.setAttribute("id_admin", id_admin);
//      session.setAttribute("passwd_admin", passwd_admin);
//      
//      mav.setViewName("redirect:/index.do");  
//    } else {
//      mav.setViewName("redirect:/admin/login_fail_msg.jsp");
//    }
//        
//    return mav;
//  }
  
  
  /**
   * 관리자 로그인 폼
   * @return
   */
  // http://localhost:9090/ojt/admin/login.do 
  @RequestMapping(value = "/admin/login1.do", 
                             method = RequestMethod.GET)
  public ModelAndView login1(HttpServletRequest request) {
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
    
    mav.setViewName("/admin/login_ck_form");
    return mav;
  }
  
  /**
   * 관리자 로그인 처리
   * @return
   */
  // http://localhost:9090/ojt/admin/login.do 
  @RequestMapping(value = "/admin/login1.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                                 HttpServletResponse response,
                                                 HttpSession session,
                                                 String adminID, String adminpw,
                                                 @RequestParam(value="id_save", defaultValue="") String id_save,
                                                 @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    
    ModelAndView mav = new ModelAndView();
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("adminID", adminID);
    map.put("adminpw", adminpw);
    
    int count = adminProc.login1(map);
    if (count == 1) { // 로그인 성공
      // System.out.println(id + " 로그인 성공");
      AdminVO adminVO = adminProc.readByid(adminID);
      session.setAttribute("adminno", adminVO.getAdminno());
      session.setAttribute("adminID", adminID);
      session.setAttribute("admin_name", adminVO.getAdminno());
      
      // -------------------------------------------------------------------
      // id 관련 쿠기 저장
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id를 저장할 경우
        Cookie ck_id = new Cookie("ck_id", adminID);
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
        Cookie ck_passwd = new Cookie("ck_passwd", adminpw);
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
      mav.setViewName("redirect:/admin/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * 관리자 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/admin/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/admin/logout_msg.jsp");
    
    return mav;
  }
  
  
  
  

}

package dev.mvc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;





public interface AdminDAOInter {
  
  /**
   * 아이디 중복 체크
   * @param id
   * @return 0 중복아님 1 중복
   */
  public int checkID(String adminID);
  
  
  /**
   * 관리자 생성
   * <insert id="create" parameterType="AdminVO">
   * @param adminVO
   * @return 
   */
  public int create(AdminVO adminVO);
  
  /**
   * 회원 전체 목록
   * @return
   */
  public List<AdminVO> list();
  
  /**
   * 조회
   * @param adminno
   * @return
   */
  public AdminVO read(int adminno);
  
  /**
   * 수정 처리
   * @param adminVO
   * @return
   */
  public int update(AdminVO adminVO);
  
  /**
   * 레코드 1건 삭제
   * @param adminno 삭제할 회원 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int adminno);
  
  /**
   * 비밀번호 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * 비밀번호 수정
   * @param hashMap
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * 로그인 처리
   * <xmp>
   *  <select id="login" resultType="int" parameterType="Map"> 
   *  </xmp>
   * @param map
   * @return
   */
  public int login1(Map<Object, Object> map);
  
  /**
   *   <select id="readByid" resultType="AdminVO" parameterType="String">
   * @param id
   * @return
   */
  public AdminVO readByid(String adminID);  

}

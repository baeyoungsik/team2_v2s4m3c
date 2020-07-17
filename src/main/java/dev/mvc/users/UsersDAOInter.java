package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



public interface UsersDAOInter {
  
  
  /**
   * 아이디 중복 체크
   * @param id
   * @return 0 중복아님 1 중복
   */
  public int checkID(String userID);
  
  /**
   * 회원 가입
   * <insert id="create" parameterType="UsersVO">
   * @param usersVO
   * @return 등록된 회원수 1 or 0
   */
  public int create(UsersVO usersVO);
 
  /**
   * 회원 전체 목록
   * @return
   */
  public List<UsersVO> list();
  
  /**
   * 조회
   * @param userno
   * @return
   */
  public UsersVO read(int userno);
  
  /**
   * 수정 처리
   * @param usersVO
   * @return
   */
  public int update(UsersVO usersVO);
  
  /**
   * 레코드 1건 삭제
   * @param userno 삭제할 회원 번호
   * @return 삭제된 레코드 갯수
   */
  public int delete(int userno);
  
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
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
 
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_userno_search" resultType="UsersVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<UsersVO> list_by_userno_search(HashMap<String, Object> map);
  
  /**
   * 로그인 처리
   * <xmp>
   *  <select id="login" resultType="int" parameterType="Map"> 
   *  </xmp>
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);
  
  /**
   *   <select id="readByid" resultType="UsersVO" parameterType="String">
   * @param id
   * @return
   */
  public UsersVO readByid(String userID);
  
  
}



/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE users
CREATE TABLE users(
		userno                        		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		userID                        		VARCHAR2(300)		 NOT NULL,
		userpw                        		VARCHAR2(300)		 NOT NULL,
        user_name                          VARCHAR2(300)       NOT NULL,   
        nickname                           VARCHAR2(300)       NOT NULL,   
		user_identify                 		NUMBER(7)		 NOT NULL,
        user_identify2                		NUMBER(7)		 NOT NULL,
		user_tel                     		    VARCHAR2(150)			 NOT NULL,        
        user_tel2                   		    VARCHAR2(150)			 NOT NULL,
		user_tel3                    		    VARCHAR2(150)			 NOT NULL,
		user_email                    		VARCHAR2(1000)		 NOT NULL,
        user_email2                    		VARCHAR2(1000)		 NOT NULL,   -- 아직 추가안됨 
		user_zipcode                  		VARCHAR2(150)		 NULL,
		user_address1                 		VARCHAR2(1500)		 NULL,
		user_address2                 		VARCHAR2(1500)		 NULL,
		user_point                    		NUMBER(7)		 DEFAULT 0		 NULL ,
		coupon                        		VARCHAR2(250)		 NULL ,
 		word                          		VARCHAR2(300)		 NULL ,       
		user_date                     		DATE		 NOT NULL
);

COMMENT ON TABLE users is '회원';
COMMENT ON COLUMN users.userno is '회원번호';
COMMENT ON COLUMN users.userID is '회원아이디';
COMMENT ON COLUMN users.userpw is '회원 비밀번호';
COMMENT ON COLUMN users.user_name is '회원 이름';
COMMENT ON COLUMN users.user_identify is '앞주민등록번호';
COMMENT ON COLUMN users.user_identify2 is '뒷주민등록번호';
COMMENT ON COLUMN users.user_tel is '전화번호';
COMMENT ON COLUMN users.user_tel is '전화번호1';
COMMENT ON COLUMN users.user_tel is '전화번호2';
COMMENT ON COLUMN users.user_email is '이메일';
COMMENT ON COLUMN users.user_email is '이메일2';
COMMENT ON COLUMN users.user_zipcode is '우편번호';
COMMENT ON COLUMN users.user_address1 is '주소';
COMMENT ON COLUMN users.user_address2 is '상세주소';
COMMENT ON COLUMN users.user_point is '포인트';
COMMENT ON COLUMN users.coupon is '쿠폰';
COMMENT ON COLUMN users.word is '검색어';
COMMENT ON COLUMN users.user_date is '회원 가입일';

drop sequence users_seq
create SEQUENCE users_seq
  start with 1 -- 시작 번호
   increment by 1 -- 증가값
   maxvalue 9999999999  --  최대값: 9999999 -- number(7) 9999999999 -- number(10)
   cache 2  -- 2번은 메모리에서만 계산
   nocycle   -- 다시 1부터 생성되는 것을 방지



1) id 중복 확인
SELECT COUNT(userID) as cnt
FROM users
WHERE userID='user15';

2) 패스워드 체크
SELECT COUNT(userno) as cnt
FROM users
WHERE userno=1 AND userpw= 1234

select *
from users

-- 등록
INSERT INTO users(userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,user_email2, user_zipcode,
                       user_address1, user_address2, user_point, coupon, word, user_date)
VALUES (users_seq.nextval, 'user2', '1234', '이름','개발자11', 111111, 2222222, '010','1111','2222','dsa','naver', '23134','서울','종로', 0,'쿠폰','', sysdate);

INSERT INTO users(userno, userID, userpw, user_name, user_identify, user_identify2, user_tel, user_email, user_zipcode,
                       user_address1, user_address2, user_date)
VALUES (users_seq.nextval, 'user2', '1234', '개발자2', 111111, 2222222, '010-1111-2222','dsa@naver', '23134','서울','종로', sysdate);

INSERT INTO users(userno, userID, userpw, user_name, user_identify, user_identify2, user_tel, user_email, user_zipcode,
                       user_address1, user_address2, user_date)
VALUES (users_seq.nextval, 'user3', '1234', '개발자3', 111111, 2222222 , '010-1111-2222','dsa@naver', '23134','서울','종로', sysdate);



-- 목록
SELECT userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,
           user_email2, user_zipcode, user_address1, user_address2, user_point, coupon, user_date
FROM users
ORDER BY userno ASC;

-- 포인트 체크확인
update users 
set user_point = 70
where userno =1

commit

-- 1건 검색
SELECT userno, userID, userpw, user_name, user_identify, user_identify2, user_tel, user_email, user_zipcode,
           user_address1, user_address2, user_point, coupon, user_date
FROM users
WHERE userno = 1;

-- 정보 업데이트
UPDATE users
SET user_name='개발자10', nickname='왕눈이2', user_tel='123', user_tel2='456', user_tel3='789', user_email='test', user_email2='naver.com', user_zipcode='111111',  
          user_address1='종로구 ㅇㄴㅁ',  user_address2='1번지 ㅇㄴㅁ'
WHERE userno= 1;

-- 삭제
DELETE FROM users
WHERE userno = 1;


-- 
     SELECT userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,
           user_email2, user_zipcode, user_address1, user_address2, user_point, coupon, user_date, r
     FROM (
              SELECT userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,
              user_email2, user_zipcode, user_address1, user_address2, user_point, coupon, user_date, rownum as r
              FROM users
              )
              where userno= 1 AND nickname ='개발자';


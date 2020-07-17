DROP TABLE admin
CREATE TABLE admin(
		adminno                       		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		adminID                       		VARCHAR2(300)		 NOT NULL,
		adminpw                       		VARCHAR2(300)		 NOT NULL,
		admin_name                    		VARCHAR2(150)		 NOT NULL,
		admin_tel                     		VARCHAR2(150)		 NOT NULL,
		admin_tel2                    		VARCHAR2(150)		 NOT NULL,
		admin_tel3                    		VARCHAR2(150)		 NOT NULL,
		admin_email                   		VARCHAR2(300)		 NOT NULL,
		admin_email2                  		VARCHAR2(300)		 NOT NULL,
		admin_role                    		VARCHAR2(300)		 NOT NULL,
		admin_power                   		VARCHAR2(300)		 NOT NULL,
		admin_date                    		DATE		 NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자번호';
COMMENT ON COLUMN admin.adminID is '관리자아이디';
COMMENT ON COLUMN admin.adminpw is '관리자패스워드';
COMMENT ON COLUMN admin.admin_name is '괸리자이름';
COMMENT ON COLUMN admin.admin_tel is '관리자번호';
COMMENT ON COLUMN admin.admin_tel2 is '관리자번호2';
COMMENT ON COLUMN admin.admin_tel3 is '관리자번호3';
COMMENT ON COLUMN admin.admin_email is '관리자이메일';
COMMENT ON COLUMN admin.admin_email2 is '관리자이메일2';
COMMENT ON COLUMN admin.admin_role is '관리자역할';
COMMENT ON COLUMN admin.admin_power is '관리자권한';
COMMENT ON COLUMN admin.admin_date is '관리자생성일';

drop sequence admin_seq
create SEQUENCE admin_seq
  start with 1 -- 시작 번호
   increment by 1 -- 증가값
   maxvalue 9999999999  --  최대값: 9999999 -- number(7) 9999999999 -- number(10)
   cache 2  -- 2번은 메모리에서만 계산
   nocycle   -- 다시 1부터 생성되는 것을 방지
   
   
   
INSERT INTO admin(adminno, adminID, adminpw, admin_name, admin_tel, admin_tel2, admin_tel3, admin_email, admin_email2, admin_role, admin_power, 
                           admin_date)
VALUES (admin_seq.nextval, 'admin2', '1234', '아로미', '010', '1111', '2222', 'dsa', 'naver', 'QNA' ,'2', sysdate);




SELECT * FROM admin

commit

SELECT adminno, adminID, adminpw, admin_name, admin_tel, admin_tel2, admin_tel3, admin_email, admin_email2, 
        admin_role, admin_power, admin_date
FROM admin
ORDER BY adminno ASC;

SELECT adminno, adminID, adminpw, admin_name, admin_tel, admin_tel2, admin_tel3, admin_email, admin_email2, 
        admin_role, admin_power, admin_date
FROM admin
WHERE adminno = 1

UPDATE admin 
SET admin_name='아로', admin_tel='111', admin_tel2='2222', admin_tel3='3333', admin_email='asd', admin_email2='asd', admin_role='oo담당', admin_power='1'
WHERE adminno=1

DELETE FROM admin
WHERE adminno = 2

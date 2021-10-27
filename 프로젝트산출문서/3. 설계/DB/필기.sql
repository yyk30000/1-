냉장고에 뭐 먹을거 있니?
Do you have any ingredients in the refri?


> 모델링 주소 : https://aquerytool.com/aquerymain/index/?rurl=1267e369-6be0-4c84-8c81-0566c26f1d6a
  모델링 암호 : 71rr2i
----------------------------

> DB 구축 정보 

db host : localhost 
db name : nk5_db
db user : nk5_user
db pass : 1234



USE MYSQL;

create database nk5_db;

create user nk5_user@localhost identified by '1234';

-- localhost : mysql이 설치된 컴퓨터
-- % : localhost를 제외한 모든 컴퓨터
-- 221.144.12.50 : 해당 ip

-- select, update, delete... 

grant all privileges on nk5_db.* to nk5_user@localhost;

flush privileges; -- 권한을 반영하다. 



Entity(객체) ----------------------------  TABLE 

회원 정보                                  MEMBERINFO / MEMBERS / T_MEMBER / TBL_MEMBER 

회원 아이디                                MB_ID   VARCHAR(20) ... PK
회원 비밀번호                              MB_PWD  VARCHAR(20) ... NOT NULL
회원 이름                                  MB_NAME VARCHAR(20) ... NOT NULL 

제약 조건 : PK / FK / UNIQUE / CHECK / NULL ... 

데이터 타입 + 길이 + 제약조건 ? 도메인(DOMAIN)



SELECT * FROM MEMBERINFO;
SELECT * FROM MEMBERS;
SELECT * FROM T_MEMBER;
SELECT * FROM TBL_MEMBER;

> MySQL int unsigned ? 

int 32bit(4byte) = 2x2x2x2x2x2x2...x2x2x2x2 = [-2147483648~-1,0~2147483647]

int unsigned : 0~2147483647 + 2147483648


1234.5  decimal(5,1)

> mysqld.exe <--mysql 서버  d : daemon 
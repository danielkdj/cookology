drop user c##cookology cascade;
create user c##cookology identified by cookology;
grant resource, connect, dba to c##cookology;

--------------------------------------------

drop table USERS cascade constraints;
CREATE TABLE USERS
(
user_email         VARCHAR(1000)  NOT NULL
  , user_password      VARCHAR(1000)  NOT NULL
  , user_name          VARCHAR(100)   NOT NULL
  , user_phone         VARCHAR(11)    NOT NULL
  , user_post_code     NUMBER(5)      NOT NULL
  , user_address1      VARCHAR(1000)  NOT NULL
  , user_address2      VARCHAR(1000)  NOT NULL
  , user_allergy       VARCHAR2(100) NOT NULL
  , create_at  DATE DEFAULT sysdate NOT NULL
  , modified_at  DATE DEFAULT sysdate NOT NULL
  , login_ok CHAR(1) DEFAULT 'Y' NOT NULL
  , is_admin CHAR(1) DEFAULT 'N' NOT NULL
  , CONSTRAINT PK_USERS PRIMARY KEY (user_email)
);

COMMENT ON COLUMN USERS.user_email IS 'user 이메일(ID)';
COMMENT ON COLUMN USERS.user_password IS 'user 비밀번호';
COMMENT ON COLUMN USERS.user_name IS 'user 이름';
COMMENT ON COLUMN USERS.user_phone IS 'user 전화번호';
COMMENT ON COLUMN USERS.user_post_code IS 'user 우편번호';
COMMENT ON COLUMN USERS.user_address1 IS 'user 기본주소';
COMMENT ON COLUMN USERS.user_address2 IS 'user 상세주소';
COMMENT ON COLUMN USERS.user_allergy IS 'user 알러지정보';
COMMENT ON COLUMN USERS.create_at IS '가입일시';
COMMENT ON COLUMN USERS.modified_at IS '수정일시';
COMMENT ON COLUMN USERS.login_ok IS '계정활성화여부';
COMMENT ON COLUMN USERS.is_admin IS '관리자 여부';

--------------------------------------------------------------------------------
drop table PRODUCT cascade constraints;
CREATE TABLE PRODUCT
(
  product_seq_id   NUMBER         NOT NULL
  , business_number  VARCHAR(100)   NOT NULL
  , thumb_url        VARCHAR2(1000)
  , product_name     VARCHAR2(100)  NOT NULL
  , product_price      NUMBER    DEFAULT 0
  , stock            NUMBER
  , claims_num       NUMBER         NOT NULL
  , create_at        DATE      NOT NULL
  , modified_at      DATE      NOT NULL
  , admin_inspection CHAR(1)        DEFAULT 'N'
  , tag              VARCHAR2(1000)
  , ORIGINAL_FILEPATH      VARCHAR2(100 BYTE)
  , RENAME_FILEPATH      VARCHAR2(100 BYTE)
  , CONTENT     VARCHAR2(1000 BYTE)
  , CONSTRAINT PK_PRODUCT PRIMARY KEY (product_seq_id)

);

CREATE SEQUENCE SEQ_PRODUCT
  START WITH 1
  INCREMENT BY 1;


COMMENT ON COLUMN PRODUCT.product_seq_id IS '상품고유번호';
COMMENT ON COLUMN PRODUCT.business_number IS '사업자등록번호';
COMMENT ON COLUMN PRODUCT.thumb_url IS '상품 이미지 url';
COMMENT ON COLUMN PRODUCT.product_name IS '상품명';
COMMENT ON COLUMN PRODUCT.product_price IS '상품 가격';
COMMENT ON COLUMN PRODUCT.stock IS '상품 재고량';
COMMENT ON COLUMN PRODUCT.claims_num IS '클레임 횟수(경고)';
COMMENT ON COLUMN PRODUCT.create_at IS '상품 생성일시';
COMMENT ON COLUMN PRODUCT.modified_at IS '상품 수정일시';
COMMENT ON COLUMN PRODUCT.admin_inspection IS '관리자 검수여부';
COMMENT ON COLUMN PRODUCT.tag IS '상품 검색태그명';
COMMENT ON COLUMN PRODUCT.ORIGINAL_FILEPATH  IS '원본파일';
COMMENT ON COLUMN PRODUCT.RENAME_FILEPATH IS '새원본파일';
COMMENT ON COLUMN PRODUCT.CONTENT IS '상품내용';



--------------------------------------------------------------------------------
drop table PRODUCT_DESCRIPTION cascade constraints;
CREATE TABLE PRODUCT_DESCRIPTION
(
  product_seq_id    NUMBER  NOT NULL
  , PRODUCT_DESCRIPTION_NO     NUMBER      NOT NULL
  , original_img      VARCHAR2(200 BYTE)
  , rename_img      VARCHAR2(200 BYTE)
  , description      VARCHAR2(500 BYTE)
);

COMMENT ON COLUMN PRODUCT_DESCRIPTION.product_seq_id IS '주문내역 고유번호';
COMMENT ON COLUMN PRODUCT_DESCRIPTION.PRODUCT_DESCRIPTION_NO IS '상품이미지설명 순번';
COMMENT ON COLUMN PRODUCT_DESCRIPTION.original_img IS '조리원본이미지';
COMMENT ON COLUMN PRODUCT_DESCRIPTION.rename_img IS '조리 새 이미지';
COMMENT ON COLUMN PRODUCT_DESCRIPTION.description IS '조리 설명글';



--------------------------------------------------------------------------------

drop table PRODUCT_ALLERGY cascade constraints;
CREATE TABLE PRODUCT_ALLERGY
(
  product_seq_id NUMBER NOT NULL
  , allergy_id     NUMBER NOT NULL
);

COMMENT ON COLUMN PRODUCT_ALLERGY.product_seq_id IS '상품 고유번호';
COMMENT ON COLUMN PRODUCT_ALLERGY.allergy_id IS '알러지 고유번호';


--------------------------------------------------------------------------------
drop table merchant cascade constraints;
CREATE TABLE MERCHANT
(
  business_number    VARCHAR(100)  NOT NULL
  , merchant_password    VARCHAR(100)  NOT NULL
  , merchant_name        VARCHAR(100)  NOT NULL
  , merchant_phone1      VARCHAR(100)  NOT NULL
  , merchant_phone2      VARCHAR(100)  NOT NULL
  , merchant_email       VARCHAR(200)  NOT NULL
  , merchant_address1    VARCHAR(1000) NOT NULL
  , merchant_address2    VARCHAR(1000) NOT NULL
  , merchant_post_code   VARCHAR(20)   NOT NULL
  , clame_num          NUMBER        NOT NULL
  , account_activation CHAR(1)       DEFAULT 'Y' NOT NULL
  , merchant_profile_url NCLOB
  , amount_day  NUMBER default 0
  , amount_month NUMBER default 0
  , CONSTRAINT PK_MERCHANT PRIMARY KEY (business_number)
);

COMMENT ON COLUMN MERCHANT.business_number IS '사업자등록번호(ID) ';

		COMMENT ON COLUMN MERCHANT.MERCHANT_password IS 'MERCHANT 비밀번호';

		COMMENT ON COLUMN MERCHANT.MERCHANT_name IS 'MERCHANT 상호명';

		COMMENT ON COLUMN MERCHANT.MERCHANT_phone1 IS '사업장 전화번호';

		COMMENT ON COLUMN MERCHANT.MERCHANT_phone2 IS 'MERCHANT 본인 전화번호';

		COMMENT ON COLUMN MERCHANT.MERCHANT_email IS 'MERCHANT 이메일';

		COMMENT ON COLUMN MERCHANT.MERCHANT_address1 IS '사업장 기본주소';

		COMMENT ON COLUMN MERCHANT.MERCHANT_address2 IS '사업장 상세주소';

		COMMENT ON COLUMN MERCHANT.MERCHANT_post_code IS '사업장 우편번호';

		COMMENT ON COLUMN MERCHANT.clame_num IS '클레임 받은 횟수';

		COMMENT ON COLUMN MERCHANT.account_activation IS '계정활성화 여부';

		COMMENT ON COLUMN MERCHANT.MERCHANT_profile_url IS 'MERCHANT 프로필 사진';

--------------------------------------------------------------------------------

DROP TABLE cart CASCADE CONSTRAINTS;
CREATE TABLE cart (
cart_seq_id NUMBER NOT NULL
, user_email VARCHAR(1000) NOT NULL
, product_seq_id NUMBER NOT NULL
, amount NUMBER default 0
, price NUMBER
, CONSTRAINT PK_CART PRIMARY KEY (cart_seq_id)
, CONSTRAINT FK_CART_USER_EMAIL FOREIGN KEY (user_email) REFERENCES Users (user_email)
, CONSTRAINT FK_CART_PRODUCT_SEQ_ID FOREIGN KEY (product_seq_id) REFERENCES Product (product_seq_id)
);

create sequence cart_seq_id
  start with 1
  increment by 1;

COMMENT ON COLUMN cart.cart_seq_id IS '장바구니 고유번호';
COMMENT ON COLUMN cart.user_email IS '유저 이메일';
COMMENT ON COLUMN cart.product_seq_id IS '상품 고유번호';
COMMENT ON COLUMN cart.amount IS '상품 수량';
COMMENT ON COLUMN cart.price IS '총 가격';
--------------------------------------------------------------------------------
drop table orders cascade constraints;
CREATE TABLE ORDERS
(
  orders_seq_id NUMBER NOT NULL
, cart_seq_id NUMBER NOT NULL
, product_seq_id NUMBER NOT NULL
, user_email VARCHAR(1000) NOT NULL
, amount NUMBER default 0
, price number default 0
, orders_success  CHAR(1) DEFAULT 'N'
, orders_at  Date default SYSDATE
, CONSTRAINT PK_ORDERS PRIMARY KEY (orders_seq_id)
);

CREATE SEQUENCE SEQ_ORDERS
  START WITH 1
  INCREMENT BY 1;

/


COMMENT ON COLUMN ORDERS.orders_seq_id IS '주문내역 고유번호';
COMMENT ON COLUMN ORDERS.cart_seq_id IS '장바구니 고유번호';
COMMENT ON COLUMN ORDERS.product_seq_id IS '상품 고유번호';
COMMENT ON COLUMN ORDERS.user_email IS 'user 이메일';
COMMENT ON COLUMN ORDERS.amount IS '상품 수량';
COMMENT ON COLUMN ORDERS.Price IS '총 가격';
COMMENT ON COLUMN ORDERS.orders_success IS '주문 성공여부';
COMMENT ON COLUMN ORDERS.orders_at IS '주문시간';




/


----------------------------- --------------------------------------------------

drop table notice cascade constraints;
create table NOTICE
(
  NOTICENO NUMBER not null constraint PK_NOTICENO primary key
  , NOTICETITLE       VARCHAR2(50) not null
  , NOTICEDATE        DATE default SYSDATE
  , NOTICEWRITER      VARCHAR2(50) not null
  , NOTICECONTENT     VARCHAR2(2000)
  , ORIGINAL_FILEPATH VARCHAR2(100)
  , RENAME_FILEPATH   VARCHAR2(100)
);

comment on column NOTICE.NOTICENO is '공지글번호';
comment on column NOTICE.NOTICETITLE is '공지글제목';
comment on column NOTICE.NOTICEDATE is '공지등록날짜';
comment on column NOTICE.NOTICEWRITER is '공지작성자';
comment on column NOTICE.NOTICECONTENT is '공지내용';
comment on column NOTICE.ORIGINAL_FILEPATH is '원본첨부파일명';
comment on column NOTICE.RENAME_FILEPATH is '바뀐첨부파일명';
-------------------------------------------------------------------------------

drop table FAQ cascade constraints;
create table FAQ
(
  FAQ_SEQ_ID      NUMBER not null
    constraint PK_FAQ
      primary key,
  FREQUENTLYASKED VARCHAR2(400),
  QUESTIONS       VARCHAR2(400)
);

--------------------------------------------------------------------------------
drop table QNA cascade constraints;
create table QNA
(
  QNA_SEQ_ID  NUMBER not null constraint PK_QNA primary key
  ,USER_EMAIL  VARCHAR2(255)    not null
  , Q_TITLE     VARCHAR2(255)    not null
  , Q_CONTENT   VARCHAR2(255)    not null
  , Q_CREATE_AT TIMESTAMP(6)     not null
  , A_CONTENT   VARCHAR2(255)
  , A_CREATE_AT TIMESTAMP(6)
  , ISSOLVED    CHAR default 'N' not null
);


comment on column QNA.QNA_SEQ_ID is 'QNA serial number';
comment on column QNA.USER_EMAIL is 'user email';
comment on column QNA.Q_TITLE is 'Question title';
comment on column QNA.Q_CONTENT is 'Question content';
comment on column QNA.Q_CREATE_AT is 'Question creation time';
comment on column QNA.A_CONTENT is 'Answer A';
comment on column QNA.A_CREATE_AT is 'Answer A creation time';
comment on column QNA.ISSOLVED is 'Is the answer complete?';

--------------------------------------------------------------------------------

drop table ALLERGY cascade constraints;
CREATE TABLE ALLERGY
(
  allergy_id   NUMBER       NOT NULL
  , allergy_name VARCHAR(255) NOT NULL
  , CONSTRAINT PK_ALLERGY PRIMARY KEY (allergy_id)
);

COMMENT ON COLUMN ALLERGY.allergy_id IS '알러지 고유번호';
COMMENT ON COLUMN ALLERGY.allergy_name IS '알러지명';

INSERT INTO ALLERGY VALUES(10, '알류');
INSERT INTO ALLERGY VALUES(20, '유제품');
INSERT INTO ALLERGY VALUES(30, '땅콩');
INSERT INTO ALLERGY VALUES(40, '견과류');
INSERT INTO ALLERGY VALUES(50, '밀');
INSERT INTO ALLERGY VALUES(60, '참깨');
INSERT INTO ALLERGY VALUES(70, '콩(대두)');
INSERT INTO ALLERGY VALUES(80, '과일 및 채소');
INSERT INTO ALLERGY VALUES(90, '해산물 및 조개류');
INSERT INTO ALLERGY VALUES(100, '육류');

--------------------------------------------------------------------------------
drop table MERCHANT cascade constraints;
CREATE TABLE MERCHANT
(
  business_number    VARCHAR(100)  NOT NULL
  , merchant_password    VARCHAR(100)  NOT NULL
  , merchant_name        VARCHAR(100)  NOT NULL
  , merchant_phone1      VARCHAR(100)  NOT NULL
  , merchant_phone2      VARCHAR(100)  NOT NULL
  , merchant_email       VARCHAR(200)  NOT NULL
  , merchant_address1    VARCHAR(1000) NOT NULL
  , merchant_address2    VARCHAR(1000) NOT NULL
  , merchant_post_code   VARCHAR(20)   NOT NULL
  , clame_num          NUMBER        NOT NULL
  , account_activation CHAR(1)       DEFAULT 'Y' NOT NULL
  , merchant_profile_url NCLOB
  , amount_day  NUMBER default 0
  , amount_month NUMBER default 0
  , CONSTRAINT PK_MERCHANT PRIMARY KEY (business_number)
);

COMMENT ON COLUMN MERCHANT.business_number IS '사업자등록번호(ID) ';
COMMENT ON COLUMN MERCHANT.MERCHANT_password IS 'MERCHANT 비밀번호';
COMMENT ON COLUMN MERCHANT.MERCHANT_name IS 'MERCHANT 상호명';
COMMENT ON COLUMN MERCHANT.MERCHANT_phone1 IS '사업장 전화번호';
COMMENT ON COLUMN MERCHANT.MERCHANT_phone2 IS 'MERCHANT 본인 전화번호';
COMMENT ON COLUMN MERCHANT.MERCHANT_email IS 'MERCHANT 이메일';
COMMENT ON COLUMN MERCHANT.MERCHANT_address1 IS '사업장 기본주소';
COMMENT ON COLUMN MERCHANT.MERCHANT_address2 IS '사업장 상세주소';
COMMENT ON COLUMN MERCHANT.MERCHANT_post_code IS '사업장 우편번호';
COMMENT ON COLUMN MERCHANT.clame_num IS '클레임 받은 횟수';
COMMENT ON COLUMN MERCHANT.account_activation IS '계정활성화 여부';
COMMENT ON COLUMN MERCHANT.MERCHANT_profile_url IS 'MERCHANT 프로필 사진';

/


--------------------------------------------------------------------------------

drop table FAQ cascade constraints;
CREATE TABLE FAQ
(
  faq_seq_id      NUMBER        NOT NULL
  , frequentlyAsked VARCHAR2(1000)
  , auestions       VARCHAR2(1000)
  , CONSTRAINT PK_FAQ PRIMARY KEY (faq_seq_id)
);

COMMENT ON COLUMN FAQ.faq_seq_id IS 'FAQ 고유번호';
COMMENT ON COLUMN FAQ.frequentlyAsked IS '자주 묻는 질문';
COMMENT ON COLUMN FAQ.auestions IS 'FAQ 답변';

--------------------------------------------------------------------------------

drop table QNA cascade constraints;
CREATE TABLE QNA
(
  qna_seq_id  NUMBER        NOT NULL
  , user_email  VARCHAR(1000) NOT NULL
  , q_title     NCLOB         NOT NULL
  , q_content   NCLOB         NOT NULL
  , q_create_at TIMESTAMP     NOT NULL
  , a_content   NCLOB
  , a_create_at TIMESTAMP
  , issolved    CHAR(1)      DEFAULT 'N' NOT NULL
  , CONSTRAINT PK_QNA PRIMARY KEY (qna_seq_id)
);

COMMENT ON COLUMN QNA.qna_seq_id IS 'QNA 고유번호';
COMMENT ON COLUMN QNA.user_email IS 'user 이메일(ID)';
COMMENT ON COLUMN QNA.q_title IS 'Q질문 제목';
COMMENT ON COLUMN QNA.q_content IS 'Q질문 내용';
COMMENT ON COLUMN QNA.q_create_at IS 'Q질문 작성시간';
COMMENT ON COLUMN QNA.a_content IS 'A답변 내용';
COMMENT ON COLUMN QNA.a_create_at IS 'A답변 작성시간';
COMMENT ON COLUMN QNA.issolved IS '답변 완료여부';

--------------------------------------------------------------------------------

drop table RECIPE cascade constraints;
create table RECIPE
(
  RECIPE_SEQ_ID      NUMBER not null constraint PK_RECIPE primary key
  , CATEGORY_ID        NUMBER
  , THUMB_URL          VARCHAR2(1000)
  , user_email    VARCHAR2(1000)
  , RECIPE_TITLE       VARCHAR2(255)
  , RECIPE_DESCRIPTION VARCHAR2(255)
  , RECIPE_CONTENT     CLOB
  , RECIPE_INGREDIENT  CLOB
  , VIEWS              NUMBER
  , RECIPE_TIME        VARCHAR2(50)
  , RECIPE_LEVEL       VARCHAR2(50)
  , SERVING_DISH       VARCHAR2(50)
  , ADMIN_INSPECTION   CHAR
  , CREATED_AT         TIMESTAMP(6)
  , MODIFIED_AT        TIMESTAMP(6)
);
/
CREATE SEQUENCE RECIPE_SEQ_ID
  START WITH 1
  INCREMENT BY 1;

COMMENT ON COLUMN RECIPE.recipe_seq_id IS '레시피 고유번호';
COMMENT ON COLUMN RECIPE.category_id IS '카테고리 고유번호';
COMMENT ON COLUMN RECIPE.thumb_url IS '이미지링크';
COMMENT ON COLUMN RECIPE.recipe_title IS '레시피 제목';
COMMENT ON COLUMN RECIPE.user_email IS '레시피 작성자(ID)';
COMMENT ON COLUMN RECIPE.recipe_ingredient IS '레시피 재료';
COMMENT ON COLUMN RECIPE.recipe_time IS '조리시간';
COMMENT ON COLUMN RECIPE.recipe_level IS '조리난이도';
COMMENT ON COLUMN RECIPE.created_at IS '레시피 작성일시';
COMMENT ON COLUMN RECIPE.modified_at IS '레시피 수정일시';
COMMENT ON COLUMN RECIPE.serving_dish IS '요리인분수';
COMMENT ON COLUMN RECIPE.views IS '조회수';
COMMENT ON COLUMN RECIPE.admin_inspection IS '관리자 검수여부';



--------------------------------------------------------------------------------

drop table RECIPE_ALLERGY cascade constraints;
CREATE TABLE RECIPE_ALLERGY
(
  allergy_id    NUMBER NOT NULL,
  recipe_seq_id NUMBER NOT NULL
);

COMMENT ON COLUMN RECIPE_ALLERGY.allergy_id IS '알러지 고유번호';
COMMENT ON COLUMN RECIPE_ALLERGY.recipe_seq_id IS '레시피 고유번호';

--------------------------------------------------------------------------------

drop table RECIPE_CATEGORY cascade constraints;
CREATE TABLE RECIPE_CATEGORY
(
  category_id   NUMBER       NOT NULL,
  category_name VARCHAR(100) NOT NULL,
  CONSTRAINT PK_RECIPE_CATEGORY PRIMARY KEY (category_id)
);

COMMENT ON COLUMN RECIPE_CATEGORY.category_id IS '카테고리 고유번호';
COMMENT ON COLUMN RECIPE_CATEGORY.category_name IS '카테고리명';



--------------------------------------------------------------------------------

drop table EVENTCALENDAR cascade constraints;
create table EVENTCALENDAR
(
    EVENTCALENDAR_UUID VARCHAR2(255) not null
        constraint EVENTCALEDAR_PK
        primary key,
    "start"            DATE,
    END                DATE,
    TITLE              VARCHAR2(1000),
    URL                VARCHAR2(1000),
    BACKGROUNDCOLOR    VARCHAR2(30),
    DESCRIPTION        VARCHAR2(1000),
    CONTENT            NCLOB,
    LATITUDE           VARCHAR2(100),
    LONGITUDE          VARCHAR2(100)
);

drop table ATTENDANCE cascade constraints;
create table ATTENDANCE
(
    USER_EMAIL VARCHAR2(255),
    TODAY      DATE
);

drop table VISITOR_LOGS cascade constraints;
create table VISITOR_LOGS
(
    PAGE      VARCHAR2(100),
    IPADDRESS VARCHAR2(50),
    TIME      DATE
);
--------------------------------------------------------------------------------

drop table RECPIE_COMMENT cascade constraints;
CREATE TABLE RECPIE_COMMENT
(
  recipe_comment_id NUMBER       NOT NULL,
  user_email        VARCHAR(1000) NOT NULL,
  recipe_seq_id     NUMBER       NOT NULL,
  parent_comment_id NUMBER       NOT NULL,
  comment_depth     NUMBER       NOT NULL,
  content           NCLOB       ,
  create_at         DATE    NOT NULL,
  modified_at       DATE    NOT NULL,
  admin_inspection  CHAR(1)      DEFAULT 'N' NOT NULL,
  CONSTRAINT PK_RECPIE_COMMENT PRIMARY KEY (recipe_comment_id)
);

CREATE SEQUENCE SEQ_RECPIE_COMMENT
  START WITH 1
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_RECPIE_COMMENT
BEFORE INSERT ON RECPIE_COMMENT
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
SELECT SEQ_RECPIE_COMMENT.NEXTVAL
INTO: NEW.recipe_comment_id
FROM DUAL;
END;
/

COMMENT ON COLUMN RECPIE_COMMENT.recipe_comment_id IS '댓글 고유번호';
COMMENT ON COLUMN RECPIE_COMMENT.user_email IS 'user 이메일';
COMMENT ON COLUMN RECPIE_COMMENT.recipe_seq_id IS '레시피 고유번호';
COMMENT ON COLUMN RECPIE_COMMENT.parent_comment_id IS '대댓글';
COMMENT ON COLUMN RECPIE_COMMENT.comment_depth IS '댓글 분류단계';
COMMENT ON COLUMN RECPIE_COMMENT.content IS '댓글 내용';
COMMENT ON COLUMN RECPIE_COMMENT.create_at IS '댓글 작성일시';
COMMENT ON COLUMN RECPIE_COMMENT.modified_at IS '댓글 수정일시';
COMMENT ON COLUMN RECPIE_COMMENT.admin_inspection IS '관리자 검수여부';

--------------------------------------------------------------------------------

ALTER TABLE RECPIE_COMMENT
  ADD CONSTRAINT FK_USERS_TO_RECPIE_COMMENT
    FOREIGN KEY (user_email)
      REFERENCES USERS (user_email);

ALTER TABLE RECPIE_COMMENT
  ADD CONSTRAINT FK_RECPIE_COMMENT_TO_RECPIE_COMMENT
    FOREIGN KEY (parent_comment_id)
      REFERENCES RECPIE_COMMENT (recipe_comment_id);

ALTER TABLE RECIPE_ALLERGY
  ADD CONSTRAINT FK_ALLERGY_TO_RECIPE_ALLERGY
    FOREIGN KEY (allergy_id)
      REFERENCES ALLERGY (allergy_id);

ALTER TABLE RECIPE
  ADD CONSTRAINT FK_RECIPE_CATEGORY_TO_RECIPE
    FOREIGN KEY (category_id)
      REFERENCES RECIPE_CATEGORY (category_id);

ALTER TABLE RECIPE_ALLERGY
  ADD CONSTRAINT FK_RECIPE_TO_RECIPE_ALLERGY
    FOREIGN KEY (recipe_seq_id)
      REFERENCES RECIPE (recipe_seq_id);

ALTER TABLE RECPIE_COMMENT
  ADD CONSTRAINT FK_RECIPE_TO_RECPIE_COMMENT
    FOREIGN KEY (recipe_seq_id)
      REFERENCES RECIPE (recipe_seq_id);

ALTER TABLE PRODUCT_ALLERGY
  ADD CONSTRAINT FK_ALLERGY_TO_PRODUCT_ALLERGY
    FOREIGN KEY (allergy_id)
      REFERENCES ALLERGY (allergy_id);

ALTER TABLE QNA
  ADD CONSTRAINT FK_USERS_TO_QNA
    FOREIGN KEY (user_email)
      REFERENCES USERS (user_email);

ALTER TABLE PRODUCT_DESCRIPTION
  ADD CONSTRAINT FK_PRODUCT_TO_PRODUCT_DESCRIPTION
    FOREIGN KEY (product_seq_id)
      REFERENCES PRODUCT (product_seq_id);

ALTER TABLE PRODUCT
  ADD CONSTRAINT FK_Merchant_TO_PRODUCT
    FOREIGN KEY (business_number)
      REFERENCES Merchant (business_number);

ALTER TABLE PRODUCT_ALLERGY
  ADD CONSTRAINT FK_PRODUCT_TO_PRODUCT_ALLERGY
    FOREIGN KEY (product_seq_id)
      REFERENCES PRODUCT (product_seq_id);

alter table cart
  add constraint fk_users_to_cart
    foreign key(user_email)
      references users (user_email);

ALTER TABLE cart
  ADD CONSTRAINT FK_PRODUCT_TO_cart
    FOREIGN KEY (product_seq_id)
      REFERENCES PRODUCT (product_seq_id);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_CART_TO_ORDERS
    FOREIGN KEY (cart_seq_id)
      REFERENCES cart (cart_seq_id);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_PRODUCT_TO_ORDERS
    FOREIGN KEY (product_seq_id)
      REFERENCES PRODUCT (product_seq_id);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_USERS_TO_ORDERS
    FOREIGN KEY (user_email)
      REFERENCES USERS (user_email);

ALTER TABLE PRODUCT_DESCRIPTION
  ADD CONSTRAINT FK_PRODUCT_TO_PRODUCT_DESCRIPTION
    FOREIGN KEY (product_seq_id)
      REFERENCES PRODUCT (product_seq_id)
      on delete cascade;
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('b5b7de3f-d583-4d6f-ba73-411ae781eaa0', DATE '2023-09-01', DATE '2023-09-01', '구미 독서문화 축제', null, '#fc6c98f', '전시+특강+체험+공연', '전시+특강+체험+공연', '36.1137978', '128.3352215');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('4e740c68-10fa-49fd-beb6-2e9b73f5dc0d', DATE '2023-09-01', DATE '2023-09-01', '구미한가위 전통연희축제', null, '#fc6c99f', '공연+체험', '공연+체험', '36.11125615', '128.3139126');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('01046ab0-742a-478d-83bd-91c849ebfcdd', DATE '2023-09-01', DATE '2023-10-31', '제5회 인제가을꽃축제', 'https://www.inje.go.kr', '#fc6c100f', '가을꽃축제', '가을꽃축제', '37.99772638', '128.098499');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('5f8b2da2-8ee3-4fbc-9272-827feb34bcc1', DATE '2023-09-01', DATE '2023-09-01', '홍원항 자연산 전어.꽃게 축제', 'http://tour.seocheon.go.kr', '#fc6c101f', '맨손으로 전어 잡기 체험+추억의 놀이 체험+숨겨진 보물을 찾아라+비눗방울 놀이 등', '맨손으로 전어 잡기 체험+추억의 놀이 체험+숨겨진 보물을 찾아라+비눗방울 놀이 등', '36.1588618', '126.4992204');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('87eccbcf-5f58-4e93-9d0a-86840c6306eb', DATE '2023-09-01', DATE '2023-09-01', '광양전어축제', 'http://www.gwangyang.go.kr/tour_culture', '#fc6c103f', '공연+경연+체험+전시+판매+부대행사', '공연+경연+체험+전시+판매+부대행사', '34.97164706', '127.7587907');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('5a40370d-7675-410c-8b45-be4bef042522', DATE '2023-09-07', DATE '2022-09-10', '제36회 지용제', null, '#fc6c104f', '지용문학상 시상식+시노래콘서트+향수콘서트+지용백일장 등', '지용문학상 시상식+시노래콘서트+향수콘서트+지용백일장 등', '36.31880041', '127.5827071');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('c2f385f2-148b-4ec0-9665-a84aa0fe4550', DATE '2023-09-14', DATE '2023-09-17', '원주삼토페스티벌', null, '#fc6c105f', '농촌문화체험+지역먹거리 판매 등', '농촌문화체험+지역먹거리 판매 등', '37.3368381', '127.943687');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('5c37b2cc-27e4-4edd-a676-b03a94a0d2d3', DATE '2023-09-16', DATE '2023-09-16', '팔공산 왕건축제', null, '#fc6c106f', '왕건관련 체험프로그램, 동화천 걷기대회행사, 무대행사 등', '왕건관련 체험프로그램, 동화천 걷기대회행사, 무대행사 등', '35.94266974', '128.6426741');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('8618ac4b-7130-4ffe-9c40-2466ea653718', DATE '2023-09-16', DATE '2023-09-16', '치악산왕발걸음축제', null, '#fc6c107f', '걷기행사+작은음악회 등', '걷기행사+작은음악회 등', '37.4186377', '128.0031734');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('0d3ed4a9-52d8-4ee7-b873-f2d9c7a5cbf8', DATE '2023-09-16', DATE '2023-09-17', '제4회 양평부추축제', null, '#fc6c108f', '양동면의 특산품인 부추로 다양한 음식과 더불어 을미의병 발상지로서 의병출정식 등 행사', '양동면의 특산품인 부추로 다양한 음식과 더불어 을미의병 발상지로서 의병출정식 등 행사', '37.42030404', '127.7544833');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('426e8f41-e88e-468f-b908-088a2fe3b0c8', DATE '2023-09-16', DATE '2023-09-17', '여수여자만갯벌노을체험행사', null, '#fc6c109f', '대나무망둥어낚시+개매기+바지락캐기+맨손고기잡이+가족사랑걷기체험+노을가요제', '대나무망둥어낚시+개매기+바지락캐기+맨손고기잡이+가족사랑걷기체험+노을가요제', '34.7902433', '127.5679754');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('45d862c6-fcac-4481-ba58-938442e865d9', DATE '2023-09-21', DATE '2023-09-24', '봉화송이축제', 'https://bhftf.co.kr:8091/', '#fc6c110f', '송이채취+시식회 등', '송이채취+시식회 등', '36.89039738', '128.7379707');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('e8988c3a-5d36-420b-ab52-edea78014158', DATE '2023-04-01', DATE '2023-04-01', '용인어린이상상의숲 특별 행사 <상상해봄>(가칭)', 'www.yicf.or.kr', '#fc6c11f', '새학기와 봄을 맞이하여 상상의 숲이 준비한 어린이들과 가족 대상의 특별 행사', '새학기와 봄을 맞이하여 상상의 숲이 준비한 어린이들과 가족 대상의 특별 행사', '37.24962344', '127.1651613');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('9beb66c2-eb58-4085-8876-a00d63766eb1', DATE '2023-04-01', DATE '2023-04-01', '구미 청춘 금오천 2.4km', null, '#fc6c12f', '공연+체험+마켓', '공연+체험+마켓', '36.12217559', '128.3224418');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('08a50321-618b-47e3-8a8a-a6c14a26d3cb', DATE '2023-04-01', DATE '2023-07-01', '2023 생생문화재', null, '#fc6c13f', '허백련춘설헌, 광주읍성유허 등', '허백련춘설헌, 광주읍성유허 등', '35.1461414', '126.9230951');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('46073d52-a90b-4d52-9885-782582d12621', DATE '2023-04-01', DATE '2023-12-31', '청년거리문화축제', null, '#fc6c14f', '거리공연+프리마켓 등', '거리공연+프리마켓 등', '34.76014841', '127.661568');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('c1686332-95d6-4256-ac0f-812888d85d37', DATE '2023-04-01', DATE '2023-04-02', '제20회 양평 산수유 한우 축제', null, '#fc6c15f', '노랑 산수유 꽃이 필 4월 주읍리 등 마을길을 걷고 개군한우를 먹으며 즐길수 있는 축제', '노랑 산수유 꽃이 필 4월 주읍리 등 마을길을 걷고 개군한우를 먹으며 즐길수 있는 축제', '37.43277374', '127.5313533');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('13c4e584-ec7c-4763-b5ed-dc494680e8b2', DATE '2023-04-01', DATE '2023-04-02', '여수영취산진달래체험행사', 'http://yeosujindalrae.co.kr/', '#fc6c16f', '산신제+진달래백일장+사생대회+체험행사', '산신제+진달래백일장+사생대회+체험행사', '34.82281621', '127.7016059');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('99211be2-e40f-4071-a583-f1c7c575d1fa', DATE '2023-04-01', DATE '2023-04-01', '백운산국사봉철쭉제', 'http://www.gwangyang.go.kr/tour_culture', '#fc6c17f', '공연+경연+체험+전시+판매+부대행사', '공연+경연+체험+전시+판매+부대행사', '34.98936299', '127.7001825');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('e05071fc-4d1d-4aac-aa4f-75a43badc7f3', DATE '2023-04-02', DATE '2023-04-02', '합천벚꽃마라톤대회', 'https://www.hc.go.kr/06573/06623/06624.web', '#fc6c18f', '벚꽃길에서 펼쳐지는 달리미들의 대향연', '벚꽃길에서 펼쳐지는 달리미들의 대향연', '35.531585', '128.0295197');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('dfe5cfa0-f35c-4b73-9632-702c5ff1763b', DATE '2023-04-07', DATE '2023-04-16', '삼척맹방유채꽃행사', 'http://tour.samcheok.go.kr/03joy/02_03.jsp', '#fc6c19f', '농축특산물 판매장 및 향토 먹거리장터 운영+유채꽃 사진전+유채꽃따라 걷기대회 등(코로나-19 확산방지로 행사취소)', '농축특산물 판매장 및 향토 먹거리장터 운영+유채꽃 사진전+유채꽃따라 걷기대회 등(코로나-19 확산방지로 행사취소)', '37.40072352', '129.2117828');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('a7c99f47-a4f4-4250-92b9-6029deda47e5', DATE '2023-04-07', DATE '2023-10-28', '양동통맥축제', null, '#fc6c20f', '통닭판매부스+상설공연+버스킹무대 등', '통닭판매부스+상설공연+버스킹무대 등', '35.15390267', '126.9025537');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('44f2bbae-91de-4005-97ab-cad7f2fcac89', DATE '2023-04-08', DATE '2023-04-09', '제1회남대천벚꽃축제', null, '#fc6c21f', '버스킹+플리마켓 중심의 벚꽃축제', '버스킹+플리마켓 중심의 벚꽃축제', '36.34921729', '128.6915824');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('722541eb-5296-4de4-8329-cbbeb413636c', DATE '2023-04-14', DATE '2023-04-16', '2023청도소싸움축제', 'http://www.청도소싸움.kr', '#fc6c22f', '전통소싸움대회 및 공연행사', '전통소싸움대회 및 공연행사', '35.6867346', '128.7251449');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('4698f7d8-db48-4ef0-a492-e7f09cf08786', DATE '2023-04-20', DATE '2023-04-23', '가야문화축제(예정)', 'http://www.gcfkorea.com', '#fc6c23f', '공식+민속+축제+체험+설치+부대 연계행사', '공식+민속+축제+체험+설치+부대 연계행사', '35.23606039', '128.8730826');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('21c87a1d-9df7-4c70-9683-3c7e6cebcfeb', DATE '2023-04-21', DATE '2023-04-22', '계양산국악제', null, '#fc6c24f', '국악경연대회(예선 : 온라인심사+결선 : 대면심사)+축하·기획·특별공연(온오프병행)', '국악경연대회(예선 : 온라인심사+결선 : 대면심사)+축하·기획·특별공연(온오프병행)', '37.545044', '126.728998');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('fcce7fe9-4135-4ccb-8b4d-73981822ddcd', DATE '2023-04-28', DATE '2023-05-07', '나비대축제', 'https://www.hpftf.or.kr/', '#fc6c25f', '봄을 여는 소리, 함평나비대축제(부제 : 똑똑똑 나비야 일어나 봄이야)', '봄을 여는 소리, 함평나비대축제(부제 : 똑똑똑 나비야 일어나 봄이야)', '35.05813923', '126.5226056');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('241fbd49-e105-410e-bd4f-c8d98c103e95', DATE '2023-04-28', DATE '2023-04-30', '제13회 양평 용문산 산나물축제', null, '#fc6c26f', '산나물의 맛과 향기를 느낄수 있는 신나는 공연, 즐거운 체험과 전+산나물 요리 등 다채로운 축제', '산나물의 맛과 향기를 느낄수 있는 신나는 공연, 즐거운 체험과 전+산나물 요리 등 다채로운 축제', '37.55023222', '127.5704646');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('5732d649-0a3a-4394-8519-8b0bbcbe030e', DATE '2023-04-29', DATE '2023-05-07', '문경찻사발축제', 'http://www.sabal21.com', '#fc6c28f', '전시행사 : 도예명장 특별전, 국제 교류전, 문경도자기 한상 차림전 등체험행사 : 찻사발 빚기·그리기, 찻사발원픽패스, 황금찻사발 찾기 등특별행사 : 생활자기·명품도자기 경매, 아름다운 찻자리, 사기장의 하루 등', '전시행사 : 도예명장 특별전, 국제 교류전, 문경도자기 한상 차림전 등체험행사 : 찻사발 빚기·그리기, 찻사발원픽패스, 황금찻사발 찾기 등특별행사 : 생활자기·명품도자기 경매, 아름다운 찻자리, 사기장의 하루 등', '36.77071342', '128.0739524');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('cf7440bb-bad4-46b6-bd0f-be538a9aa3f7', DATE '2023-04-29', DATE '2023-05-21', '황매산 철쭉제', 'http://www.hwangmaesan.kr', '#fc6c29f', '황매산 철쭉을 즐기는 축제', '황매산 철쭉을 즐기는 축제', '35.48184913', '128.0037495');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('e8cd56c0-d757-482b-b70e-353a72903f39', DATE '2023-04-29', DATE '2023-04-30', '제13회 옥천참옻축제', null, '#fc6c30f', '옻순판매+옻음식경연대회+공연 등', '옻순판매+옻음식경연대회+공연 등', '36.30827363', '127.5729751');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('62865af0-ef43-4973-9272-7087d536edc9', DATE '2023-05-01', DATE '2023-05-01', '자연산 광어.도미 축제', 'http://tour.seocheon.go.kr', '#fc6c31f', '맨손으로 광어잡기 체험+기념공원에서 보물찾기', '맨손으로 광어잡기 체험+기념공원에서 보물찾기', '36.1293642', '126.5036472');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('9869c343-03c4-4733-9c95-8f2de3650a99', DATE '2023-05-01', DATE '2023-05-05', '담양대나무축제', 'www.bamboofestival.co.kr', '#fc6c32f', '대나무 관련 전시+체험+공연+판매 등', '대나무 관련 전시+체험+공연+판매 등', '35.32260525', '127.0018114');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('e9c3c287-3712-47fc-8f7b-3480f243809a', DATE '2023-05-04', DATE '2023-05-07', '연천구석기축제', 'https://www.yeoncheon.go.kr/festival/', '#fc6c33f', '선사문화체험+전시+이벤트', '선사문화체험+전시+이벤트', '38.01564838', '127.0614526');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('ddfc95f1-b5b9-40a2-b39e-84d8a7bc2364', DATE '2023-05-04', DATE '2023-05-07', '연천거리문화축제', 'https://www.instagram.com/yeoncheon_festival', '#fc6c34f', '7080 레트로 거리+체험+공연', '7080 레트로 거리+체험+공연', '38.02819949', '127.0685629');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('a06417a6-6196-47b2-bcf4-ae22996ccf0e', DATE '2023-05-04', DATE '2023-05-07', '예천세계활축제', 'http://ywaf.kr/', '#fc6c36f', '국궁+양궁+세계 활+미디어 활+필드아처리+활 서바이벌', '국궁+양궁+세계 활+미디어 활+필드아처리+활 서바이벌', '36.64810235', '128.4492109');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('c9c609d9-4f7c-4337-8935-8a4a59b3f911', DATE '2023-05-05', DATE '2023-05-14', '제25회 원주한지문화제', 'www.hanjipark.com', '#fc6c40f', '기획전시+온라인체험 등', '기획전시+온라인체험 등', '37.3343755', '127.9353957');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('018b1d4c-58ed-4ef5-9a1c-79e8edbfbbb2', DATE '2023-05-05', DATE '2023-05-07', '울산옹기축제', 'https://www.onggi.or.kr', '#fc6c42f', '웰컴투옹기마을(옹기주제전시+창작공연+옹기토크+옹기테마거리등)', '웰컴투옹기마을(옹기주제전시+창작공연+옹기토크+옹기테마거리등)', '35.435069', '129.2795088');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('1427a02c-7066-4cc3-a31f-38447d5b5a50', DATE '2023-05-05', DATE '2023-05-07', '제30회 물왕예술제(산현공원)', null, '#fc6c43f', '물왕예술제(청년예술가 공연, 음악 국악공연)', '물왕예술제(청년예술가 공연, 음악 국악공연)', '37.375454', '126.8511808');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('dd2239ec-47d5-4760-a938-664c65214d45', DATE '2023-05-05', DATE '2023-05-07', '제13회 양평 용문산 산나물축제', null, '#fc6c44f', '산나물의 맛과 향기를 느낄수 있는 신나는 공연, 즐거운 체험과 전+산나물 요리 등 다채로운 축제', '산나물의 맛과 향기를 느낄수 있는 신나는 공연, 즐거운 체험과 전+산나물 요리 등 다채로운 축제', '37.48245012', '127.5945009');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('890eeba2-ebea-4d59-88e3-1fad02065913', DATE '2023-05-05', DATE '2023-05-07', '여수거북선축제', 'www.jinnamje.com', '#fc6c45f', '통제영길놀이+개막행사+각종체험공연행사', '통제영길놀이+개막행사+각종체험공연행사', '34.73922445', '127.7365808');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('7d1eda85-b89d-482d-942c-3ac39c21cacf', DATE '2023-05-05', DATE '2023-05-09', '천령문화제', null, '#fc6c46f', '고유제+축하공연+버스킹공연+학술대회+야간 빛축제+문화예술단체 전시', '고유제+축하공연+버스킹공연+학술대회+야간 빛축제+문화예술단체 전시', '35.52372642', '127.7218597');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('084807ad-b409-4e6a-a001-58002a76535e', DATE '2023-05-05', DATE '2023-05-06', '2023 대구앞산축제(제28회 대덕제)', null, '#fc6c47f', '앞산을 배경으로 다양한 체험프로그램과 문화예술 공연이 있는 주민화합 축제', '앞산을 배경으로 다양한 체험프로그램과 문화예술 공연이 있는 주민화합 축제', '35.83229037', '128.6004362');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('f9aa6bdc-d6fc-4764-aa12-e329dbc110ef', DATE '2023-05-12', DATE '2023-05-14', '울산쇠부리축제', 'www.soeburi.org', '#fc6c48f', '체험+전시+학술', '체험+전시+학술', '35.63421726', '129.3289893');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('6e214c8f-0010-4144-9583-a96ee82e1306', DATE '2023-05-12', DATE '2023-05-14', '금천하모니축제 2021', 'https://gcfac.or.kr/content?gcfac_menu_cd=U0107', '#fc6c49f', '메인공연 및 주민탈춤 퍼포먼스+안양천 빛길 조성+플리마켓 등', '메인공연 및 주민탈춤 퍼포먼스+안양천 빛길 조성+플리마켓 등', '37.45706565', '126.8960369');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('a2d956fb-9e4a-472d-b5d9-fd5076ffaa2c', DATE '2023-05-12', DATE '2023-05-14', '제21회어방축제', 'suyeong.go.kr/festival', '#fc6c50f', '광안리어방축제', '광안리어방축제', '35.14537016', '129.1123694');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('b8543957-63f2-4c4d-8cd6-f0acd5201c9e', DATE '2023-05-12', DATE '2023-05-14', '제30회 물왕예술제(비둘기공원)', null, '#fc6c51f', '물왕예술제(평면예술, 야외통합전시, 시민참여예술, 아트페스티벌)', '물왕예술제(평면예술, 야외통합전시, 시민참여예술, 아트페스티벌)', '37.44211319', '126.7943282');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('23a68fae-d913-4d14-999a-f38e640327aa', DATE '2023-05-05', DATE '2023-05-05', '용인어린이상상의숲 어린이 주간 특별 행사 <오, 오 상상이상>', 'www.yicf.or.kr', '#fc6c38f', '어린이날·용인어린이상상의숲 개관일 기념 어린이와 가족을 위한 특별 행사', '어린이날·용인어린이상상의숲 개관일 기념 어린이와 가족을 위한 특별 행사', '37.24962344', '127.1651613');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('4632fd42-8086-475a-a9ee-8be48bbc40f6', DATE '2023-05-05', DATE '2023-05-06', '홍성역사인물축제', 'https://hongju.or.kr/home/content.do?menu_cd=000023', '#fc6c39f', '역사인물관련 체험 및 공연 등', '역사인물관련 체험 및 공연 등', '36.60172104', '126.6613892');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('e1de9276-5d83-4197-b32a-31e8379459c4', DATE '2023-05-12', DATE '2023-05-12', '지구촌 예술축제', null, '#fc6c52f', '경기예총 지구촌 예술축제', '경기예총 지구촌 예술축제', '37.37141025', '126.7214786');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('923b02c9-5d84-4968-b9ac-245e5c0237d7', DATE '2023-05-12', DATE '2023-05-13', '선사문화체험축제', 'http://artko16.netto.kr/', '#fc6c53f', '선사테마축제 및 체험프로그램 운영 등', '선사테마축제 및 체험프로그램 운영 등', '35.81951349', '128.5187423');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('c2d57fda-deba-47d0-89d6-c7e6bab75c97', DATE '2023-05-13', DATE '2023-05-14', '제30회 물왕예술제(배곧생명공원)', null, '#fc6c55f', '물왕예술제(대중예술, 무용공연)', '물왕예술제(대중예술, 무용공연)', '37.37141025', '126.7214786');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('e72ff236-f769-4b88-af11-fa71cab837d5', DATE '2023-05-19', DATE '2023-05-21', '상화문학제', 'http://www.suseong.or.kr', '#fc6c58f', '백일장 공모+시낭송대회+문학강연+문학공연+상화문학답사', '백일장 공모+시낭송대회+문학강연+문학공연+상화문학답사', '35.839227', '128.618141');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('8fab85a0-e4ab-4693-8106-97e20c666caa', DATE '2023-05-19', DATE '2023-05-22', '제18회 해운대 모래축제', null, '#fc6c59f', '모래작품 전시+체험프로그램+플라워카펫 등', '모래작품 전시+체험프로그램+플라워카펫 등', '35.16313992', '129.1635303');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('524a49db-4360-43fc-941b-9ad85221151e', DATE '2023-05-19', DATE '2023-05-21', '장미꽃 필(feel)무렵', 'http://www.dscf.or.kr', '#fc6c60f', '움직이는 포토존, 장미꽃 홍보단, 장미 시화전, 체험 프로그램 운영', '움직이는 포토존, 장미꽃 홍보단, 장미 시화전, 체험 프로그램 운영', '35.85779894', '128.5147832');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('ddf46a26-e058-4d84-bf7d-da2aa210ae29', DATE '2023-05-20', DATE '2023-05-20', '<2023 피크닉 콘서트 - We Go Together Concert>', 'www.yicf.or.kr', '#fc6c61f', '용인시민 대상 주간 체험 프로그램 및 야외 공연 등', '용인시민 대상 주간 체험 프로그램 및 야외 공연 등', '37.24962344', '127.1651613');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('2dffdb31-1974-464f-811c-240a518bcff2', DATE '2023-05-20', DATE '2023-05-20', '아라뱃길 카약축제', 'http://www.seo.incheon.kr/', '#fc6c62f', '카약퍼레이드 + 부대행사', '카약퍼레이드 + 부대행사', '37.55843603', '126.6074644');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('5fd4127f-7ddc-4115-89fe-28fa216b999b', DATE '2023-05-21', DATE '2023-05-21', '황영조 국제 마라톤 대회', null, '#fc6c63f', '황영조 국제 마라톤 대회', '황영조 국제 마라톤 대회', '37.43896231', '129.160145');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('23acf5fa-e371-42d2-bfc0-38ea66e28973', DATE '2023-05-23', DATE '2023-06-11', '제16회 용수골꽃양귀비축제', null, '#fc6c64f', '꽃밭관람+포토존 이용+기념품 판매 등', '꽃밭관람+포토존 이용+기념품 판매 등', '37.3343755', '127.9353957');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('288af304-7bc0-4ac7-9fb8-b3498b7fc58d', DATE '2023-05-30', DATE '2023-06-01', '제21회 장미축제', null, '#fc6c65f', '장미가요제 등', '장미가요제 등', '37.34588179', '127.9311849');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('094a600a-527f-44aa-8da5-410bd520ed44', DATE '2023-06-03', DATE '2022-06-06', '제15회 청도유등제', 'https://www.cheongdo.go.kr/open.content/tour/festival/others/', '#fc6c66f', '유등 점등 및 무대+체험+전시 행사 등', '유등 점등 및 무대+체험+전시 행사 등', '35.65498121', '128.7372391');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('5b918748-fdcd-40f3-82b1-e75debb09d49', DATE '2023-06-09', DATE '2023-06-11', '한산모시문화제', 'www.hansanmosi.kr/', '#fc6c67f', '한산모시를 주제로 하는 다양한 프로그램 운영', '한산모시를 주제로 하는 다양한 프로그램 운영', '36.0799445', '126.7987047');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('a9ccdae0-d2f2-46fa-90cc-fa2423a8a159', DATE '2023-06-11', DATE '2023-06-11', '봉래산발복기원제', 'http://www.yeongdo.go.kr/main.web', '#fc6c68f', '개회식+기원제+길놀이+의식공연+음복례 등', '개회식+기원제+길놀이+의식공연+음복례 등', '35.08646003', '129.0590783');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('a6297ed7-f05e-4d73-8522-6ed4c409225e', DATE '2023-06-16', DATE '2023-06-17', '2023 광주문화재야행', 'http://www.gjnight.com', '#fc6c69f', '문화재를 활용한 야간문화 향유 프로그램 운영', '문화재를 활용한 야간문화 향유 프로그램 운영', '35.1461414', '126.9230951');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('b52e89f0-3a6f-4cd7-8689-f58c3347522e', DATE '2023-06-22', DATE '2023-06-24', '충주호수축제', 'www.cjlake.kr', '#fc6c70f', '뮤직페스티벌, 테마공연, 불꽃놀이 등', '뮤직페스티벌, 테마공연, 불꽃놀이 등', '36.97061868', '127.9372208');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('ed6d0c3a-04a4-4f1e-9500-94280a802b91', DATE '2023-06-29', DATE '2023-07-09', '제27회 부천국제판타스틱영화제', 'http://www.bifan.kr', '#fc6c71f', '개폐막식+영화상영+문화행사 등', '개폐막식+영화상영+문화행사 등', '37.50358247', '126.765337');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('cda3bb3b-44a0-4c79-856d-5ab830c6f85d', DATE '2023-07-01', DATE '2023-07-01', '치악산찰옥수수축제', null, '#fc6c72f', '지역 옥수수 판매 및 농특산물 직거래장터 운영 등', '지역 옥수수 판매 및 농특산물 직거래장터 운영 등', '37.3087155', '127.8115249');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('cdde5664-8a30-4654-93a9-68ccd15702c1', DATE '2023-07-01', DATE '2023-07-31', '제24회 용전들노래 정기공연', 'https://bukgu.gwangju.kr/board.es?mid=a10201110000&bid=0315', '#fc6c73f', '용전들노래재현+체험마당, 공연 등', '용전들노래재현+체험마당, 공연 등', '35.23893658', '126.8973084');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('2008f3a3-c77a-40fc-9913-a78001b3d656', DATE '2023-07-01', DATE '2023-07-01', '제18회 국제매직페스티벌', null, '#fc6c74f', '매직버스킹공연+무대공연+경연대회 등', '매직버스킹공연+무대공연+경연대회 등', '35.16313992', '129.1635303');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('4bc899f9-e86f-4158-bdb4-828eb588979d', DATE '2023-07-01', DATE '2023-07-01', '제7회 반송한마음축제', null, '#fc6c75f', '개막행사+무대공연 등', '개막행사+무대공연 등', '35.16313992', '129.1635303');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('87b30e39-7275-445c-8554-33884fe95d58', DATE '2023-07-01', DATE '2023-07-01', '춘장대해수욕장 여름문화예술축제', 'http://tour.seocheon.go.kr', '#fc6c76f', '한여름밤의 트롯이야기+춘장대 시네마+춘장대 푸파 페스티벌 등', '한여름밤의 트롯이야기+춘장대 시네마+춘장대 푸파 페스티벌 등', '36.16334922', '126.5243355');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('815b71fb-fb37-4322-a1b2-572a8ce4d50e', DATE '2023-07-07', DATE '2023-07-09', '금산삼계탕축제', 'http://www.insamfestival.co.kr/', '#fc6c77f', 'ㅇ삼계탕 사연 공모+먹방 콘테스트+라이브 커머스+쉐프 요리쇼+삼계탕 요리경연대회+대형 가마솥 요리 시연+가족 단위 물놀이 행사 등', 'ㅇ삼계탕 사연 공모+먹방 콘테스트+라이브 커머스+쉐프 요리쇼+삼계탕 요리경연대회+대형 가마솥 요리 시연+가족 단위 물놀이 행사 등', '36.1000256', '127.5007304');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('45c8039a-1627-4f23-abcf-a8a11b1e6623', DATE '2023-07-21', DATE '2023-08-06', '제26회 보령머드축제', 'http://www.mudfestival.or.kr', '#fc6c78f', '보령해양머드박람회 연계 프로그램 40여종', '보령해양머드박람회 연계 프로그램 40여종', '36.304497', '126.517028');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('2694b834-4f15-4805-9626-06dc7ce80668', DATE '2023-07-28', DATE '2022-07-30', '제15회 향수옥천 포도·복숭아 축제', null, '#fc6c79f', '개막 축하음악회+농·특산물 판매장 등', '개막 축하음악회+농·특산물 판매장 등', '36.30307359', '127.5758071');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('a8365455-7088-4fad-aa6a-413d087675ae', DATE '2023-07-28', DATE '2023-07-30', '제9회 양평 워터워 페스티벌(양평 물축제)', 'https://okcheonwater.modoo.at/', '#fc6c80f', '옥천면 사탄천 일대에서 가족과 함께 시원한 여름을 즐기는 축제', '옥천면 사탄천 일대에서 가족과 함께 시원한 여름을 즐기는 축제', '37.52001447', '127.4561346');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('8a80452c-ce74-4b13-803f-426c3c75f700', DATE '2023-07-29', DATE '2023-07-30', '제13회 남한강축제', null, '#fc6c82f', '문화예술공연+노래자랑 등', '문화예술공연+노래자랑 등', '37.20602239', '127.7482249');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('90f1a61c-1562-4ae2-a83c-67277caa5498', DATE '2023-07-29', DATE '2023-08-06', '봉화은어축제', 'https://bhftf.co.kr:8091/', '#fc6c83f', '은어반두잡이+맨손잡이 체험 등', '은어반두잡이+맨손잡이 체험 등', '36.89039738', '128.7379707');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('a66ba293-203d-4dde-a486-c5222f0a04b1', DATE '2023-07-29', DATE '2023-08-06', '합천바캉스축제', 'http://www.hcvacance.kr/', '#fc6c85f', '전국에서 가장 HOT한 합천에서 가족과 함께하는 바캉스', '전국에서 가장 HOT한 합천에서 가족과 함께하는 바캉스', '35.5573152', '128.1675442');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('413b27ad-17b3-4361-94cf-23aed137e331', DATE '2023-08-01', DATE '2023-08-01', '치악산복숭아축제', null, '#fc6c87f', '지역 복숭아 판매+품평회+기타 등', '지역 복숭아 판매+품평회+기타 등', '37.3364295', '127.9462614');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('e8ef04f7-8c75-4e62-a152-fe84241d713c', DATE '2023-08-01', DATE '2023-08-01', '제27회 부산바다축제', null, '#fc6c88f', '개막행사+무대공연 등', '개막행사+무대공연 등', '35.16313992', '129.1635303');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('fecbf3f2-ea38-4d33-88c2-a3c28345076a', DATE '2023-08-01', DATE '2023-08-01', '송정해변축제', null, '#fc6c89f', '개막행사+무대공연 등', '개막행사+무대공연 등', '35.16313992', '129.1635303');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('75881c11-0655-4182-af15-4998229a3c45', DATE '2023-08-04', DATE '2023-08-06', '현인가요제', 'http://culture.bsseogu.go.kr', '#fc6c91f', '개막행사+현인가요제 전야제+현인가요제 본선', '개막행사+현인가요제 전야제+현인가요제 본선', '35.07682117', '129.0180502');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('bd61816c-461d-4fbe-903d-67d2d4f187f1', DATE '2023-08-05', DATE '2023-08-14', '2023 통영한산대첩축제', 'https://tyhansancf.or.kr/', '#fc6c92f', '고유제+군점+이순신장군 행렬+한산대첩 재현+공중한산해전+김한민감독 초청강연', '고유제+군점+이순신장군 행렬+한산대첩 재현+공중한산해전+김한민감독 초청강연', '34.84715495', '128.423489');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('2a5d7eb5-4931-4064-86fb-2f85629f0695', DATE '2023-08-10', DATE '2023-08-15', '제천국제음악영화제', 'http://www.jimff.org', '#fc6c93f', '음악영화제', '음악영화제', '37.1493417', '128.2160865');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('973e7e1d-f2be-4cfd-a4e9-3fd4271a10df', DATE '2023-08-12', DATE '2023-08-15', '안심창조밸리 연꽃마을 축제', null, '#fc6c94f', '연꽃길 힐링걷기대회, 관련 문화행사 등', '연꽃길 힐링걷기대회, 관련 문화행사 등', '35.86954023', '128.7353094');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('f9ceab21-05cb-43d5-a68d-dd6dc95c7d17', DATE '2023-08-12', DATE '2022-08-14', '거문도백도은빛바다체험행사', null, '#fc6c95f', '길놀이+은빛가요제+맨손활어잡기+지인망끌기체험', '길놀이+은빛가요제+맨손활어잡기+지인망끌기체험', '34.02575979', '127.311945');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('d0e44cbe-69ae-4c75-a697-72c460d333ba', DATE '2023-08-19', DATE '2023-08-21', '고서포도축제', null, '#fc6c96f', '특산품 홍보+판매', '특산품 홍보+판매', '35.22370105', '126.9729391');
INSERT INTO EVENTCALENDAR (EVENTCALENDAR_UUID, "start", END, TITLE, URL, BACKGROUNDCOLOR, DESCRIPTION, CONTENT, LATITUDE, LONGITUDE) VALUES ('79cd12a3-ed95-4a40-8a2b-4cdca2c95086', DATE '2023-08-25', DATE '2023-08-26', '함양연암문화화제', null, '#fc6c97f', '학술대회+연암역사 퀴즈대회+연암 부임행차+연암제례+축하공연+군민노래자랑', '학술대회+연암역사 퀴즈대회+연암 부임행차+연암제례+축하공연+군민노래자랑', '35.63129664', '127.812171');


commit;
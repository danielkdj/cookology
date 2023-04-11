drop user c##cookology cascade;
create user c##cookology identified by cookology;
grant resource, connect, dba to c##cookology;

--------------------------------------------

drop table USERS cascade constraints;
CREATE TABLE USERS
(
  , user_email         VARCHAR(1000)  NOT NULL
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
  , PRODUCT_NO     NUMBER      NOT NULL
  , CONSTRAINT PK_PRODUCT PRIMARY KEY (product_seq_id)
);

CREATE SEQUENCE SEQ_PRODUCT
  START WITH 1
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_PRODUCT
BEFORE INSERT ON PRODUCT
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
SELECT SEQ_PRODUCT.NEXTVAL
INTO: NEW.product_seq_id
FROM DUAL;
END;

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
COMMENT ON COLUMN PRODUCT.PRODUCT_NO IS '상품 번호';



--------------------------------------------------------------------------------
drop table PRODUCT_DESCRIPTION cascade constraints;
CREATE TABLE PRODUCT_DESCRIPTION
(
  product_seq_id    NUMBER  NOT NULL
  , PRODUCT_DESCRIPTION_NO     NUMBER      NOT NULL
  , original_img      VARCHAR2(100 BYTE)
  , rename_img      VARCHAR2(100 BYTE)
  , description      VARCHAR2(1000 BYTE)
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

		COMMENT ON COLUMN ORDERS.amount_day IS '일매출';

		COMMENT ON COLUMN ORDERS.amount_month IS '월매출';

--------------------------------------------------------------------------------

drop table cart cascade constraints;
CREATE TABLE cart (
                    cart_seq_id number not null
  , user_email varchar2(50) not null
--, user_name varchar2(50) not null
  , product_seq_id number not null
  , product_name varchar2(50) not null
  , product_discount number not null
  , price number not null
  , product_number number not null
  , amount number default 0
  , CONSTRAINT PK_CART PRIMARY KEY (cart_seq_id)
);

create sequence cart_seq_id
  start with 1
  increment by 1;

/
--------------------------------------------------------------------------------

drop table orders cascade constraints;
CREATE TABLE ORDERS
(
  orders_seq_id NUMBER NOT NULL
  , cart_seq_id NUMBER NOT NULL
  , product_seq_id NUMBER NOT NULL
  , business_number VARCHAR(100) NOT NULL
  , product_name VARCHAR2(100) NOT NULL
  , product_price number default 0
  , amount  NUMBER   default 0
  , user_email     VARCHAR(255) NOT NULL
  , user_name      VARCHAR2(200)
  , user_phone VARCHAR2(20) not null
  , user_address VARCHAR2(20) not null
  , user_post_code VARCHAR2(20) not null
  , cancellation   CHAR(1)      DEFAULT 'N'
  , orders_success  CHAR(1)      DEFAULT 'N'
  , amount_day  NUMBER default 0
  , amount_month NUMBER default 0
  , create_at    DATE     NOT NULL
  ,  CONSTRAINT PK_ORDERS PRIMARY KEY (orders_seq_id)
);

CREATE SEQUENCE SEQ_ORDERS
  START WITH 1
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_ORDERS
BEFORE INSERT ON ORDERS
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
SELECT SEQ_ORDERS.NEXTVAL
INTO: NEW.orders_seq_id
FROM DUAL;
END;
/

COMMENT ON COLUMN ORDERS.orders_seq_id IS '주문내역 고유번호';
COMMENT ON COLUMN ORDERS.business_number IS '사업자등록번호';
COMMENT ON COLUMN ORDERS.product_name IS '상품명';
COMMENT ON COLUMN ORDERS.product_price IS '상품 가격';
COMMENT ON COLUMN ORDERS.amount IS '주문 총금액';
COMMENT ON COLUMN ORDERS.user_email IS 'user 이메일ID';
COMMENT ON COLUMN ORDERS.user_name IS 'user 이름';
COMMENT ON COLUMN ORDERS.user_phone IS 'user 전화번호';
COMMENT ON COLUMN ORDERS.user_address IS 'user 주소';
COMMENT ON COLUMN ORDERS.user_post_code IS 'user 우편번호';
COMMENT ON COLUMN ORDERS.cancellation IS '주문취소 여부';
COMMENT ON COLUMN ORDERS.orders_success IS '주문 성공여부';
COMMENT ON COLUMN ORDERS.amount_day IS '일매출';
COMMENT ON COLUMN ORDERS.amount_month IS '월매출';
COMMENT ON COLUMN ORDERS.create_at IS '주문시간';
/


-------------------------------------------------------------------------------

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
COMMENT ON COLUMN ORDERS.amount_day IS '일매출';
COMMENT ON COLUMN ORDERS.amount_month IS '월매출';
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

CREATE OR REPLACE TRIGGER SEQ_TRG_RECIPE
BEFORE INSERT ON RECIPE
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
SELECT RECIPE_SEQ_ID  .NEXTVAL
INTO: NEW.recipe_seq_id
FROM DUAL;
END;
/

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

drop table EVENTCALEDAR cascade constraints;
create table EVENTCALEDAR
(
  EVENTCALENDAR_UUID VARCHAR2(255) not null
    constraint EVENTCALEDAR_PK
    primary key,
  "start"            DATE,
  END                DATE,
  TITLE              VARCHAR2(255),
  URL                VARCHAR2(255),
  BACKGROUNDCOLOR    VARCHAR2(30),
  DESCRIPTION        VARCHAR2(300),
  CONTENT            NCLOB
);

drop table "ATTENDANCE" cascade constraints;
CREATE TABLE "ATTENDANCE"
(   "USER_EMAIL" VARCHAR2(255),
    "TODAY" DATE
)

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
    
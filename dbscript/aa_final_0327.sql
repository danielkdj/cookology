
CREATE TABLE ALLERGY
(
  allergy_id   NUMBER       NOT NULL,
  allergy_name VARCHAR(255) NOT NULL,
  CONSTRAINT PK_ALLERGY PRIMARY KEY (allergy_id)
);

COMMENT ON COLUMN ALLERGY.allergy_id IS '알러지 고유번호';

COMMENT ON COLUMN ALLERGY.allergy_name IS '알러지명';

CREATE TABLE CLIENT
(
  business_number    VARCHAR(100)  NOT NULL,
  client_password    VARCHAR(100)  NOT NULL,
  client_name        VARCHAR(100)  NOT NULL,
  client_phone1      VARCHAR(100)  NOT NULL,
  client_phone2      VARCHAR(100)  NOT NULL,
  client_email       VARCHAR(200)  NOT NULL,
  client_address1    VARCHAR(1000) NOT NULL,
  client_address2    VARCHAR(1000) NOT NULL,
  client_post_code   VARCHAR(20)   NOT NULL,
  clame_num          NUMBER        NOT NULL,
  account_activation CHAR(1)       DEFAULT 'Y' NOT NULL,
  client_profile_url NCLOB        ,
  CONSTRAINT PK_CLIENT PRIMARY KEY (business_number)
);

COMMENT ON COLUMN CLIENT.business_number IS '사업자등록번호(ID) ';

COMMENT ON COLUMN CLIENT.client_password IS 'client 비밀번호';

COMMENT ON COLUMN CLIENT.client_name IS 'client 상호명';

COMMENT ON COLUMN CLIENT.client_phone1 IS '사업장 전화번호';

COMMENT ON COLUMN CLIENT.client_phone2 IS 'client 본인 전화번호';

COMMENT ON COLUMN CLIENT.client_email IS 'client 이메일';

COMMENT ON COLUMN CLIENT.client_address1 IS '사업장 기본주소';

COMMENT ON COLUMN CLIENT.client_address2 IS '사업장 상세주소';

COMMENT ON COLUMN CLIENT.client_post_code IS '사업장 우편번호';

COMMENT ON COLUMN CLIENT.clame_num IS '클레임 받은 횟수';

COMMENT ON COLUMN CLIENT.account_activation IS '계정활성화 여부';

COMMENT ON COLUMN CLIENT.client_profile_url IS 'client 프로필 사진';

CREATE TABLE FAQ
(
  faq_seq_id      NUMBER   NOT NULL,
  frequentlyAsked VARCHAR2,
  auestions       VARCHAR2,
  CONSTRAINT PK_FAQ PRIMARY KEY (faq_seq_id)
);

COMMENT ON COLUMN FAQ.faq_seq_id IS 'FAQ 고유번호';

COMMENT ON COLUMN FAQ.frequentlyAsked IS '자주 묻는 질문';

COMMENT ON COLUMN FAQ.auestions IS 'FAQ 답변';

CREATE TABLE LIKE_PRODUCT
(
  product_id  NUMBER       NOT NULL,
  user_email  VARCHAR(255) NOT NULL,
  count       number      ,
  create_at   TIMESTAMP    NOT NULL,
  modified_at TIMESTAMP    NOT NULL
);

COMMENT ON COLUMN LIKE_PRODUCT.product_id IS '상품고유번호';

COMMENT ON COLUMN LIKE_PRODUCT.user_email IS 'user 이메일(ID)';

COMMENT ON COLUMN LIKE_PRODUCT.create_at IS '생성일시(좋아요 누른 시간)';

COMMENT ON COLUMN LIKE_PRODUCT.modified_at IS '수정일시(좋아요 내역변경)';

CREATE TABLE NOTIFITION
(
  notifition_seq_id  NUMBER       NOT NULL,
  admin_id           VARCHAR(255) NOT NULL,
  notifition_title   VARCHAR(200) NOT NULL,
  notifition_content NCLOB        NOT NULL,
  created_at         TIMESTAMP    NOT NULL,
  modified_at        TIMESTAMP    NOT NULL,
  user_email         VARCHAR(255) NOT NULL,
  CONSTRAINT PK_NOTIFITION PRIMARY KEY (notifition_seq_id)
);

CREATE SEQUENCE SEQ_NOTIFITION
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_NOTIFITION
BEFORE INSERT ON NOTIFITION
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_NOTIFITION.NEXTVAL
  INTO: NEW.notifition_seq_id
  FROM DUAL;
END;
/

COMMENT ON COLUMN NOTIFITION.notifition_seq_id IS '공지글 고유번호';

COMMENT ON COLUMN NOTIFITION.admin_id IS '관리자ID';

COMMENT ON COLUMN NOTIFITION.notifition_title IS '공지글 제목';

COMMENT ON COLUMN NOTIFITION.notifition_content IS '공지글 내용';

COMMENT ON COLUMN NOTIFITION.created_at IS '공지글 작성시간';

COMMENT ON COLUMN NOTIFITION.modified_at IS '공지글 수정시간';

COMMENT ON COLUMN NOTIFITION.user_email IS 'user 이메일';

CREATE TABLE ORDERS
(
  order_id       NUMBER       NOT NULL,
  user_email     VARCHAR(255) NOT NULL,
  product_seq_id NUMBER       NOT NULL,
  invoice_number NUMBER      ,
  amount         NUMBER      ,
  cancellation   CHAR(1)      DEFAULT 'N',
  order_success  CHAR(1)      DEFAULT 'N',
  count          NUMBER       NOT NULL,
  user_name      VARCHAR2    ,
  create_at      TIMESTAMP   ,
  modified_at    TIMESTAMP    NOT NULL,
  CONSTRAINT PK_ORDERS PRIMARY KEY (order_id)
);

CREATE SEQUENCE SEQ_ORDERS
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_ORDERS
BEFORE INSERT ON ORDERS
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_ORDERS.NEXTVAL
  INTO: NEW.order_id
  FROM DUAL;
END;
/

COMMENT ON COLUMN ORDERS.order_id IS '주문내역 고유번호';

COMMENT ON COLUMN ORDERS.user_email IS 'user 이메일(ID)';

COMMENT ON COLUMN ORDERS.product_seq_id IS '상품 고유번호';

COMMENT ON COLUMN ORDERS.invoice_number IS '송장번호';

COMMENT ON COLUMN ORDERS.amount IS '주문 총금액';

COMMENT ON COLUMN ORDERS.cancellation IS '주문취소 여부';

COMMENT ON COLUMN ORDERS.order_success IS '주문 성공여부';

COMMENT ON COLUMN ORDERS.count IS '상품주문 수량';

COMMENT ON COLUMN ORDERS.user_name IS 'user 이름';

COMMENT ON COLUMN ORDERS.create_at IS '주문 일시';

COMMENT ON COLUMN ORDERS.modified_at IS '수정일시';

CREATE TABLE PAYED_LIST
(
  user_email      VARCHAR(255),
  business_number VARCHAR2    ,
  user_address1   VARCHAR2    ,
  user_address2   VARCHAR2    ,
  user_post_code  VARCHAR2    ,
  user_phone      VARCHAR2    ,
  amount          number      ,
  create_at       TIMESTAMP   ,
  modified_at     timestamp   ,
  count           number      
);

COMMENT ON COLUMN PAYED_LIST.user_email IS 'user id';

COMMENT ON COLUMN PAYED_LIST.business_number IS 'client id';

COMMENT ON COLUMN PAYED_LIST.user_address1 IS 'user  기본주소';

COMMENT ON COLUMN PAYED_LIST.user_address2 IS 'user 상세주소';

COMMENT ON COLUMN PAYED_LIST.user_post_code IS 'user 우편번호';

COMMENT ON COLUMN PAYED_LIST.user_phone IS 'user 전화번호';

COMMENT ON COLUMN PAYED_LIST.amount IS '총가격';

COMMENT ON COLUMN PAYED_LIST.create_at IS '생성일시';

COMMENT ON COLUMN PAYED_LIST.modified_at IS '수정일시';

COMMENT ON COLUMN PAYED_LIST.count IS '수량';

CREATE TABLE PRODUCT
(
  product_seq_id   NUMBER         NOT NULL,
  business_number  VARCHAR(100)   NOT NULL,
  thumb_url        VARCHAR2      ,
  product_name     VARCHAR2(100)  NOT NULL,
  price            NUMBER        ,
  stock            NUMBER        ,
  claims_num       NUMBER         NOT NULL,
  create_at        TIMESTAMP      NOT NULL,
  modified_at      TIMESTAMP      NOT NULL,
  admin_inspection CHAR(1)        DEFAULT 'N',
  tag              VARCHAR2(1000),
  CONSTRAINT PK_PRODUCT PRIMARY KEY (product_seq_id)
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
/

COMMENT ON COLUMN PRODUCT.product_seq_id IS '상품고유번호';

COMMENT ON COLUMN PRODUCT.business_number IS '사업자등록번호';

COMMENT ON COLUMN PRODUCT.thumb_url IS '상품 이미지 url';

COMMENT ON COLUMN PRODUCT.product_name IS '상품명';

COMMENT ON COLUMN PRODUCT.price IS '상품 가격';

COMMENT ON COLUMN PRODUCT.stock IS '상품 재고량';

COMMENT ON COLUMN PRODUCT.claims_num IS '클레임 횟수(경고)';

COMMENT ON COLUMN PRODUCT.create_at IS '상품 생성일시';

COMMENT ON COLUMN PRODUCT.modified_at IS '상품 수정일시';

COMMENT ON COLUMN PRODUCT.admin_inspection IS '관리자 검수여부';

COMMENT ON COLUMN PRODUCT.tag IS '상품 검색태그명';

CREATE TABLE PRODUCT_ALLERGY
(
  product_seq_id NUMBER NOT NULL,
  allergy_id     NUMBER NOT NULL
);

COMMENT ON COLUMN PRODUCT_ALLERGY.product_seq_id IS '상품 고유번호';

COMMENT ON COLUMN PRODUCT_ALLERGY.allergy_id IS '알러지 고유번호';

CREATE TABLE QNA
(
  qna_seq_id  NUMBER       NOT NULL,
  user_email  VARCHAR(255) NOT NULL,
  q_title     VARCHAR2     NOT NULL,
  q_content   VARCHAR2     NOT NULL,
  q_create_at TIMESTAMP    NOT NULL,
  a_content   VARCHAR2    ,
  a_create_at TIMESTAMP   ,
  issolved    CHAR(1)      DEFAULT 'N' NOT NULL,
  CONSTRAINT PK_QNA PRIMARY KEY (qna_seq_id)
);

COMMENT ON COLUMN QNA.qna_seq_id IS 'Q&A 고유번호';

COMMENT ON COLUMN QNA.user_email IS 'user 이메일';

COMMENT ON COLUMN QNA.q_title IS 'Q질문 제목';

COMMENT ON COLUMN QNA.q_content IS 'Q질문 내용';

COMMENT ON COLUMN QNA.q_create_at IS 'Q질문 작성시간';

COMMENT ON COLUMN QNA.a_content IS 'A답변 내용';

COMMENT ON COLUMN QNA.a_create_at IS 'A답변 작성시간';

COMMENT ON COLUMN QNA.issolved IS '답변 완료여부';

CREATE TABLE RECIPE
(
  recipe_seq_id     NUMBER        NOT NULL,
  category_id       NUMBER        NOT NULL,
  thumb_url         VARCHAR2(500),
  recipe_title      VARCHAR(200)  NOT NULL,
  recipe_ingredient VARCHAR(2000) NOT NULL,
  views             NUMBER        DEFAULT 1 NOT NULL,
  recipe_time       VARCHAR(200)  NOT NULL,
  recipe_level      VARCHAR(200)  NOT NULL,
  serving_dish      VARCHAR(200)  NOT NULL,
  admin_inspection  CHAR(1)       DEFAULT 'N',
  created_at        TIMESTAMP     NOT NULL,
  modified_at       TIMESTAMP     NOT NULL,
  CONSTRAINT PK_RECIPE PRIMARY KEY (recipe_seq_id)
);

CREATE SEQUENCE SEQ_RECIPE
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_RECIPE
BEFORE INSERT ON RECIPE
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_RECIPE.NEXTVAL
  INTO: NEW.recipe_seq_id
  FROM DUAL;
END;
/

COMMENT ON COLUMN RECIPE.recipe_seq_id IS '레시피 고유번호';

COMMENT ON COLUMN RECIPE.category_id IS '카테고리 고유번호';

COMMENT ON COLUMN RECIPE.thumb_url IS '이미지링크';

COMMENT ON COLUMN RECIPE.recipe_title IS '레시피 제목';

COMMENT ON COLUMN RECIPE.recipe_ingredient IS '레시피 재료';

COMMENT ON COLUMN RECIPE.views IS '조회수';

COMMENT ON COLUMN RECIPE.recipe_time IS '조리시간';

COMMENT ON COLUMN RECIPE.recipe_level IS '조리난이도';

COMMENT ON COLUMN RECIPE.serving_dish IS '요리인분수';

COMMENT ON COLUMN RECIPE.admin_inspection IS '관리자 검수여부';

COMMENT ON COLUMN RECIPE.created_at IS '레시피 작성일시';

COMMENT ON COLUMN RECIPE.modified_at IS '레시피 수정일시';

CREATE TABLE RECIPE_ALLERGY
(
  allergy_id    NUMBER NOT NULL,
  recipe_seq_id NUMBER NOT NULL
);

COMMENT ON COLUMN RECIPE_ALLERGY.allergy_id IS '알러지 고유번호';

COMMENT ON COLUMN RECIPE_ALLERGY.recipe_seq_id IS '레시피 고유번호';

CREATE TABLE RECIPE_CATEGORY
(
  category_id   NUMBER       NOT NULL,
  category_name VARCHAR(100) NOT NULL,
  CONSTRAINT PK_RECIPE_CATEGORY PRIMARY KEY (category_id)
);

COMMENT ON COLUMN RECIPE_CATEGORY.category_id IS '카테고리 고유번호';

COMMENT ON COLUMN RECIPE_CATEGORY.category_name IS '카테고리명';

CREATE TABLE RECIPE_REACTION
(
  user_email    VARCHAR(255) NOT NULL,
  recipe_seq_id NUMBER       NOT NULL,
  reaction      VARCHAR(100)
);

COMMENT ON COLUMN RECIPE_REACTION.user_email IS 'user 이메일';

COMMENT ON COLUMN RECIPE_REACTION.recipe_seq_id IS '레시피 고유번호';

COMMENT ON COLUMN RECIPE_REACTION.reaction IS 'user 반응(좋아요/싫어요)';

CREATE TABLE RECPIE_COMMENT
(
  recipe_comment_id NUMBER       NOT NULL,
  user_email        VARCHAR(255) NOT NULL,
  recipe_seq_id     NUMBER       NOT NULL,
  parent_comment_id NUMBER       NOT NULL,
  comment_depth     NUMBER       NOT NULL,
  content           NCLOB       ,
  create_at         TIMESTAMP    NOT NULL,
  modified_at       TIMESTAMP    NOT NULL,
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

CREATE TABLE USER_ADDRESS
(
  user_email     VARCHAR(255)   NOT NULL,
  user_address1  VARCHAR2(1000),
  user_address2  VARCHAR2(1000),
  user_post_code VARCHAR2(1000)
);

COMMENT ON COLUMN USER_ADDRESS.user_email IS 'user 이메일';

COMMENT ON COLUMN USER_ADDRESS.user_address1 IS '기본주소';

COMMENT ON COLUMN USER_ADDRESS.user_address2 IS '상세주소';

COMMENT ON COLUMN USER_ADDRESS.user_post_code IS '우편번호';

CREATE TABLE USERS
(
  user_email         VARCHAR(255)   NOT NULL,
  is_admin           CHAR(1)        DEFAULT 'N' NOT NULL,
  user_password      VARCHAR2(1000) NOT NULL,
  user_name          VARCHAR(20)   ,
  user_nickname      VARCHAR2(60)      ,
  user_phone         VARCHAR(20)   ,
  create_at          TIMESTAMP      NOT NULL,
  modified_at        TIMESTAMP      NOT NULL,
  account_activation CHAR(1)        DEFAULT 'Y' NOT NULL,
  user_allergy       VARCHAR2(1000),
  user_profile_url   NCLOB         ,
  CONSTRAINT PK_USERS PRIMARY KEY (user_email)
);

COMMENT ON COLUMN USERS.user_email IS 'user 이메일';

COMMENT ON COLUMN USERS.is_admin IS '관리자?';

COMMENT ON COLUMN USERS.user_password IS 'user 비밀번호';

COMMENT ON COLUMN USERS.user_name IS 'user 이름';

COMMENT ON COLUMN USERS.user_nickname IS '닉네임';

COMMENT ON COLUMN USERS.user_phone IS 'user 연락처';

COMMENT ON COLUMN USERS.create_at IS '가입일시';

COMMENT ON COLUMN USERS.modified_at IS '수정일시';

COMMENT ON COLUMN USERS.account_activation IS '계정활성화여부';

COMMENT ON COLUMN USERS.user_allergy IS 'user 알러지정보';

COMMENT ON COLUMN USERS.user_profile_url IS 'user 프로필사진';

CREATE TABLE VISITOR_LOG
(
  user_ip     VARCHAR(255) NOT NULL,
  access_time TIMESTAMP    NOT NULL
);

COMMENT ON COLUMN VISITOR_LOG.user_ip IS '방문자 정보';

COMMENT ON COLUMN VISITOR_LOG.access_time IS '방문자 첫 접속시간';

ALTER TABLE USER_ADDRESS
  ADD CONSTRAINT FK_USERS_TO_USER_ADDRESS
    FOREIGN KEY (user_email)
    REFERENCES USERS (user_email);

ALTER TABLE RECIPE_REACTION
  ADD CONSTRAINT FK_USERS_TO_RECIPE_REACTION
    FOREIGN KEY (user_email)
    REFERENCES USERS (user_email);

ALTER TABLE RECPIE_COMMENT
  ADD CONSTRAINT FK_USERS_TO_RECPIE_COMMENT
    FOREIGN KEY (user_email)
    REFERENCES USERS (user_email);

ALTER TABLE RECPIE_COMMENT
  ADD CONSTRAINT FK_RECPIE_COMMENT_TO_RECPIE_COMMENT
    FOREIGN KEY (parent_comment_id)
    REFERENCES RECPIE_COMMENT (recipe_comment_id);

ALTER TABLE PRODUCT
  ADD CONSTRAINT FK_CLIENT_TO_PRODUCT
    FOREIGN KEY (business_number)
    REFERENCES CLIENT (business_number);

ALTER TABLE LIKE_PRODUCT
  ADD CONSTRAINT FK_PRODUCT_TO_LIKE_PRODUCT
    FOREIGN KEY (product_id)
    REFERENCES PRODUCT (product_seq_id);

ALTER TABLE LIKE_PRODUCT
  ADD CONSTRAINT FK_USERS_TO_LIKE_PRODUCT
    FOREIGN KEY (user_email)
    REFERENCES USERS (user_email);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_USERS_TO_ORDERS
    FOREIGN KEY (user_email)
    REFERENCES USERS (user_email);

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

ALTER TABLE RECIPE_REACTION
  ADD CONSTRAINT FK_RECIPE_TO_RECIPE_REACTION
    FOREIGN KEY (recipe_seq_id)
    REFERENCES RECIPE (recipe_seq_id);

ALTER TABLE PRODUCT_ALLERGY
  ADD CONSTRAINT FK_PRODUCT_TO_PRODUCT_ALLERGY
    FOREIGN KEY (product_seq_id)
    REFERENCES PRODUCT (product_seq_id);

ALTER TABLE PRODUCT_ALLERGY
  ADD CONSTRAINT FK_ALLERGY_TO_PRODUCT_ALLERGY
    FOREIGN KEY (allergy_id)
    REFERENCES ALLERGY (allergy_id);

ALTER TABLE NOTIFITION
  ADD CONSTRAINT FK_USERS_TO_NOTIFITION
    FOREIGN KEY (user_email)
    REFERENCES USERS (user_email);

ALTER TABLE ORDERS
  ADD CONSTRAINT FK_PRODUCT_TO_ORDERS
    FOREIGN KEY (product_seq_id)
    REFERENCES PRODUCT (product_seq_id);

ALTER TABLE QNA
  ADD CONSTRAINT FK_USERS_TO_QNA
    FOREIGN KEY (user_email)
    REFERENCES USERS (user_email);

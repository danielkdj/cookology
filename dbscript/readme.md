dbscript

23-03-17

1. user_data 테이블 users로 수정

2. common_user 테이블에 있는 user_profile_url users로 이동

3. client 테이블에 client_profile_url 추가


23-03-18

1. 오타 수정 perepared_recipe_comment_reaction -> prepared_recipe_comment_reaction

23-03-19


1. 테이블 명 user_data => users

2. 테이블 명 visit_user => visitor_log

3. sns 유저 테이블 _user 삭제

4. sns 유저 테이블  *_id 컬럼 -> _token으로 변경

23-03-21

1. sns 테이블 삭제 & 일반 유저 테이블 병합

2. 관리자 테이블 삭제 & 일반 유저 테이블 병함

3. 권한 테이블 추가

3.1 권한 테이블은 유저, 관리자를 구분하고 관리자 레벨을 설정하기 위함

4. FAQ 테이블 추가

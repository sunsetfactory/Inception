-- init_db.sql

-- DB 생성
CREATE DATABASE IF NOT EXISTS wpdb;

-- 계정 생성 및 패스워드 설정
CREATE USER IF NOT EXISTS 'seokjyan'@'localhost' IDENTIFIED BY '1234';

-- 계정이 DB에 접근할 수 있는 모든 권한 부여
GRANT ALL ON wpdb.* TO 'seokjyan'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;

-- 설정을 마침 권한을 적용
FLUSH PRIVILEGES;

-- 종료
exit

-- 조회 관련 명령어
-- SELECT USER(); -- 현재 접속한 계정 정보
-- SHOW DATABASES; -- DB 목록 조회
-- SHOW GRANTS FOR 'seokjyan'@'localhost'; -- 계정 권한 조회
-- SELECT User, Host FROM mysql.user; -- 계정 목록 조회

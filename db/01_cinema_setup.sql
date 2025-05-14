-- 기존에 'cinema_db'라는 데이터베이스가 존재하면 삭제
DROP SCHEMA IF EXISTS cinema_db;

-- 'cinema_db' 데이터베이스가 존재하지 않으면 새로 생성
CREATE SCHEMA IF NOT EXISTS cinema_db DEFAULT CHARACTER SET utf8;

-- 생성된 'cinema_db' 데이터베이스를 사용
USE cinema_db;

-- 'test_admin' 사용자에게 'cinema_db' 데이터베이스에 대한 모든 권한 부여
GRANT ALL PRIVILEGES ON cinema_db.* TO 'user'@'%';

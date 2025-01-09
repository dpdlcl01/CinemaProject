-- 기존 데이터베이스가 있다면 삭제
DROP DATABASE IF EXISTS MovieDB;

-- 새 데이터베이스 생성
CREATE DATABASE MovieDB;

-- 데이터베이스 사용
USE MovieDB;

-- 1. 사용자 테이블 생성
CREATE TABLE user (
    userIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    userId VARCHAR(20) UNIQUE NOT NULL,
    userName VARCHAR(20) NOT NULL,
    userEmail VARCHAR(50),
    userPassword VARCHAR(50) NOT NULL,
    userPhone VARCHAR(20),
    userPoint INT DEFAULT 0,
    userGrade VARCHAR(5) DEFAULT 'Basic',
    userRegDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    userStatus TINYINT(1) DEFAULT 0
);

-- 17. 관리자 테이블 생성
CREATE TABLE admin (
    adminIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    adminId VARCHAR(20) UNIQUE NOT NULL,
    adminPassword VARCHAR(50) NOT NULL,
    adminLevel VARCHAR(20),
    adminStatus TINYINT(1) DEFAULT 0
);

-- 16. 공지사항 테이블 생성
CREATE TABLE notice (
    noticeIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    adminIdx BIGINT,
    noticeTitle VARCHAR(70) NOT NULL,
    noticeContent TEXT NOT NULL,
    noticeRegDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    noticeExpDate DATETIME DEFAULT NULL,
    noticeStatus TINYINT(1) DEFAULT 0,
    FOREIGN KEY (adminIdx) REFERENCES admin(adminIdx)
);

-- 2. 영화 테이블 생성
CREATE TABLE movie (
    movieIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    movieTitle VARCHAR(100) NOT NULL,
    movieGenre VARCHAR(50),
    movieTime INT,
    movieRating VARCHAR(20),
    movieDate DATE,
    movieDirector VARCHAR(50),
    movieActors TEXT,
    movieInfo TEXT,
    moviePosterUrl VARCHAR(1000),
    movieStatus TINYINT(1) DEFAULT 0
);

-- 3. 극장 테이블 생성
CREATE TABLE theater (
    theaterIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    theaterName VARCHAR(30) NOT NULL,
    theaterRegion VARCHAR(20),
    theaterAddress VARCHAR(100),
    theaterInfo TEXT,
    theaterScreenCount INT DEFAULT 0,
    theaterRegDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    theaterStatus TINYINT(1) DEFAULT 0
);

-- 4. 상영관 테이블 생성
CREATE TABLE screen (
    screenIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    theaterIdx BIGINT NOT NULL,
    screenName VARCHAR(20) NOT NULL,
    screenSeatCount INT DEFAULT 0,
    screenStatus TINYINT(1) DEFAULT 0,
    screenType TINYINT(1) DEFAULT 0,
    FOREIGN KEY (theaterIdx) REFERENCES theater(theaterIdx)
);

-- 5. 상영 시간표 테이블 생성
CREATE TABLE timetable (
    timetableIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    movieIdx BIGINT NOT NULL,
    theaterIdx BIGINT NOT NULL,
    screenIdx BIGINT NOT NULL,
    timetableStartTime DATETIME NOT NULL,
    timetableEndTime DATETIME NOT NULL,
    FOREIGN KEY (movieIdx) REFERENCES movie(movieIdx),
    FOREIGN KEY (theaterIdx) REFERENCES theater(theaterIdx),
    FOREIGN KEY (screenIdx) REFERENCES screen(screenIdx)
);

-- 6. 좌석 테이블 생성
CREATE TABLE seat (
    seatIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    screenIdx BIGINT NOT NULL,
    seatNumber VARCHAR(5) NOT NULL,
    seatStatus TINYINT(1) DEFAULT 0,
    FOREIGN KEY (screenIdx) REFERENCES screen(screenIdx)
);

-- 7. 예매 테이블 생성
CREATE TABLE reservation (
    reservationIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    userIdx BIGINT NOT NULL,
    timetableIdx BIGINT NOT NULL,
    reservationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    reservationStatus TINYINT(1) DEFAULT 0,
    FOREIGN KEY (userIdx) REFERENCES user(userIdx),
    FOREIGN KEY (timetableIdx) REFERENCES timetable(timetableIdx)
);

-- 8. 예매-좌석 매핑 테이블 생성
CREATE TABLE reservationSeatMapping (
    reservationSeatIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservationIdx BIGINT NOT NULL,
    seatIdx BIGINT NOT NULL,
    ticketType TINYINT(1),
    seatPrice INT,
    FOREIGN KEY (reservationIdx) REFERENCES reservation(reservationIdx),
    FOREIGN KEY (seatIdx) REFERENCES seat(seatIdx)
);

-- 9. 쿠폰 테이블 생성
CREATE TABLE coupon (
    couponIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    couponName VARCHAR(50) NOT NULL,
    couponInfo TEXT,
    couponType TINYINT(1),
    couponValue DECIMAL(10, 2),
    couponRegDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    couponExpDate DATETIME DEFAULT NULL,
    couponStatus TINYINT(1) DEFAULT 0
);

-- 10. 쿠폰-사용자 매핑 테이블 생성
CREATE TABLE couponUserMapping (
    couponUserIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    couponIdx BIGINT NOT NULL,
    userIdx BIGINT NOT NULL,
    couponUserStatus TINYINT(1) DEFAULT 0,
    couponUserDate DATETIME DEFAULT NULL,
    FOREIGN KEY (couponIdx) REFERENCES coupon(couponIdx),
    FOREIGN KEY (userIdx) REFERENCES user(userIdx)
);

-- 11. 상품 테이블 생성
CREATE TABLE product (
    productIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    productCategory VARCHAR(30),
    productName VARCHAR(50) NOT NULL,
    productInfo TEXT,
    productPrice INT,
    productStock INT DEFAULT 0,
    productRegDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    productStatus TINYINT(1) DEFAULT 0
);

-- 12. 결제 테이블 생성
CREATE TABLE payment (
    paymentIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    paymentType TINYINT(1),
    reservationIdx BIGINT DEFAULT NULL,
    productIdx BIGINT DEFAULT NULL,
    paymentMethod VARCHAR(10),
    paymentTotal INT,
    paymentDiscount INT,
    paymentFinal INT,
    paymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    paymentStatus TINYINT(1) DEFAULT 0,
    FOREIGN KEY (reservationIdx) REFERENCES reservation(reservationIdx),
    FOREIGN KEY (productIdx) REFERENCES product(productIdx)
);

-- 13. 포인트 테이블 생성
CREATE TABLE point (
    pointIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    userIdx BIGINT NOT NULL,
    pointValue BIGINT NOT NULL,
    pointType VARCHAR(20),
    pointRegDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    pointExpDate DATETIME DEFAULT NULL,
    FOREIGN KEY (userIdx) REFERENCES user(userIdx)
);

-- 14. 관람한 영화 목록 테이블 생성
CREATE TABLE watched (
    watchedIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    userIdx BIGINT NOT NULL,
    movieIdx BIGINT NOT NULL,
    reservationIdx BIGINT DEFAULT NULL,
    watchedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userIdx) REFERENCES user(userIdx),
    FOREIGN KEY (movieIdx) REFERENCES movie(movieIdx),
    FOREIGN KEY (reservationIdx) REFERENCES reservation(reservationIdx)
);

-- 15. 리뷰 테이블 생성
CREATE TABLE review (
    reviewIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    userIdx BIGINT NOT NULL,
    movieIdx BIGINT NOT NULL,
    reviewRating DECIMAL(2, 1) NOT NULL,
    reviewContent TEXT,
    reviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userIdx) REFERENCES user(userIdx),
    FOREIGN KEY (movieIdx) REFERENCES movie(movieIdx)
);

-- 18. 로그 테이블 생성
CREATE TABLE log (
    logIdx BIGINT AUTO_INCREMENT PRIMARY KEY,
    adminIdx BIGINT DEFAULT NULL,
    logType TINYINT(1),
    logInfo TEXT NOT NULL,
    logDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (adminIdx) REFERENCES admin(adminIdx)
);

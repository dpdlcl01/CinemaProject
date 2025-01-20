-- 21. 관리자(admin) 테이블 생성
CREATE TABLE admin (
    adminIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '관리자 고유 ID',
    adminId VARCHAR(20) NOT NULL UNIQUE COMMENT '관리자 로그인 ID',
    adminPassword VARCHAR(50) NOT NULL COMMENT '관리자 비밀번호',
    adminLevel VARCHAR(20) NOT NULL COMMENT '관리자 등급 (SUPER, MANAGER)',
    adminStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '관리자 상태 (0: 활성, 1: 삭제)'
) COMMENT='관리자 정보를 저장하는 테이블';


-- 1. 사용자(user) 테이블 생성
CREATE TABLE user (
    userIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '사용자 고유 ID',
    userName VARCHAR(20) NOT NULL COMMENT '사용자 이름',
    userId VARCHAR(20) NOT NULL UNIQUE COMMENT '사용자 ID',
    userPassword VARCHAR(255) NOT NULL COMMENT '사용자 비밀번호 (bcrypt 해시 값 저장)',
    userBirth DATE NOT NULL COMMENT '사용자 생년월일',
    userEmail VARCHAR(50) NOT NULL UNIQUE COMMENT '사용자 이메일',
    userPhone VARCHAR(20) NOT NULL COMMENT '사용자 연락처',
    userPoint INT COMMENT '사용자 보유 포인트',
    userGrade VARCHAR(5) COMMENT '사용자 등급 (BASIC, VIP, VVIP)',
    userRegDate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '사용자 가입일',
    userStatus TINYINT(1) DEFAULT 0 COMMENT '사용자 상태 (0: 활성, 1: 탈퇴)'
) COMMENT='사용자 정보를 저장하는 테이블';


-- 2. 영화(movie) 테이블 생성
CREATE TABLE movie (
    movieIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '영화 고유 ID',
    movieCd VARCHAR(20) NOT NULL COMMENT 'KOFIC 영화 고유 코드',
    movieTitle VARCHAR(100) NOT NULL COMMENT '영화 제목',
    movieTitleEn VARCHAR(200) COMMENT '영화 제목 (영문)',
    movieGenre VARCHAR(50) COMMENT '영화 장르',
    movieTime INT NOT NULL COMMENT '상영 시간 (분 단위)',
    movieGrade VARCHAR(10) NOT NULL COMMENT '관람 등급 (ALL: 전체, 12: 12세 이상, 15: 15세 이상, 19: 청소년 불가)',
    movieDate DATE NOT NULL COMMENT '개봉일',
    movieDirector VARCHAR(50) COMMENT '감독',
    movieActors TEXT COMMENT '주요 배우 리스트 (쉼표로 구분된 문자열 형태)',
    movieInfo TEXT COMMENT '영화 상세 설명',
    moviePosterUrl VARCHAR(500) NOT NULL COMMENT '포스터 이미지 경로',
    movieReservationRate FLOAT COMMENT '영화 예매율 (%)',
    movieTotalAudience BIGINT COMMENT '누적 관객수',
    movieStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '영화 상태 (0: 개봉, 1: 개봉 예정, 2: 종료)'
) COMMENT='영화 정보를 저장하는 테이블';



-- 3. 극장(theater) 테이블 생성
CREATE TABLE theater (
    theaterIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '극장 고유 ID',
    theaterName VARCHAR(30) NOT NULL COMMENT '극장 이름',
    theaterRegion VARCHAR(20) NOT NULL COMMENT '극장 지역',
    theaterAddress VARCHAR(100) NOT NULL COMMENT '극장 주소',
    theaterInfo VARCHAR(255) COMMENT '극장 설명 (간단한 소개 문구)',
    theaterImageUrl VARCHAR(255) COMMENT '극장 설명 이미지 URL (보유 시설, 층별 안내 등의 시설안내 이미지)',
    theaterScreenCount INT(2) NOT NULL COMMENT '총 상영관 수',
    theaterRegDate DATETIME NOT NULL COMMENT '극장 등록일 (관리자 입력)',
    theaterStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '극장 상태 (0: 운영 중, 1: 점검, 2: 폐쇄)'
) COMMENT='극장 정보를 저장하는 테이블';


-- 4. 상영관(screen) 테이블 생성
CREATE TABLE screen (
    screenIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '상영관 고유 ID',
    theaterIdx BIGINT NOT NULL COMMENT '극장 ID',
    screenName VARCHAR(20) NOT NULL COMMENT '상영관 이름',
    screenType TINYINT(1) NOT NULL COMMENT '상영관 유형 (1: COMFORT, 2: VIP, 3: DOLBY, 4: 4DX, 5: IMAX)',
    screenSeatCount INT(5) NOT NULL COMMENT '좌석 수',
    screenStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '상영관 상태 (0: 운영 중, 1: 점검, 2: 폐쇄)',
    FOREIGN KEY (theaterIdx) REFERENCES theater(theaterIdx) ON DELETE CASCADE
) COMMENT='극장 상영관 정보를 저장하는 테이블';


-- 5. 상영 시간표(timetable) 테이블 생성
CREATE TABLE timetable (
    timetableIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '상영 시간표 고유 ID',
    movieIdx BIGINT NOT NULL COMMENT '영화 ID',
    theaterIdx BIGINT NOT NULL COMMENT '영화관 ID',
    screenIdx BIGINT NOT NULL COMMENT '상영관 ID',
    timetableStartTime DATETIME NOT NULL COMMENT '상영 시작 시간',
    timetableEndTime DATETIME NOT NULL COMMENT '상영 종료 시간',
    FOREIGN KEY (movieIdx) REFERENCES movie(movieIdx) ON DELETE CASCADE,
    FOREIGN KEY (theaterIdx) REFERENCES theater(theaterIdx) ON DELETE CASCADE,
    FOREIGN KEY (screenIdx) REFERENCES screen(screenIdx) ON DELETE CASCADE
) COMMENT='영화 상영 시간표 정보를 저장하는 테이블';


-- 6. 좌석(seat) 테이블 생성
CREATE TABLE seat (
    seatIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '좌석 고유 ID',
    screenIdx BIGINT NOT NULL COMMENT '상영관 ID',
    seatNumber VARCHAR(5) NOT NULL COMMENT '좌석 번호',
    seatStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '좌석 상태 (0: 사용 가능, 1: 예약됨, 2: 임시 확보)',
    FOREIGN KEY (screenIdx) REFERENCES screen(screenIdx) ON DELETE CASCADE
) COMMENT='영화 상영관의 좌석 정보를 저장하는 테이블';


-- 7. 좌석 가격(price) 테이블 생성
CREATE TABLE price (
    priceIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '가격 설정 고유 ID',
    screenType TINYINT(1) NOT NULL COMMENT '상영관 유형 (1: COMFORT, 2: VIP, 3: DOLBY, 4: 4DX, 5: IMAX)',
    ageGroup TINYINT(1) NOT NULL COMMENT '연령대 (1: 성인, 2: 청소년)',
    dayOfWeek TINYINT(1) NOT NULL COMMENT '요일 (1: 주중, 2: 주말)',
    timeOfDay TINYINT(1) NOT NULL COMMENT '시간대 (1: 조조 및 심야, 2: 일반)',
    seatPrice INT(7) NOT NULL COMMENT '좌석 가격'
) COMMENT='좌석 가격 정보를 관리하는 테이블';


-- 8. 예매(reservation) 테이블 생성
CREATE TABLE reservation (
    reservationIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '예매 고유 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 ID',
    theaterIdx BIGINT COMMENT '극장 ID',
    screenIdx BIGINT NOT NULL COMMENT '상영관 ID',
    timetableIdx BIGINT NOT NULL COMMENT '상영 시간표 ID',
    reservationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '예매일',
    reservationStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '예매 상태 (0: 완료, 1: 취소)',
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE,
    FOREIGN KEY (theaterIdx) REFERENCES theater(theaterIdx) ON DELETE CASCADE,
    FOREIGN KEY (screenIdx) REFERENCES screen(screenIdx) ON DELETE CASCADE,
	FOREIGN KEY (timetableIdx) REFERENCES timetable(timetableIdx) ON DELETE CASCADE
) COMMENT='영화 예매 정보를 저장하는 테이블';


-- 9. 예매-좌석 매핑(reservationSeatMapping) 테이블 생성
CREATE TABLE reservationSeatMapping (
    reservationSeatIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '매핑 고유 ID',
    reservationIdx BIGINT NOT NULL COMMENT '예매 ID',
    seatIdx BIGINT NOT NULL COMMENT '좌석 ID',
    priceIdx BIGINT NOT NULL  COMMENT '가격 설정 고유 ID',
    FOREIGN KEY (reservationIdx) REFERENCES reservation(reservationIdx) ON DELETE CASCADE,
    FOREIGN KEY (seatIdx) REFERENCES seat(seatIdx) ON DELETE CASCADE,
    FOREIGN KEY (priceIdx) REFERENCES price(priceIdx) ON DELETE CASCADE
) COMMENT='예매-좌석 매핑 정보를 저장하는 테이블';


-- 10. 쿠폰(coupon) 테이블 생성
CREATE TABLE coupon (
    couponIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '쿠폰 고유 ID',
    couponName VARCHAR(50) NOT NULL COMMENT '쿠폰 이름',
    couponInfo TEXT COMMENT '쿠폰 설명',
    couponType TINYINT(1) NOT NULL COMMENT '할인 유형 (1: 금액, 2: 추가 제공)',
    couponValue INT COMMENT '할인 값 (금액일 경우 할인 금액, 추가 제공일 경우 NULL)',
    couponRegDate DATETIME COMMENT '쿠폰 사용 시작일',
    couponExpDate DATETIME COMMENT '쿠폰 만료일',
    couponStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '쿠폰 상태 (0: 활성, 1: 만료)'
) COMMENT='쿠폰 정보를 저장하는 테이블';


-- 11. 쿠폰-사용자 매핑(couponUserMapping) 테이블 생성
CREATE TABLE couponUserMapping (
    couponUserIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '매핑 고유 ID',
    couponIdx BIGINT NOT NULL COMMENT '쿠폰 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 ID',
    couponUserStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '사용 여부 (0: 미사용, 1: 사용)',
    couponUserDate DATETIME DEFAULT NULL COMMENT '사용일 (NULL이면 미사용 상태)',
    FOREIGN KEY (couponIdx) REFERENCES coupon(couponIdx) ON DELETE CASCADE,
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE
) COMMENT='사용자별 쿠폰 이력을 저장하는 테이블';


-- 12. 상품(product) 테이블 생성
CREATE TABLE product (
    productIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '상품 고유 ID',
    productCategory TINYINT(1) NOT NULL COMMENT '상품 카테고리 (1: 굿즈, 2: 스낵)',
    productName VARCHAR(50) NOT NULL COMMENT '상품명',
    productInfo TEXT COMMENT '상품 설명',
    productPrice INT(7) NOT NULL COMMENT '상품 가격',
    productStock INT(5) COMMENT '상품 재고 수량',
    productImg VARCHAR(255) COMMENT '상품 이미지 파일명',
    productRegDate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '상품 등록일',
    productStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '상품 상태 (0: 판매 중, 1: 품절, 2: 종료)'
) COMMENT='상품 정보를 저장하는 테이블';


-- 13. 장바구니(cart) 테이블 생성
CREATE TABLE cart (
    cartIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '장바구니 고유 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 고유 ID',
    productIdx BIGINT NOT NULL COMMENT '상품 고유 ID',
    quantity INT COMMENT '상품 수량',
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE,
    FOREIGN KEY (productIdx) REFERENCES product(productIdx) ON DELETE CASCADE
) COMMENT='사용자별 장바구니 정보를 저장하는 테이블';


-- 14. 결제 정보를 저장하는 테이블
CREATE TABLE payment (
     paymentIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '결제 고유 ID',
     userIdx BIGINT NOT NULL COMMENT '사용자 고유 ID',
     paymentType TINYINT(1) NOT NULL COMMENT '결제 종류 (1: 영화 예매, 2: 상품 구매)',
     reservationIdx BIGINT COMMENT '예매 고유 ID (영화 결제인 경우에만 사용)',
     productIdx BIGINT COMMENT '상품 고유 ID (상품 결제인 경우에만 사용)',
     paymentMethod VARCHAR(10) NOT NULL COMMENT '결제 방식 (CARD, NAVER, KAKAO, TOSS 등)',
     paymentTotal INT(7) NOT NULL COMMENT '결제 금액 (할인 전 금액)',
     paymentDiscount INT(7) COMMENT '포인트, 쿠폰 등 할인 금액',
     paymentFinal INT(7) NOT NULL COMMENT '실제 결제 금액',
     paymentTransactionId VARCHAR(50) COMMENT '결제 API에서 제공하는 고유 거래 ID',
     paymentApprovalNumber VARCHAR(30) COMMENT '결제 승인 번호 (결제 성공 시 API가 반환하는 승인 번호)',
     paymentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '결제일',
     paymentStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '결제 상태 (0: 완료, 1: 대기, 2: 취소)',
     FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE,
     FOREIGN KEY (reservationIdx) REFERENCES reservation(reservationIdx) ON DELETE CASCADE,
     FOREIGN KEY (productIdx) REFERENCES product(productIdx) ON DELETE CASCADE
) COMMENT='결제 정보를 저장하는 테이블';


-- 15. 포인트(point) 테이블 생성
CREATE TABLE point (
    pointIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '포인트 고유 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 고유 ID',
    pointType TINYINT NOT NULL COMMENT '포인트 종류 (0: 적립, 1: 사용, 만료)',
    pointSource VARCHAR(255) COMMENT '포인트 출처',
    pointValue INT NOT NULL COMMENT '변동된 포인트 값',
    pointDate DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '포인트 변동 일시',
    pointStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '포인트 상태 (0: 정상, 1: 취소)',
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE
) COMMENT='사용자의 포인트 변동 내역을 저장하는 테이블';


-- 16. 관람한 영화 목록(watchedMovie) 테이블 생성
CREATE TABLE watchedMovie (
    watchedIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '관람한 영화 목록 고유 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 ID',
    movieIdx BIGINT NOT NULL COMMENT '영화 ID',
    reservationIdx BIGINT NOT NULL COMMENT '예매 ID',
    screenIdx BIGINT NOT NULL COMMENT '상영관 ID',
    watchedDate DATETIME NOT NULL COMMENT '영화 시청 날짜',
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE,
    FOREIGN KEY (movieIdx) REFERENCES movie(movieIdx) ON DELETE CASCADE,
    FOREIGN KEY (reservationIdx) REFERENCES reservation(reservationIdx) ON DELETE CASCADE,
    FOREIGN KEY (screenIdx) REFERENCES screen(screenIdx) ON DELETE CASCADE
) COMMENT='사용자가 관람한 영화의 정보를 저장하는 테이블';


-- 17. 리뷰(review) 테이블 생성
CREATE TABLE review (
    reviewIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '리뷰 고유 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 ID',
    movieIdx BIGINT NOT NULL COMMENT '영화 ID',
    reviewRating INT NOT NULL COMMENT '영화 평점 (1~10 정수)',
    reviewContent TEXT NOT NULL COMMENT '리뷰 내용',
    reviewDate DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '리뷰 작성일',
    reviewStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '리뷰 상태 (0: 게시 중, 1: 삭제)',
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE,
    FOREIGN KEY (movieIdx) REFERENCES movie(movieIdx) ON DELETE CASCADE
) COMMENT='영화에 대한 리뷰 정보를 저장하는 테이블';


-- 18. 선호 영화 목록(favoriteMovie) 테이블 생성
CREATE TABLE favoriteMovie (
    favoriteIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '선호 영화 고유 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 고유 ID',
    movieIdx BIGINT NOT NULL COMMENT '영화 고유 ID',
    addedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '선호 영화 추가 날짜',
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE,
    FOREIGN KEY (movieIdx) REFERENCES movie(movieIdx) ON DELETE CASCADE
) COMMENT='사용자의 선호 영화 목록을 저장하는 테이블';


-- 19. 선호 극장 목록(favoriteTheater) 테이블 생성
CREATE TABLE favoriteTheater (
    favoriteIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '선호 극장 고유 ID',
    userIdx BIGINT NOT NULL COMMENT '사용자 고유 ID',
    theaterIdx BIGINT NOT NULL COMMENT '극장 고유 ID',
    addedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '선호 극장 추가 날짜',
    FOREIGN KEY (userIdx) REFERENCES user(userIdx) ON DELETE CASCADE,
    FOREIGN KEY (theaterIdx) REFERENCES theater(theaterIdx) ON DELETE CASCADE
) COMMENT='사용자의 선호 극장 목록을 저장하는 테이블';


-- 20. 게시판(board) 테이블 생성
CREATE TABLE board (
   boardIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '게시판 고유 ID',
   adminIdx BIGINT NOT NULL COMMENT '관리자 ID',
   theaterIdx BIGINT COMMENT '극장 고유 ID (전체 극장 대상인 경우 NULL)',
   boardType VARCHAR(30) NOT NULL COMMENT '게시판 종류 (NOTICE: 공지사항, EVENT: 이벤트)',
   boardTitle VARCHAR(70) NOT NULL COMMENT '게시판 제목',
   boardContent TEXT NOT NULL COMMENT '게시판 내용 (이벤트 내용은 이미지 태그로 입력)',
   boardRegDate DATETIME NOT NULL COMMENT '게시 시작일',
   boardExpDate DATETIME COMMENT '게시 종료일 (NULL 가능)',
   boardStatus TINYINT(1) NOT NULL DEFAULT 0 COMMENT '게시 상태 (0: 게시 중, 1: 게시 예정, 2: 게시 종료)',
   FOREIGN KEY (adminIdx) REFERENCES admin(adminIdx) ON DELETE CASCADE,
   FOREIGN KEY (theaterIdx) REFERENCES theater(theaterIdx) ON DELETE CASCADE
) COMMENT='게시판 정보를 저장하는 테이블';


-- 22. 로그(log) 테이블 생성
CREATE TABLE log (
    logIdx BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '로그 고유 ID',
    logType TINYINT(1) NOT NULL COMMENT '로그 유형 (0: 관리자, 1: 사용자)',
    adminIdx BIGINT COMMENT '관리자 ID (관리자 활동의 경우 연결, 사용자 활동의 경우 NULL)',
    logTarget VARCHAR(50) NOT NULL COMMENT '대상 (userIdx, adminIdx 등)',
    logInfo VARCHAR(100) NOT NULL COMMENT '로그 설명 (활동 내역, 변경 사항)',
    logPreValue VARCHAR(255) COMMENT '이전 값 (생성인 경우 NULL)',
    logCurValue VARCHAR(255) COMMENT '현재 값 (삭제인 경우 NULL)',
    logDate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '발생 시각',
    FOREIGN KEY (adminIdx) REFERENCES admin(adminIdx) ON DELETE SET NULL
) COMMENT='관리자 및 사용자 활동 로그를 기록하는 테이블';

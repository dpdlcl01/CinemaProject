
-- 3. 극장(theater) 테이블 초기 데이터 삽입
INSERT INTO theater (
    theaterName,
    theaterRegion,
    theaterAddress,
    theaterInfo,
    theaterImageUrl,
    theaterScreenCount,
    theaterRegDate,
    theaterStatus
) VALUES
-- 서울 지역 극장
('강남', '서울', '서울특별시 서초구 서초대로 77길 3 (서초동) 아라타워 8층', '강남역 9번출구와 연결된 편리한 접근성과 위치! 강남을 한 눈에 볼 수 있는 최상의 VIEW', NULL, 5, '2023-01-01', 0),
('센트럴', '서울', '서울특별시 서초구 신반포로 176, (반포동) 센트럴시티 빌딩 지하1층', '편안하게 즐기는 부티크 호텔 감성의 아늑한 라운지와 상영관', NULL, 4, '2023-01-01', 0),
('코엑스', '서울', '서울특별시 강남구 봉은사로524, (삼성동) 코엑스몰 지하2층', '명실상부 국내 최대 영화관, ALL IN MEGA! 메가박스의 모든 특별관이 이곳에', NULL, 5, '2023-01-01', 0),
('홍대', '서울', '서울특별시 마포구 양화로 147, (동교동) 아일렉스 7층', '홍대입구역 도보 1분, 20대들의 놀이터! 전 관 레이저 영사기로 선명하게', NULL, 3, '2023-01-01', 0),

-- 경기 지역 극장
('고양스타필드', '경기', '경기도 고양시 덕양구 고양대로 1955 (동산동) 스타필드고양 4층', '스타필드고양 필수 코스! 사운드 특별관 DOLBY ATMOS관, 가족을 위한 KIDS관', NULL, 5, '2023-01-02', 0),
('수원스타필드', '경기', '경기도 수원시 장안구 정자동 111-14', 'Dolby 사운드의 생생한 감동이 영화의 감동으로, 사운드 특별관 DOLBY ATMOS관', NULL, 4, '2023-01-02', 0),
('안성스타필드', '경기', '경기도 안성시 공도읍 서동대로 3930-39, (진사리) 스타필드 안성 3층', '완벽한 영화 관람을 완성하는 하이엔드 DOLBY CINEMA', NULL, 3, '2023-01-02', 0),

-- 인천 지역 극장
('송도', '인천', '인천광역시 연수구 송도과학로 16번길 33-4, (송도동) 트리플 스트리트 D동 2층', '인천 유일, 완벽한 영화 관람을 완성하는 하이엔드 DOLBY CINEMA', NULL, 4, '2023-01-03', 0),
('인천논현', '인천', '인천광역시 남동구 논현동 논고개로 61 라피에스타', 'TRINNOV SOUND SYSTEM으로 압도하는 사운드', NULL, 3, '2023-01-03', 0),

-- 대전/충청/세종 지역 극장
('대전중앙로', '대전/충청/세종', '대전광역시 중구 중앙로 126, (대흥동) 4층', '대전 빵세권의 중심! 대전중앙로역 도보 2분, 성심당 도보 5분', NULL, 4, '2023-01-04', 0),
('세종나성', '대전/충청/세종', '세종특별자치시 나성로 38, (나성동) 세종 가로수길 건물 5층 A동', '나성동 번화가, BRT 라인! 여유로운 무료 주차에 전 관 위생적인 가죽시트까지', NULL, 3, '2023-01-04', 0),

-- 부산/대구/경상 지역 극장
('대구신세계', '부산/대구/경상', '대구광역시 동구 동부로 149, (신천동) 신세계백화점 8층', '대구경북 유일, 완벽한 영화 관람을 완성하는 하이엔드 DOLBY CINEMA', NULL, 5, '2023-01-05', 0),
('해운대', '부산/대구/경상', '부산광역시 해운대구 해운대로 813 (좌동, NC백화점 8층) 메가박스 해운대장산지점', '영화의 감동을 넘어 편안함의 감동까지, 전 관 리클라이너로 프리미엄하게', NULL, 4, '2023-01-05', 0),

-- 광주/전라 지역 극장
('광주하남', '광주/전라', '광주광역시 광산구 우산동 풍영철길로 15 콜럼버스월드', '영화의 감동을 넘어 편안함의 감동까지, 전 좌석 리클라이너로 프리미엄하게', NULL, 4, '2023-01-06', 0),
('전주혁신', '광주/전라', '전북특별자치도 전주시 덕진구 기지로 77 (장동, 전북혁신도시 디엠시티) 2층', '사운드 특별관 DOLBY ATMOS관, 전 관 레이저 영사기로 선명하게', NULL, 3, '2023-01-06', 0),

-- 강원 지역 극장
('원주혁신', '강원', '강원특별자치도 원주시 황금로 2, 센트럴파크 7층 / 강원특별자치도 원주시 양지로 80, (반곡동, 센트럴파크 7층)', 'Dolby 사운드의 생생한 감동과 전 좌석 리클라이너로 프리미엄하게', NULL, 3, '2023-01-07', 0);


-- 4. 상영관(screen) 테이블 초기 데이터 삽입
INSERT INTO screen (
    theaterIdx,
    screenName,
    screenType,
    screenSeatCount,
    screenStatus
) VALUES
-- 강남
(1, '1관', 'COMFORT', 20, 0),
(1, '2관', 'VIP', 20, 0),
(1, '3관', 'DOLBY', 20, 0),
(1, '4관', '4DX', 24, 0),
(1, '5관', 'IMAX', 24, 0),

-- 센트럴
(2, '1관', 'COMFORT', 20, 0),
(2, '2관', 'VIP', 20, 0),
(2, '3관', 'DOLBY', 20, 0),
(2, '4관', '4DX', 24, 0),

-- 코엑스
(3, '1관', 'COMFORT', 20, 0),
(3, '2관', 'VIP', 20, 0),
(3, '3관', 'DOLBY', 20, 0),
(3, '4관', '4DX', 24, 0),
(3, '5관', 'IMAX', 24, 0),

-- 홍대
(4, '1관', 'COMFORT', 20, 0),
(4, '2관', 'VIP', 20, 0),
(4, '3관', 'DOLBY', 20, 0),
(4, '4관', '4DX', 24, 0),

-- 고양스타필드
(5, '1관', 'COMFORT', 20, 0),
(5, '2관', 'VIP', 20, 0),
(5, '3관', 'DOLBY', 20, 0),
(5, '4관', '4DX', 24, 0),

-- 수원스타필드
(6, '1관', 'COMFORT', 20, 0),
(6, '2관', 'VIP', 20, 0),
(6, '3관', 'DOLBY', 20, 0),
(6, '4관', '4DX', 24, 0),
(6, '5관', 'IMAX', 24, 0),

-- 안성스타필드
(7, '1관', 'COMFORT', 20, 0),
(7, '2관', 'VIP', 20, 0),
(7, '3관', 'DOLBY', 20, 0),
(7, '4관', '4DX', 24, 0),

-- 송도
(8, '1관', 'COMFORT', 20, 0),
(8, '2관', 'VIP', 20, 0),
(8, '3관', 'DOLBY', 20, 0),
(8, '4관', '4DX', 24, 0),
(8, '5관', 'IMAX', 24, 0),

-- 인천논현
(9, '1관', 'COMFORT', 20, 0),
(9, '2관', 'VIP', 20, 0),
(9, '3관', 'DOLBY', 20, 0),

-- 대전중앙로
(10, '1관', 'COMFORT', 20, 0),
(10, '2관', 'VIP', 20, 0),
(10, '3관', 'DOLBY', 20, 0),
(10, '4관', '4DX', 24, 0),
(10, '5관', 'IMAX', 24, 0),

-- 세종나성
(11, '1관', 'COMFORT', 20, 0),
(11, '2관', 'VIP', 20, 0),
(11, '3관', 'DOLBY', 20, 0),

-- 대구신세계
(12, '1관', 'COMFORT', 20, 0),
(12, '2관', 'VIP', 20, 0),
(12, '3관', 'DOLBY', 20, 0),
(12, '4관', '4DX', 24, 0),

-- 해운대
(13, '1관', 'COMFORT', 20, 0),
(13, '2관', 'VIP', 20, 0),
(13, '3관', 'DOLBY', 20, 0),
(13, '4관', '4DX', 24, 0),
(13, '5관', 'IMAX', 24, 0),

-- 광주하남
(14, '1관', 'COMFORT', 20, 0),
(14, '2관', 'VIP', 20, 0),
(14, '3관', 'DOLBY', 20, 0),
(14, '4관', '4DX', 24, 0),
(14, '5관', 'IMAX', 24, 0),

-- 전주혁신
(15, '1관', 'COMFORT', 20, 0),
(15, '2관', 'VIP', 20, 0),
(15, '3관', 'DOLBY', 20, 0),

-- 원주혁신
(16, '1관', 'COMFORT', 20, 0),
(16, '2관', 'VIP', 20, 0),
(16, '3관', 'DOLBY', 20, 0);



-- 7. 좌석 가격 데이터 입력 
INSERT INTO price (screenType, ageGroup, dayOfWeek, timeOfDay, seatPrice)
VALUES
(1, 1, 1, 1, 12000), -- COMFORT, 성인, 주중, 조조 및 심야
(1, 1, 1, 2, 16000), -- COMFORT, 성인, 주중, 일반
(1, 1, 2, 1, 13000), -- COMFORT, 성인, 주말, 조조 및 심야
(1, 1, 2, 2, 17000), -- COMFORT, 성인, 주말, 일반
(1, 2, 1, 1, 10000),  -- COMFORT, 청소년, 주중, 조조 및 심야
(1, 2, 1, 2, 14000), -- COMFORT, 청소년, 주중, 일반
(1, 2, 2, 1, 11000), -- COMFORT, 청소년, 주말, 조조 및 심야
(1, 2, 2, 2, 15000), -- COMFORT, 청소년, 주말, 일반

(2, 1, 1, 1, 13000), -- VIP, 성인, 주중, 조조 및 심야
(2, 1, 1, 2, 17000), -- VIP, 성인, 주중, 일반
(2, 1, 2, 1, 14000), -- VIP, 성인, 주말, 조조 및 심야
(2, 1, 2, 2, 18000), -- VIP, 성인, 주말, 일반
(2, 2, 1, 1, 11000), -- VIP, 청소년, 주중, 조조 및 심야
(2, 2, 1, 2, 15000), -- VIP, 청소년, 주중, 일반
(2, 2, 2, 1, 12000), -- VIP, 청소년, 주말, 조조 및 심야
(2, 2, 2, 2, 16000), -- VIP, 청소년, 주말, 일반

(3, 1, 1, 1, 13000), -- DOLBY, 성인, 주중, 조조 및 심야
(3, 1, 1, 2, 17000), -- DOLBY, 성인, 주중, 일반
(3, 1, 2, 1, 14000), -- DOLBY, 성인, 주말, 조조 및 심야
(3, 1, 2, 2, 18000), -- DOLBY, 성인, 주말, 일반
(3, 2, 1, 1, 11000), -- DOLBY, 청소년, 주중, 조조 및 심야
(3, 2, 1, 2, 15000), -- DOLBY, 청소년, 주중, 일반
(3, 2, 2, 1, 12000), -- DOLBY, 청소년, 주말, 조조 및 심야
(3, 2, 2, 2, 16000), -- DOLBY, 청소년, 주말, 일반

(4, 1, 1, 1, 15000), -- 4DX, 성인, 주중, 조조 및 심야
(4, 1, 1, 2, 20000), -- 4DX, 성인, 주중, 일반
(4, 1, 2, 1, 17000), -- 4DX, 성인, 주말, 조조 및 심야
(4, 1, 2, 2, 22000), -- 4DX, 성인, 주말, 일반
(4, 2, 1, 1, 13000), -- 4DX, 청소년, 주중, 조조 및 심야
(4, 2, 1, 2, 18000), -- 4DX, 청소년, 주중, 일반
(4, 2, 2, 1, 15000), -- 4DX, 청소년, 주말, 조조 및 심야
(4, 2, 2, 2, 20000), -- 4DX, 청소년, 주말, 일반

(5, 1, 1, 1, 15000), -- IMAX, 성인, 주중, 조조 및 심야
(5, 1, 1, 2, 20000), -- IMAX, 성인, 주중, 일반
(5, 1, 2, 1, 17000), -- IMAX, 성인, 주말, 조조 및 심야
(5, 1, 2, 2, 22000), -- IMAX, 성인, 주말, 일반
(5, 2, 1, 1, 13000), -- IMAX, 청소년, 주중, 조조 및 심야
(5, 2, 1, 2, 18000), -- IMAX, 청소년, 주중, 일반
(5, 2, 2, 1, 15000), -- IMAX, 청소년, 주말, 조조 및 심야
(5, 2, 2, 2, 20000); -- IMAX, 청소년, 주말, 일반


-- 12. 상품 테이블 데이터 입력
INSERT INTO product (productCategory, productName, productInfo, productPrice, productStock, productRegDate, productStatus, productImg) VALUES
(1, '귀여운 에코백', '남자가 들면 게이같아 보이는 백', 999000, 50, '2025-01-17 23:39:53', 0, 'ecoBag.png'),
(1, '귀여운 키링', '에어팟에 달면 졸귀일듯', 1200000, 20, '2025-01-17 23:39:53', 0, 'keyRing.png'),
(1, '귀여운 액자', '실용성 zero 액자', 59000, 10, '2025-01-17 23:39:53', 0, 'Frame.png'),
(1, '귀여운 컵', '귀여운 그림이 들어간 머그컵', 3000, 50, '2025-01-17 23:39:53', 0, 'cup.png'),
(2, '러브콤보', '사랑을 키워주는 콤보세트', 150000, 30, '2025-01-17 23:39:53', 0, 'loveSet.png'),
(2, '더블콤보', '둘이 먹다 하나 죽어도 모르는 콤보세트', 89000, 75, '2025-01-17 23:39:53', 0, 'doubleSet.png'),
(2, '오징어튀김', '오징어를 튀긴 것', 3000, 50, '2025-01-17 23:39:53', 0, 'frySquid.png'),
(2, '황태과자', '생선으로 만든 과자', 4000, 50, '2025-01-17 23:39:53', 0, 'fishSnack.png');

-- 굿즈 (productCategory = 1)
INSERT INTO product (productCategory, productName, productInfo, productPrice, productStock, productImg, productRegDate, productStatus)
VALUES
(1, '아바타 영화 오리지널 포스터', '아바타 영화의 한정판 오리지널 포스터입니다.', 10000, 100, 'avatar_poster.jpg', '2024-01-05 10:00:00', 0),
(1, '해리포터 공식 마법 지팡이', '해리포터 팬들을 위한 공식 마법 지팡이 굿즈.', 30000, 50, 'harry_wand.jpg', '2024-01-08 14:00:00', 0),
(1, '마블 캐릭터 키체인 세트', '마블 영화의 인기 캐릭터로 구성된 키체인 세트.', 15000, 200, 'marvel_keychain.jpg', '2024-01-10 09:30:00', 0),
(1, '겨울왕국 한정판 노트', '겨울왕국 테마의 예쁜 노트입니다.', 12000, 150, 'frozen_notebook.jpg', '2024-01-12 11:00:00', 0),
(1, '쥬라기 공원 공룡 피규어', '쥬라기 공원 영화의 공룡 피규어 한정판.', 25000, 80, 'jurassic_figure.jpg', '2024-01-15 15:00:00', 0),
(1, '스타워즈 한정판 텀블러', '스타워즈 테마의 한정판 텀블러입니다.', 20000, 100, 'starwars_tumbler.jpg', '2024-01-18 12:00:00', 0),
(1, '디즈니 캐릭터 배지 세트', '디즈니 인기 캐릭터가 포함된 배지 세트.', 15000, 120, 'disney_badge.jpg', '2024-01-20 13:00:00', 0),
(1, '반지의 제왕 오리지널 포스터', '반지의 제왕 시리즈의 한정판 포스터입니다.', 10000, 70, 'lotr_poster.jpg', '2024-01-22 16:00:00', 0),
(1, '미니언즈 캐릭터 머그컵', '미니언즈 캐릭터가 프린트된 머그컵.', 18000, 100, 'minions_mug.jpg', '2024-01-25 10:30:00', 0),
(1, '배트맨 한정판 노트', '배트맨 테마로 제작된 한정판 노트입니다.', 12000, 60, 'batman_notebook.jpg', '2024-01-28 14:30:00', 0);

-- 스낵 (productCategory = 2)
INSERT INTO product (productCategory, productName, productInfo, productPrice, productStock, productImg, productRegDate, productStatus)
VALUES
(2, '달콤한 카라멜 팝콘 (중)', '중간 사이즈의 달콤한 카라멜 팝콘입니다.', 6000, 500, 'caramel_popcorn.jpg', '2024-01-05 10:00:00', 0),
(2, '고소한 버터 팝콘 (대)', '대형 사이즈의 고소한 버터 팝콘입니다.', 8000, 500, 'butter_popcorn.jpg', '2024-01-08 14:00:00', 0),
(2, '코카콜라 음료 (중)', '중간 사이즈의 시원한 코카콜라입니다.', 3000, 500, 'coke_medium.jpg', '2024-01-10 09:30:00', 0),
(2, '스프라이트 음료 (대)', '대형 사이즈의 상쾌한 스프라이트입니다.', 4000, 500, 'sprite_large.jpg', '2024-01-12 11:00:00', 0),
(2, '치즈 소스와 나쵸 세트', '따뜻한 치즈 소스와 함께 제공되는 나쵸.', 7000, 300, 'nacho_set.jpg', '2024-01-15 15:00:00', 0),
(2, '팝콘 (중) + 콜라 (중)', '팝콘과 콜라가 포함된 콤보 세트.', 9000, 300, 'combo1.jpg', '2024-01-18 12:00:00', 0),
(2, '팝콘 (대) + 콜라 (대)', '팝콘과 콜라가 포함된 대형 콤보 세트.', 12000, 300, 'combo2.jpg', '2024-01-20 13:00:00', 0),
(2, '바닐라 아이스크림', '시원하고 부드러운 바닐라 아이스크림.', 5000, 300, 'ice_cream.jpg', '2024-01-22 16:00:00', 0),
(2, '핫도그 (치즈 추가 가능)', '치즈를 추가할 수 있는 따뜻한 핫도그.', 4500, 300, 'hot_dog.jpg', '2024-01-25 10:30:00', 0),
(2, '프레첼 (소금, 치즈 소스)', '소금과 치즈 소스를 곁들인 프레첼.', 5500, 300, 'pretzel.jpg', '2024-01-28 14:30:00', 0);


-- 21. 관리자 테이블 데이터 삽입
INSERT INTO admin (adminId, adminPassword, adminLevel, adminStatus)
VALUES
-- SUPER 관리자는 1명
('superadmin', 'super_secure_password', 'SUPER', 0),

-- MANAGER 관리자는 프로젝트 규모에 맞춰 5명 생성 (모두 활성 상태)
('manager1', 'manager_secure_password1', 'MANAGER', 0),
('manager2', 'manager_secure_password2', 'MANAGER', 0),
('manager3', 'manager_secure_password3', 'MANAGER', 0),
('manager4', 'manager_secure_password4', 'MANAGER', 0),
('manager5', 'manager_secure_password5', 'MANAGER', 0),

-- 활성화되지 않은 MANAGER 1명
('inactive_manager', 'inactive_password', 'MANAGER', 1);


-- 20. 게시판 테이블 데이터 삽입
INSERT INTO board (adminIdx, theaterIdx, boardType, boardTitle, boardContent, boardRegDate, boardExpDate, boardStatus)
VALUES
-- 공지사항 게시글: 전체 극장 대상
(2, NULL, 'NOTICE', '2025년 2월 상영작 안내', '2025년 2월의 최신 상영작 안내입니다. 영화 시간표를 확인해주세요.', '2025-01-15 10:00:00', NULL, 0),
(3, NULL, 'NOTICE', '2025년 설날 연휴 극장 운영 안내', '설날 연휴 기간 동안 모든 극장은 정상 운영됩니다.', '2025-01-18 12:00:00', '2025-02-01 23:59:59', 0),
(4, NULL, 'NOTICE', '좌석 업그레이드 안내', '전 상영관 리클라이너 좌석 업그레이드가 완료되었습니다.', '2025-01-10 09:00:00', NULL, 0),

-- 이벤트 게시글: 특정 극장 대상
(5, 1, 'EVENT', '강남 특별관 할인 이벤트', '강남 극장에서 모든 조조 상영 티켓 30% 할인 이벤트 진행 중!', '2025-01-12 08:00:00', '2025-01-31 23:59:59', 0),
(6, 5, 'EVENT', '고양스타필드 가족 패키지', '고양스타필드 극장에서 가족 영화 패키지를 구매하면 팝콘 세트를 무료로 제공합니다.', '2025-01-10 10:30:00', '2025-01-31 23:59:59', 0),
(7, 12, 'EVENT', '부산 IMAX 관람 이벤트', '부산 IMAX 특별 상영을 예매하신 분들께 추첨을 통해 영화 굿즈를 드립니다.', '2025-01-20 15:00:00', '2025-02-15 23:59:59', 0),

-- 공지사항 게시글: 곧 게시 예정
(3, NULL, 'NOTICE', '2025년 3월 상영작 사전 안내', '3월의 상영작 정보를 미리 확인하세요. 곧 게시됩니다.', '2025-02-01 00:00:00', '2025-03-01 23:59:59', 1),

-- 이벤트 게시글: 게시 종료된 상태
(2, 8, 'EVENT', '인천논현 신년 이벤트', '인천논현 극장에서 신년을 맞아 무료 시사회 이벤트가 진행되었습니다.', '2025-01-01 08:00:00', '2025-01-15 23:59:59', 2),

-- 추가 공지사항 데이터 삽입
(2, NULL, 'NOTICE', '2025년 상반기 개봉 예정작 안내', '2025년 상반기 개봉 예정작을 미리 만나보세요.', '2025-01-01 10:00:00', NULL, 0),
(3, NULL, 'NOTICE', '2025년 영화제 관련 안내', '국내 최대 영화제가 열립니다. 자세한 내용을 확인하세요.', '2025-01-15 09:30:00', '2025-02-20 23:59:59', 0),
(4, 1, 'NOTICE', '강남 특별 상영회 공지', '강남 극장에서 감독과의 대화가 포함된 특별 상영회가 열립니다.', '2025-01-20 14:00:00', '2025-02-05 23:59:59', 0),
(5, 5, 'NOTICE', '고양스타필드 리클라이너 상영관 안내', '고양스타필드의 모든 상영관이 리클라이너로 업그레이드되었습니다.', '2025-01-10 11:00:00', NULL, 0),
(6, 12, 'NOTICE', '부산 IMAX 특별 할인 안내', '부산 IMAX 관람 시 20% 할인을 제공합니다.', '2025-01-18 10:00:00', '2025-02-10 23:59:59', 0),
(2, 8, 'NOTICE', '인천논현 무료 시사회', '인천논현 극장에서 무료 시사회가 열립니다.', '2025-01-10 13:00:00', '2025-01-30 23:59:59', 0),
(3, NULL, 'NOTICE', '모든 극장 안전 점검 완료 안내', '전국 모든 극장의 시설 안전 점검이 완료되었습니다.', '2025-01-05 08:00:00', NULL, 0),
(4, 3, 'NOTICE', '코엑스 특별 이벤트 안내', '코엑스 극장에서 참여할 수 있는 특별 이벤트가 준비되어 있습니다.', '2025-01-12 09:00:00', '2025-02-05 23:59:59', 0),
(5, 7, 'NOTICE', '송도 극장 추가 상영관 안내', '송도 극장에 새로운 상영관이 추가되었습니다.', '2025-01-08 09:00:00', NULL, 0),
(6, NULL, 'NOTICE', '겨울철 난방 시설 점검 완료 안내', '모든 극장의 난방 시설이 점검되었습니다.', '2025-01-05 12:00:00', NULL, 0),
(2, NULL, 'NOTICE', '2025년 설 연휴 특별 프로그램', '설 연휴 기간 특별 프로그램이 진행됩니다.', '2025-01-15 09:30:00', '2025-02-01 23:59:59', 0),
(3, NULL, 'NOTICE', '2025년 회원 혜택 개편 안내', '새로운 회원 등급 및 혜택이 적용됩니다.', '2025-01-10 11:30:00', '2025-01-31 23:59:59', 0),
(4, NULL, 'NOTICE', '새로운 영화 할인 쿠폰 제공', '회원들에게 영화 할인 쿠폰이 제공됩니다.', '2025-01-12 09:30:00', '2025-01-31 23:59:59', 0),
(5, 10, 'NOTICE', '대구신세계 영화제 개최 안내', '대구신세계에서 영화제가 열립니다.', '2025-01-10 14:30:00', '2025-01-30 23:59:59', 0),
(6, NULL, 'NOTICE', '모든 극장 Wi-Fi 업그레이드 안내', '전국 모든 극장의 Wi-Fi가 업그레이드되었습니다.', '2025-01-15 11:00:00', NULL, 0),
(2, NULL, 'NOTICE', '회원 가입 이벤트 진행 중', '지금 회원 가입하면 추가 포인트를 받을 수 있습니다.', '2025-01-05 09:00:00', '2025-01-31 23:59:59', 0),
(3, NULL, 'NOTICE', '겨울철 감기 예방 안내', '영화관 방문 시 감기 예방을 위한 안내 사항입니다.', '2025-01-10 10:00:00', NULL, 0),
(4, NULL, 'NOTICE', '봄 시즌 추천 영화 목록', '봄 시즌에 추천하는 영화 목록을 확인하세요.', '2025-01-20 10:30:00', NULL, 0),
(5, 6, 'NOTICE', '안성스타필드 신규 상영관 안내', '안성스타필드에 신규 상영관이 추가되었습니다.', '2025-01-10 12:00:00', '2025-01-31 23:59:59', 0),

-- 추가 이벤트 데이터 삽입
(6, 2, 'EVENT', '강남 VIP 상영관 할인 이벤트', '강남 VIP 상영관에서 할인 이벤트를 제공합니다.', '2025-01-08 12:00:00', '2025-02-15 23:59:59', 0),
(2, 3, 'EVENT', '코엑스 IMAX 추첨 이벤트', '코엑스 IMAX에서 추첨을 통해 경품을 드립니다.', '2025-01-12 10:00:00', '2025-02-10 23:59:59', 0),
(3, NULL, 'EVENT', '전국 극장 신년 할인 이벤트', '전국 모든 극장에서 신년 특별 할인이 진행됩니다.', '2025-01-01 09:00:00', '2025-01-31 23:59:59', 0),
(4, 10, 'EVENT', '대구신세계 조조 할인 이벤트', '대구신세계에서 조조 상영 시 특별 할인을 제공합니다.', '2025-01-10 10:00:00', '2025-02-01 23:59:59', 0),
(5, 7, 'EVENT', '송도 극장 리클라이너 체험 이벤트', '송도 극장에서 리클라이너 좌석 체험 이벤트가 진행됩니다.', '2025-01-15 11:00:00', '2025-02-15 23:59:59', 0),
(6, 4, 'EVENT', '홍대 Dolby 특별 이벤트', '홍대 Dolby 상영관에서 특별 상영이 진행됩니다.', '2025-01-20 14:00:00', '2025-02-15 23:59:59', 0),
(2, 9, 'EVENT', '인천논현 설날 이벤트', '인천논현에서 설날 맞이 특별 프로그램이 진행됩니다.', '2025-01-12 13:00:00', '2025-02-10 23:59:59', 0),
(3, 11, 'EVENT', '전주혁신 상영관 새해 이벤트', '전주혁신에서 새해 맞이 무료 시사회가 열립니다.', '2025-01-10 09:30:00', '2025-01-31 23:59:59', 0),
(4, NULL, 'EVENT', '회원 전용 무료 영화 상영 이벤트', '회원 전용 무료 상영 이벤트가 전국 극장에서 진행됩니다.', '2025-01-05 08:00:00', '2025-01-31 23:59:59', 0),
(5, NULL, 'EVENT', '포인트 적립 이벤트', '모든 예매 시 포인트 2배 적립 이벤트가 진행됩니다.', '2025-01-15 12:30:00', '2025-01-31 23:59:59', 0);


-- 1. 사용자 테이블 데이터 삽입
INSERT INTO user (userName, userId, userPassword, userEmail, userPhone, userPoint, userGrade, userRegDate, userStatus)
VALUES
('홍길동', 'hong123', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'hong123@example.com', '010-1234-5678', 500, 'BASIC', '2024-01-10 10:00:00', 0),
('김철수', 'kimcs', '$2a$10$A0P8H4TQJ21iQ1dQc5i/B.f7SGQ1lb1uDn5pYpx.fqx.DvrG/3KmG', 'kimcs@example.com', '010-5678-1234', 1500, 'VIP', '2024-02-15 15:30:00', 0),
('이영희', 'leeyh', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'leeyh@example.com', '010-8765-4321', 300, 'BASIC', '2024-03-05 12:00:00', 0),
('박민수', 'parkms', '$2a$10$A0P8H4TQJ21iQ1dQc5i/B.f7SGQ1lb1uDn5pYpx.fqx.DvrG/3KmG', 'parkms@example.com', '010-1357-2468', 2000, 'VVIP', '2024-04-01 09:45:00', 0),
('최유진', 'choiyj', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'choiyj@example.com', '010-2468-1357', 100, 'BASIC', '2024-05-20 16:20:00', 0),
('송지훈', 'songjh', '$2a$10$A0P8H4TQJ21iQ1dQc5i/B.f7SGQ1lb1uDn5pYpx.fqx.DvrG/3KmG', 'songjh@example.com', '010-1122-3344', 750, 'VIP', '2024-06-15 14:00:00', 0),
('유정아', 'youja', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'youja@example.com', '010-9988-7766', 500, 'BASIC', '2024-07-01 10:30:00', 0),
('장준영', 'jangjy', '$2a$10$A0P8H4TQJ21iQ1dQc5i/B.f7SGQ1lb1uDn5pYpx.fqx.DvrG/3KmG', 'jangjy@example.com', '010-5544-3322', 3000, 'VVIP', '2024-08-10 11:15:00', 0);

-- 1. 사용자 테이블 데이터 삽입
INSERT INTO user (userName, userId, userPassword, userEmail, userPhone, userPoint, userGrade, userRegDate, userStatus) VALUES
('사용자1', 'user001', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user001@example.com', '010-9166-3848', 5120, 'VIP', '2024-01-22 12:38:00', 0),
('사용자2', 'user002', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user002@example.com', '010-6388-7653', 2692, 'VIP', '2024-01-07 04:27:00', 0),
('사용자3', 'user003', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user003@example.com', '010-9285-2909', 4032, 'BASIC', '2024-01-26 12:32:00', 0),
('사용자4', 'user004', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user004@example.com', '010-6662-1402', 2684, 'VIP', '2024-01-29 10:51:00', 0),
('사용자5', 'user005', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user005@example.com', '010-3108-9220', 4275, 'VIP', '2024-01-07 14:55:00', 0),
('사용자6', 'user006', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user006@example.com', '010-4563-9391', 4631, 'VIP', '2024-02-12 09:50:00', 0),
('사용자7', 'user007', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user007@example.com', '010-5040-7600', 7711, 'VVIP', '2024-02-15 07:39:00', 0),
('사용자8', 'user008', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user008@example.com', '010-7856-6537', 2122, 'VIP', '2024-01-20 20:30:00', 0),
('사용자9', 'user009', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user009@example.com', '010-9613-2133', 16, 'VIP', '2024-01-01 03:01:00', 0),
('사용자10', 'user010', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user010@example.com', '010-1871-4444', 8584, 'BASIC', '2024-01-07 06:25:00', 0),
('사용자11', 'user011', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user011@example.com', '010-6650-8477', 6783, 'BASIC', '2024-02-09 13:06:00', 0),
('사용자12', 'user012', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user012@example.com', '010-5213-9810', 1233, 'VVIP', '2024-01-15 07:14:00', 0),
('사용자13', 'user013', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user013@example.com', '010-6595-2656', 4926, 'VVIP', '2024-01-09 12:08:00', 0),
('사용자14', 'user014', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user014@example.com', '010-3415-7905', 4974, 'BASIC', '2024-01-01 00:07:00', 0),
('사용자15', 'user015', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user015@example.com', '010-5223-5480', 8045, 'VIP', '2024-01-23 15:49:00', 0),
('사용자16', 'user016', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user016@example.com', '010-8315-8906', 249, 'BASIC', '2024-01-10 15:06:00', 0),
('사용자17', 'user017', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user017@example.com', '010-3618-3132', 951, 'BASIC', '2024-01-14 15:25:00', 0),
('사용자18', 'user018', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user018@example.com', '010-2700-9017', 8603, 'VIP', '2024-01-24 09:50:00', 0),
('사용자19', 'user019', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user019@example.com', '010-3728-4225', 6819, 'VVIP', '2024-01-03 22:01:00', 0),
('사용자20', 'user020', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user020@example.com', '010-3014-8397', 5169, 'BASIC', '2024-02-08 14:47:00', 1),
('사용자21', 'user021', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user021@example.com', '010-4802-2576', 5516, 'VIP', '2024-01-25 21:24:00', 0),
('사용자22', 'user022', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user022@example.com', '010-5420-4635', 7888, 'VVIP', '2024-01-12 18:38:00', 0),
('사용자23', 'user023', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user023@example.com', '010-3067-9675', 2297, 'VIP', '2024-02-04 14:37:00', 0),
('사용자24', 'user024', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user024@example.com', '010-1241-1376', 8215, 'BASIC', '2024-01-25 20:46:00', 0),
('사용자25', 'user025', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user025@example.com', '010-9530-7417', 7391, 'BASIC', '2024-02-01 23:52:00', 0),
('사용자26', 'user026', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user026@example.com', '010-2766-1106', 2912, 'BASIC', '2024-02-04 16:43:00', 0),
('사용자27', 'user027', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user027@example.com', '010-5305-3454', 1674, 'VVIP', '2024-01-18 11:06:00', 0),
('사용자28', 'user028', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user028@example.com', '010-3680-8122', 378, 'VVIP', '2024-02-12 07:28:00', 0),
('사용자29', 'user029', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user029@example.com', '010-1159-2177', 6405, 'VVIP', '2024-01-09 20:10:00', 0),
('사용자30', 'user030', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user030@example.com', '010-3070-2258', 7252, 'VVIP', '2024-01-07 23:14:00', 0),
('사용자31', 'user031', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user031@example.com', '010-5607-7827', 1461, 'BASIC', '2024-02-08 18:40:00', 0),
('사용자32', 'user032', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user032@example.com', '010-6263-9686', 488, 'VIP', '2024-01-06 00:33:00', 0),
('사용자33', 'user033', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user033@example.com', '010-8400-4271', 268, 'BASIC', '2024-01-23 00:54:00', 0),
('사용자34', 'user034', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user034@example.com', '010-1920-3701', 6733, 'VIP', '2024-02-01 14:58:00', 0),
('사용자35', 'user035', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user035@example.com', '010-5723-3240', 7580, 'VVIP', '2024-01-12 01:36:00', 0),
('사용자36', 'user036', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user036@example.com', '010-3400-2273', 3336, 'BASIC', '2024-02-02 14:53:00', 0),
('사용자37', 'user037', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user037@example.com', '010-4522-5830', 3156, 'VIP', '2024-01-29 07:42:00', 0),
('사용자38', 'user038', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user038@example.com', '010-1371-3685', 6992, 'BASIC', '2024-02-14 10:17:00', 0),
('사용자39', 'user039', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user039@example.com', '010-9723-5505', 442, 'BASIC', '2024-01-31 15:45:00', 0),
('사용자40', 'user040', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user040@example.com', '010-5234-8437', 5834, 'VVIP', '2024-02-02 17:57:00', 0),
('사용자41', 'user041', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user041@example.com', '010-3411-3141', 7813, 'VVIP', '2024-01-13 08:47:00', 0),
('사용자42', 'user042', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user042@example.com', '010-4243-7506', 1701, 'VVIP', '2024-01-05 08:51:00', 0),
('사용자43', 'user043', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user043@example.com', '010-9842-7823', 7328, 'BASIC', '2024-02-14 09:34:00', 0),
('사용자44', 'user044', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user044@example.com', '010-9760-9857', 6943, 'BASIC', '2024-01-29 18:20:00', 0),
('사용자45', 'user045', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user045@example.com', '010-9355-8946', 6317, 'BASIC', '2024-01-02 03:37:00', 0),
('사용자46', 'user046', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user046@example.com', '010-1970-8278', 9128, 'VIP', '2024-01-05 03:53:00', 0),
('사용자47', 'user047', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user047@example.com', '010-2274-1922', 9720, 'BASIC', '2024-02-11 22:24:00', 0),
('사용자48', 'user048', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user048@example.com', '010-5257-6325', 834, 'BASIC', '2024-01-23 10:27:00', 0),
('사용자49', 'user049', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user049@example.com', '010-7592-2318', 4085, 'VVIP', '2024-01-18 17:11:00', 0),
('사용자50', 'user050', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user050@example.com', '010-8515-8763', 4604, 'BASIC', '2024-01-17 10:25:00', 0),
('사용자51', 'user051', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user051@example.com', '010-9026-5015', 4444, 'VVIP', '2024-02-03 03:25:00', 0),
('사용자52', 'user052', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user052@example.com', '010-2298-7606', 2201, 'BASIC', '2024-02-11 12:07:00', 0),
('사용자53', 'user053', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user053@example.com', '010-5516-3320', 7516, 'VIP', '2024-01-26 21:16:00', 0),
('사용자54', 'user054', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user054@example.com', '010-1427-1458', 6833, 'BASIC', '2024-02-10 08:40:00', 0),
('사용자55', 'user055', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user055@example.com', '010-3938-8114', 8700, 'BASIC', '2024-01-26 00:27:00', 0),
('사용자56', 'user056', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user056@example.com', '010-9167-6432', 5602, 'VIP', '2024-01-08 01:47:00', 0),
('사용자57', 'user057', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user057@example.com', '010-8244-9747', 605, 'VVIP', '2024-02-08 01:03:00', 0),
('사용자58', 'user058', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user058@example.com', '010-5229-6236', 5475, 'BASIC', '2024-01-17 06:13:00', 0),
('사용자59', 'user059', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user059@example.com', '010-5494-2084', 4079, 'VIP', '2024-02-07 11:56:00', 0),
('사용자60', 'user060', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user060@example.com', '010-7736-8281', 2317, 'BASIC', '2024-01-20 16:05:00', 1),
('사용자61', 'user061', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user061@example.com', '010-9126-6519', 6592, 'VVIP', '2024-01-30 16:43:00', 0),
('사용자62', 'user062', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user062@example.com', '010-8574-3437', 8716, 'VVIP', '2024-01-10 22:30:00', 0),
('사용자63', 'user063', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user063@example.com', '010-5779-8870', 3429, 'VIP', '2024-02-02 05:01:00', 0),
('사용자64', 'user064', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user064@example.com', '010-9069-9271', 6170, 'BASIC', '2024-01-27 15:06:00', 0),
('사용자65', 'user065', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user065@example.com', '010-5454-6384', 3792, 'VVIP', '2024-02-02 03:14:00', 0),
('사용자66', 'user066', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user066@example.com', '010-1774-4277', 8884, 'VVIP', '2024-01-17 03:01:00', 0),
('사용자67', 'user067', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user067@example.com', '010-8613-8088', 8899, 'VVIP', '2024-01-12 11:18:00', 0),
('사용자68', 'user068', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user068@example.com', '010-5046-1444', 8084, 'VVIP', '2024-02-07 02:40:00', 0),
('사용자69', 'user069', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user069@example.com', '010-1418-1906', 2071, 'VIP', '2024-01-13 06:30:00', 0),
('사용자70', 'user070', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user070@example.com', '010-2366-3807', 8180, 'VIP', '2024-01-19 12:15:00', 0),
('사용자71', 'user071', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user071@example.com', '010-2563-9965', 3306, 'VVIP', '2024-01-27 20:32:00', 0),
('사용자72', 'user072', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user072@example.com', '010-9690-1926', 5497, 'BASIC', '2024-01-19 03:30:00', 0),
('사용자73', 'user073', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user073@example.com', '010-8524-2490', 5937, 'BASIC', '2024-02-08 00:18:00', 0),
('사용자74', 'user074', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user074@example.com', '010-9629-6173', 328, 'VVIP', '2024-01-21 23:10:00', 0),
('사용자75', 'user075', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user075@example.com', '010-4094-8842', 4048, 'VVIP', '2024-02-04 21:43:00', 0),
('사용자76', 'user076', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user076@example.com', '010-7139-4549', 2730, 'VIP', '2024-02-01 23:44:00', 0),
('사용자77', 'user077', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user077@example.com', '010-2319-8018', 3253, 'VVIP', '2024-02-01 17:28:00', 0),
('사용자78', 'user078', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user078@example.com', '010-9804-5005', 4303, 'VIP', '2024-02-12 23:13:00', 0),
('사용자79', 'user079', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user079@example.com', '010-7728-5088', 2628, 'VIP', '2024-02-04 09:53:00', 0),
('사용자80', 'user080', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user080@example.com', '010-3651-3850', 5483, 'BASIC', '2024-02-09 04:35:00', 0),
('사용자81', 'user081', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user081@example.com', '010-3256-1631', 387, 'VIP', '2024-02-13 18:30:00', 0),
('사용자82', 'user082', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user082@example.com', '010-2886-1997', 1652, 'VVIP', '2024-01-09 14:24:00', 0),
('사용자83', 'user083', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user083@example.com', '010-5261-6083', 1042, 'VVIP', '2024-01-29 17:32:00', 0),
('사용자84', 'user084', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user084@example.com', '010-5360-8448', 8820, 'VIP', '2024-02-05 05:21:00', 0),
('사용자85', 'user085', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user085@example.com', '010-5681-6903', 646, 'VVIP', '2024-01-27 09:29:00', 0),
('사용자86', 'user086', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user086@example.com', '010-2543-2552', 9576, 'BASIC', '2024-01-30 09:30:00', 0),
('사용자87', 'user087', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user087@example.com', '010-1890-8633', 8412, 'VVIP', '2024-02-06 07:27:00', 0),
('사용자88', 'user088', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user088@example.com', '010-9062-5721', 9099, 'BASIC', '2024-01-03 13:28:00', 0),
('사용자89', 'user089', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user089@example.com', '010-7371-1567', 2852, 'VVIP', '2024-02-09 17:36:00', 0),
('사용자90', 'user090', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user090@example.com', '010-1429-3795', 4098, 'VIP', '2024-01-15 20:10:00', 0),
('사용자91', 'user091', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user091@example.com', '010-7968-3940', 4137, 'BASIC', '2024-02-01 13:16:00', 0),
('사용자92', 'user092', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user092@example.com', '010-2463-2861', 5676, 'VIP', '2024-01-22 14:27:00', 0),
('사용자93', 'user093', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user093@example.com', '010-1252-2413', 3273, 'VIP', '2024-01-18 20:50:00', 0),
('사용자94', 'user094', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user094@example.com', '010-7708-3661', 8149, 'VVIP', '2024-01-16 16:24:00', 0),
('사용자95', 'user095', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user095@example.com', '010-7272-7077', 1393, 'VVIP', '2024-01-13 17:39:00', 0),
('사용자96', 'user096', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user096@example.com', '010-2289-9005', 9452, 'BASIC', '2024-01-25 06:57:00', 0),
('사용자97', 'user097', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user097@example.com', '010-8388-2212', 6077, 'BASIC', '2024-01-15 22:54:00', 0),
('사용자98', 'user098', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user098@example.com', '010-5392-8002', 6555, 'BASIC', '2024-02-08 15:06:00', 0),
('사용자99', 'user099', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user099@example.com', '010-7198-5501', 9203, 'VVIP', '2024-01-23 04:02:00', 0),
('사용자100', 'user100', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHeFx4xZ6HQxGvsvZMHux2/2jxFIaiQqAe', 'user100@example.com', '010-6192-5640', 1348, 'VIP', '2024-02-12 08:17:00', 1);


-- 6. 좌석'Seat' 테이블

-- 강남 극장 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(1, 'A1', 0), (1, 'A2', 0), (1, 'A3', 0), (1, 'A4', 0), (1, 'A5', 0),
(1, 'B1', 0), (1, 'B2', 0), (1, 'B3', 0), (1, 'B4', 0), (1, 'B5', 0),
(1, 'C1', 0), (1, 'C2', 0), (1, 'C3', 0), (1, 'C4', 0), (1, 'C5', 0),
(1, 'D1', 0), (1, 'D2', 0), (1, 'D3', 0), (1, 'D4', 0), (1, 'D5', 0),

-- 2관 (VIP)
(2, 'A1', 0), (2, 'A2', 0), (2, 'A3', 0), (2, 'A4', 0), (2, 'A5', 0),
(2, 'B1', 0), (2, 'B2', 0), (2, 'B3', 0), (2, 'B4', 0), (2, 'B5', 0),
(2, 'C1', 0), (2, 'C2', 0), (2, 'C3', 0), (2, 'C4', 0), (2, 'C5', 0),
(2, 'D1', 0), (2, 'D2', 0), (2, 'D3', 0), (2, 'D4', 0), (2, 'D5', 0),

-- 3관 (DOLBY)
(3, 'A1', 0), (3, 'A2', 0), (3, 'A3', 0), (3, 'A4', 0), (3, 'A5', 0), (3, 'A6', 0), (3, 'A7', 0), (3, 'A8', 0),
(3, 'B1', 0), (3, 'B2', 0), (3, 'B3', 0), (3, 'B4', 0), (3, 'B5', 0), (3, 'B6', 0), (3, 'B7', 0), (3, 'B8', 0),
(3, 'C1', 0), (3, 'C2', 0), (3, 'C3', 0), (3, 'C4', 0),

-- 4관 (4DX)
(4, 'A1', 0), (4, 'A2', 0), (4, 'A3', 0), (4, 'A4', 0), (4, 'A5', 0), (4, 'A6', 0),
(4, 'B1', 0), (4, 'B2', 0), (4, 'B3', 0), (4, 'B4', 0), (4, 'B5', 0), (4, 'B6', 0),
(4, 'C1', 0), (4, 'C2', 0), (4, 'C3', 0), (4, 'C4', 0), (4, 'C5', 0), (4, 'C6', 0),
(4, 'D1', 0), (4, 'D2', 0), (4, 'D3', 0), (4, 'D4', 0), (4, 'D5', 0), (4, 'D6', 0),

-- 5관 (IMAX)
(5, 'A1', 0), (5, 'A2', 0), (5, 'A3', 0), (5, 'A4', 0), (5, 'A5', 0), (5, 'A6', 0),
(5, 'B1', 0), (5, 'B2', 0), (5, 'B3', 0), (5, 'B4', 0), (5, 'B5', 0), (5, 'B6', 0),
(5, 'C1', 0), (5, 'C2', 0), (5, 'C3', 0), (5, 'C4', 0), (5, 'C5', 0), (5, 'C6', 0),
(5, 'D1', 0), (5, 'D2', 0), (5, 'D3', 0), (5, 'D4', 0), (5, 'D5', 0), (5, 'D6', 0);

-- 센트럴 극장 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(6, 'A1', 0), (6, 'A2', 0), (6, 'A3', 0), (6, 'A4', 0), (6, 'A5', 0),
(6, 'B1', 0), (6, 'B2', 0), (6, 'B3', 0), (6, 'B4', 0), (6, 'B5', 0),
(6, 'C1', 0), (6, 'C2', 0), (6, 'C3', 0), (6, 'C4', 0), (6, 'C5', 0),
(6, 'D1', 0), (6, 'D2', 0), (6, 'D3', 0), (6, 'D4', 0), (6, 'D5', 0),

-- 2관 (VIP)
(7, 'A1', 0), (7, 'A2', 0), (7, 'A3', 0), (7, 'A4', 0), (7, 'A5', 0),
(7, 'B1', 0), (7, 'B2', 0), (7, 'B3', 0), (7, 'B4', 0), (7, 'B5', 0),
(7, 'C1', 0), (7, 'C2', 0), (7, 'C3', 0), (7, 'C4', 0), (7, 'C5', 0),
(7, 'D1', 0), (7, 'D2', 0), (7, 'D3', 0), (7, 'D4', 0), (7, 'D5', 0),

-- 3관 (DOLBY)
(8, 'A1', 0), (8, 'A2', 0), (8, 'A3', 0), (8, 'A4', 0), (8, 'A5', 0), (8, 'A6', 0), (8, 'A7', 0), (8, 'A8', 0),
(8, 'B1', 0), (8, 'B2', 0), (8, 'B3', 0), (8, 'B4', 0), (8, 'B5', 0), (8, 'B6', 0), (8, 'B7', 0), (8, 'B8', 0),
(8, 'C1', 0), (8, 'C2', 0), (8, 'C3', 0), (8, 'C4', 0),

-- 4관 (4DX)
(9, 'A1', 0), (9, 'A2', 0), (9, 'A3', 0), (9, 'A4', 0), (9, 'A5', 0), (9, 'A6', 0),
(9, 'B1', 0), (9, 'B2', 0), (9, 'B3', 0), (9, 'B4', 0), (9, 'B5', 0), (9, 'B6', 0),
(9, 'C1', 0), (9, 'C2', 0), (9, 'C3', 0), (9, 'C4', 0), (9, 'C5', 0), (9, 'C6', 0),
(9, 'D1', 0), (9, 'D2', 0), (9, 'D3', 0), (9, 'D4', 0), (9, 'D5', 0), (9, 'D6', 0);

-- 코엑스 극장 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(10, 'A1', 0), (10, 'A2', 0), (10, 'A3', 0), (10, 'A4', 0), (10, 'A5', 0),
(10, 'B1', 0), (10, 'B2', 0), (10, 'B3', 0), (10, 'B4', 0), (10, 'B5', 0),
(10, 'C1', 0), (10, 'C2', 0), (10, 'C3', 0), (10, 'C4', 0), (10, 'C5', 0),
(10, 'D1', 0), (10, 'D2', 0), (10, 'D3', 0), (10, 'D4', 0), (10, 'D5', 0),

-- 2관 (VIP)
(11, 'A1', 0), (11, 'A2', 0), (11, 'A3', 0), (11, 'A4', 0), (11, 'A5', 0),
(11, 'B1', 0), (11, 'B2', 0), (11, 'B3', 0), (11, 'B4', 0), (11, 'B5', 0),
(11, 'C1', 0), (11, 'C2', 0), (11, 'C3', 0), (11, 'C4', 0), (11, 'C5', 0),
(11, 'D1', 0), (11, 'D2', 0), (11, 'D3', 0), (11, 'D4', 0), (11, 'D5', 0),

-- 3관 (DOLBY)
(12, 'A1', 0), (12, 'A2', 0), (12, 'A3', 0), (12, 'A4', 0), (12, 'A5', 0), (12, 'A6', 0), (12, 'A7', 0), (12, 'A8', 0),
(12, 'B1', 0), (12, 'B2', 0), (12, 'B3', 0), (12, 'B4', 0), (12, 'B5', 0), (12, 'B6', 0), (12, 'B7', 0), (12, 'B8', 0),
(12, 'C1', 0), (12, 'C2', 0), (12, 'C3', 0), (12, 'C4', 0),

-- 4관 (4DX)
(13, 'A1', 0), (13, 'A2', 0), (13, 'A3', 0), (13, 'A4', 0), (13, 'A5', 0), (13, 'A6', 0),
(13, 'B1', 0), (13, 'B2', 0), (13, 'B3', 0), (13, 'B4', 0), (13, 'B5', 0), (13, 'B6', 0),
(13, 'C1', 0), (13, 'C2', 0), (13, 'C3', 0), (13, 'C4', 0), (13, 'C5', 0), (13, 'C6', 0),
(13, 'D1', 0), (13, 'D2', 0), (13, 'D3', 0), (13, 'D4', 0), (13, 'D5', 0), (13, 'D6', 0),

-- 5관 (IMAX)
(14, 'A1', 0), (14, 'A2', 0), (14, 'A3', 0), (14, 'A4', 0), (14, 'A5', 0), (14, 'A6', 0),
(14, 'B1', 0), (14, 'B2', 0), (14, 'B3', 0), (14, 'B4', 0), (14, 'B5', 0), (14, 'B6', 0),
(14, 'C1', 0), (14, 'C2', 0), (14, 'C3', 0), (14, 'C4', 0), (14, 'C5', 0), (14, 'C6', 0),
(14, 'D1', 0), (14, 'D2', 0), (14, 'D3', 0), (14, 'D4', 0), (14, 'D5', 0), (14, 'D6', 0);

-- 홍대 극장 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(15, 'A1', 0), (15, 'A2', 0), (15, 'A3', 0), (15, 'A4', 0), (15, 'A5', 0),
(15, 'B1', 0), (15, 'B2', 0), (15, 'B3', 0), (15, 'B4', 0), (15, 'B5', 0),
(15, 'C1', 0), (15, 'C2', 0), (15, 'C3', 0), (15, 'C4', 0), (15, 'C5', 0),
(15, 'D1', 0), (15, 'D2', 0), (15, 'D3', 0), (15, 'D4', 0), (15, 'D5', 0),

-- 2관 (VIP)
(16, 'A1', 0), (16, 'A2', 0), (16, 'A3', 0), (16, 'A4', 0), (16, 'A5', 0),
(16, 'B1', 0), (16, 'B2', 0), (16, 'B3', 0), (16, 'B4', 0), (16, 'B5', 0),
(16, 'C1', 0), (16, 'C2', 0), (16, 'C3', 0), (16, 'C4', 0), (16, 'C5', 0),
(16, 'D1', 0), (16, 'D2', 0), (16, 'D3', 0), (16, 'D4', 0), (16, 'D5', 0),

-- 3관 (DOLBY)
(17, 'A1', 0), (17, 'A2', 0), (17, 'A3', 0), (17, 'A4', 0), (17, 'A5', 0), (17, 'A6', 0), (17, 'A7', 0), (17, 'A8', 0),
(17, 'B1', 0), (17, 'B2', 0), (17, 'B3', 0), (17, 'B4', 0), (17, 'B5', 0), (17, 'B6', 0), (17, 'B7', 0), (17, 'B8', 0),
(17, 'C1', 0), (17, 'C2', 0), (17, 'C3', 0), (17, 'C4', 0),

-- 4관 (4DX)
(18, 'A1', 0), (18, 'A2', 0), (18, 'A3', 0), (18, 'A4', 0), (18, 'A5', 0), (18, 'A6', 0),
(18, 'B1', 0), (18, 'B2', 0), (18, 'B3', 0), (18, 'B4', 0), (18, 'B5', 0), (18, 'B6', 0),
(18, 'C1', 0), (18, 'C2', 0), (18, 'C3', 0), (18, 'C4', 0), (18, 'C5', 0), (18, 'C6', 0),
(18, 'D1', 0), (18, 'D2', 0), (18, 'D3', 0), (18, 'D4', 0), (18, 'D5', 0), (18, 'D6', 0);

-- 고양스타필드 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(5, 'A1', 0), (5, 'A2', 0), (5, 'A3', 0), (5, 'A4', 0), (5, 'A5', 0),
(5, 'B1', 0), (5, 'B2', 0), (5, 'B3', 0), (5, 'B4', 0), (5, 'B5', 0),
(5, 'C1', 0), (5, 'C2', 0), (5, 'C3', 0), (5, 'C4', 0), (5, 'C5', 0),
(5, 'D1', 0), (5, 'D2', 0), (5, 'D3', 0), (5, 'D4', 0), (5, 'D5', 0),

-- 2관 (VIP)
(6, 'A1', 0), (6, 'A2', 0), (6, 'A3', 0), (6, 'A4', 0), (6, 'A5', 0),
(6, 'B1', 0), (6, 'B2', 0), (6, 'B3', 0), (6, 'B4', 0), (6, 'B5', 0),
(6, 'C1', 0), (6, 'C2', 0), (6, 'C3', 0), (6, 'C4', 0), (6, 'C5', 0),
(6, 'D1', 0), (6, 'D2', 0), (6, 'D3', 0), (6, 'D4', 0), (6, 'D5', 0),

-- 3관 (DOLBY)
(7, 'A1', 0), (7, 'A2', 0), (7, 'A3', 0), (7, 'A4', 0), (7, 'A5', 0), (7, 'A6', 0), (7, 'A7', 0), (7, 'A8', 0),
(7, 'B1', 0), (7, 'B2', 0), (7, 'B3', 0), (7, 'B4', 0), (7, 'B5', 0), (7, 'B6', 0), (7, 'B7', 0), (7, 'B8', 0),
(7, 'C1', 0), (7, 'C2', 0), (7, 'C3', 0), (7, 'C4', 0),

-- 4관 (4DX)
(8, 'A1', 0), (8, 'A2', 0), (8, 'A3', 0), (8, 'A4', 0), (8, 'A5', 0), (8, 'A6', 0),
(8, 'B1', 0), (8, 'B2', 0), (8, 'B3', 0), (8, 'B4', 0), (8, 'B5', 0), (8, 'B6', 0),
(8, 'C1', 0), (8, 'C2', 0), (8, 'C3', 0), (8, 'C4', 0), (8, 'C5', 0), (8, 'C6', 0),
(8, 'D1', 0), (8, 'D2', 0), (8, 'D3', 0), (8, 'D4', 0), (8, 'D5', 0), (8, 'D6', 0);

-- 수원스타필드 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(9, 'A1', 0), (9, 'A2', 0), (9, 'A3', 0), (9, 'A4', 0), (9, 'A5', 0),
(9, 'B1', 0), (9, 'B2', 0), (9, 'B3', 0), (9, 'B4', 0), (9, 'B5', 0),
(9, 'C1', 0), (9, 'C2', 0), (9, 'C3', 0), (9, 'C4', 0), (9, 'C5', 0),
(9, 'D1', 0), (9, 'D2', 0), (9, 'D3', 0), (9, 'D4', 0), (9, 'D5', 0),

-- 2관 (VIP)
(10, 'A1', 0), (10, 'A2', 0), (10, 'A3', 0), (10, 'A4', 0), (10, 'A5', 0),
(10, 'B1', 0), (10, 'B2', 0), (10, 'B3', 0), (10, 'B4', 0), (10, 'B5', 0),
(10, 'C1', 0), (10, 'C2', 0), (10, 'C3', 0), (10, 'C4', 0), (10, 'C5', 0),
(10, 'D1', 0), (10, 'D2', 0), (10, 'D3', 0), (10, 'D4', 0), (10, 'D5', 0),

-- 3관 (DOLBY)
(11, 'A1', 0), (11, 'A2', 0), (11, 'A3', 0), (11, 'A4', 0), (11, 'A5', 0), (11, 'A6', 0), (11, 'A7', 0), (11, 'A8', 0),
(11, 'B1', 0), (11, 'B2', 0), (11, 'B3', 0), (11, 'B4', 0), (11, 'B5', 0), (11, 'B6', 0), (11, 'B7', 0), (11, 'B8', 0),
(11, 'C1', 0), (11, 'C2', 0), (11, 'C3', 0), (11, 'C4', 0),

-- 4관 (4DX)
(12, 'A1', 0), (12, 'A2', 0), (12, 'A3', 0), (12, 'A4', 0), (12, 'A5', 0), (12, 'A6', 0),
(12, 'B1', 0), (12, 'B2', 0), (12, 'B3', 0), (12, 'B4', 0), (12, 'B5', 0), (12, 'B6', 0),
(12, 'C1', 0), (12, 'C2', 0), (12, 'C3', 0), (12, 'C4', 0), (12, 'C5', 0), (12, 'C6', 0),
(12, 'D1', 0), (12, 'D2', 0), (12, 'D3', 0), (12, 'D4', 0), (12, 'D5', 0), (12, 'D6', 0),

-- 5관 (IMAX)
(13, 'A1', 0), (13, 'A2', 0), (13, 'A3', 0), (13, 'A4', 0), (13, 'A5', 0), (13, 'A6', 0),
(13, 'B1', 0), (13, 'B2', 0), (13, 'B3', 0), (13, 'B4', 0), (13, 'B5', 0), (13, 'B6', 0),
(13, 'C1', 0), (13, 'C2', 0), (13, 'C3', 0), (13, 'C4', 0), (13, 'C5', 0), (13, 'C6', 0),
(13, 'D1', 0), (13, 'D2', 0), (13, 'D3', 0), (13, 'D4', 0), (13, 'D5', 0), (13, 'D6', 0);

-- 안성스타필드 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(14, 'A1', 0), (14, 'A2', 0), (14, 'A3', 0), (14, 'A4', 0), (14, 'A5', 0),
(14, 'B1', 0), (14, 'B2', 0), (14, 'B3', 0), (14, 'B4', 0), (14, 'B5', 0),
(14, 'C1', 0), (14, 'C2', 0), (14, 'C3', 0), (14, 'C4', 0), (14, 'C5', 0),
(14, 'D1', 0), (14, 'D2', 0), (14, 'D3', 0), (14, 'D4', 0), (14, 'D5', 0),

-- 2관 (VIP)
(15, 'A1', 0), (15, 'A2', 0), (15, 'A3', 0), (15, 'A4', 0), (15, 'A5', 0),
(15, 'B1', 0), (15, 'B2', 0), (15, 'B3', 0), (15, 'B4', 0), (15, 'B5', 0),
(15, 'C1', 0), (15, 'C2', 0), (15, 'C3', 0), (15, 'C4', 0), (15, 'C5', 0),
(15, 'D1', 0), (15, 'D2', 0), (15, 'D3', 0), (15, 'D4', 0), (15, 'D5', 0),

-- 3관 (DOLBY)
(16, 'A1', 0), (16, 'A2', 0), (16, 'A3', 0), (16, 'A4', 0), (16, 'A5', 0), (16, 'A6', 0), (16, 'A7', 0), (16, 'A8', 0),
(16, 'B1', 0), (16, 'B2', 0), (16, 'B3', 0), (16, 'B4', 0), (16, 'B5', 0), (16, 'B6', 0), (16, 'B7', 0), (16, 'B8', 0),
(16, 'C1', 0), (16, 'C2', 0), (16, 'C3', 0), (16, 'C4', 0),

-- 4관 (4DX)
(17, 'A1', 0), (17, 'A2', 0), (17, 'A3', 0), (17, 'A4', 0), (17, 'A5', 0), (17, 'A6', 0),
(17, 'B1', 0), (17, 'B2', 0), (17, 'B3', 0), (17, 'B4', 0), (17, 'B5', 0), (17, 'B6', 0),
(17, 'C1', 0), (17, 'C2', 0), (17, 'C3', 0), (17, 'C4', 0), (17, 'C5', 0), (17, 'C6', 0),
(17, 'D1', 0), (17, 'D2', 0), (17, 'D3', 0), (17, 'D4', 0), (17, 'D5', 0), (17, 'D6', 0);

-- 송도 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(18, 'A1', 0), (18, 'A2', 0), (18, 'A3', 0), (18, 'A4', 0), (18, 'A5', 0),
(18, 'B1', 0), (18, 'B2', 0), (18, 'B3', 0), (18, 'B4', 0), (18, 'B5', 0),
(18, 'C1', 0), (18, 'C2', 0), (18, 'C3', 0), (18, 'C4', 0), (18, 'C5', 0),
(18, 'D1', 0), (18, 'D2', 0), (18, 'D3', 0), (18, 'D4', 0), (18, 'D5', 0),

-- 2관 (VIP)
(19, 'A1', 0), (19, 'A2', 0), (19, 'A3', 0), (19, 'A4', 0), (19, 'A5', 0),
(19, 'B1', 0), (19, 'B2', 0), (19, 'B3', 0), (19, 'B4', 0), (19, 'B5', 0),
(19, 'C1', 0), (19, 'C2', 0), (19, 'C3', 0), (19, 'C4', 0), (19, 'C5', 0),
(19, 'D1', 0), (19, 'D2', 0), (19, 'D3', 0), (19, 'D4', 0), (19, 'D5', 0),

-- 3관 (DOLBY)
(20, 'A1', 0), (20, 'A2', 0), (20, 'A3', 0), (20, 'A4', 0), (20, 'A5', 0), (20, 'A6', 0), (20, 'A7', 0), (20, 'A8', 0),
(20, 'B1', 0), (20, 'B2', 0), (20, 'B3', 0), (20, 'B4', 0), (20, 'B5', 0), (20, 'B6', 0), (20, 'B7', 0), (20, 'B8', 0),
(20, 'C1', 0), (20, 'C2', 0), (20, 'C3', 0), (20, 'C4', 0),

-- 4관 (4DX)
(21, 'A1', 0), (21, 'A2', 0), (21, 'A3', 0), (21, 'A4', 0), (21, 'A5', 0), (21, 'A6', 0),
(21, 'B1', 0), (21, 'B2', 0), (21, 'B3', 0), (21, 'B4', 0), (21, 'B5', 0), (21, 'B6', 0),
(21, 'C1', 0), (21, 'C2', 0), (21, 'C3', 0), (21, 'C4', 0), (21, 'C5', 0), (21, 'C6', 0),
(21, 'D1', 0), (21, 'D2', 0), (21, 'D3', 0), (21, 'D4', 0), (21, 'D5', 0), (21, 'D6', 0),

-- 5관 (IMAX)
(22, 'A1', 0), (22, 'A2', 0), (22, 'A3', 0), (22, 'A4', 0), (22, 'A5', 0), (22, 'A6', 0),
(22, 'B1', 0), (22, 'B2', 0), (22, 'B3', 0), (22, 'B4', 0), (22, 'B5', 0), (22, 'B6', 0),
(22, 'C1', 0), (22, 'C2', 0), (22, 'C3', 0), (22, 'C4', 0), (22, 'C5', 0), (22, 'C6', 0),
(22, 'D1', 0), (22, 'D2', 0), (22, 'D3', 0), (22, 'D4', 0), (22, 'D5', 0), (22, 'D6', 0);

-- 인천논현 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(23, 'A1', 0), (23, 'A2', 0), (23, 'A3', 0), (23, 'A4', 0), (23, 'A5', 0),
(23, 'B1', 0), (23, 'B2', 0), (23, 'B3', 0), (23, 'B4', 0), (23, 'B5', 0),
(23, 'C1', 0), (23, 'C2', 0), (23, 'C3', 0), (23, 'C4', 0), (23, 'C5', 0),
(23, 'D1', 0), (23, 'D2', 0), (23, 'D3', 0), (23, 'D4', 0), (23, 'D5', 0),

-- 2관 (VIP)
(24, 'A1', 0), (24, 'A2', 0), (24, 'A3', 0), (24, 'A4', 0), (24, 'A5', 0),
(24, 'B1', 0), (24, 'B2', 0), (24, 'B3', 0), (24, 'B4', 0), (24, 'B5', 0),
(24, 'C1', 0), (24, 'C2', 0), (24, 'C3', 0), (24, 'C4', 0), (24, 'C5', 0),
(24, 'D1', 0), (24, 'D2', 0), (24, 'D3', 0), (24, 'D4', 0), (24, 'D5', 0),

-- 3관 (DOLBY)
(25, 'A1', 0), (25, 'A2', 0), (25, 'A3', 0), (25, 'A4', 0), (25, 'A5', 0), (25, 'A6', 0), (25, 'A7', 0), (25, 'A8', 0),
(25, 'B1', 0), (25, 'B2', 0), (25, 'B3', 0), (25, 'B4', 0), (25, 'B5', 0), (25, 'B6', 0), (25, 'B7', 0), (25, 'B8', 0),
(25, 'C1', 0), (25, 'C2', 0), (25, 'C3', 0), (25, 'C4', 0);

-- 대전중앙로 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(26, 'A1', 0), (26, 'A2', 0), (26, 'A3', 0), (26, 'A4', 0), (26, 'A5', 0),
(26, 'B1', 0), (26, 'B2', 0), (26, 'B3', 0), (26, 'B4', 0), (26, 'B5', 0),
(26, 'C1', 0), (26, 'C2', 0), (26, 'C3', 0), (26, 'C4', 0), (26, 'C5', 0),
(26, 'D1', 0), (26, 'D2', 0), (26, 'D3', 0), (26, 'D4', 0), (26, 'D5', 0),

-- 2관 (VIP)
(27, 'A1', 0), (27, 'A2', 0), (27, 'A3', 0), (27, 'A4', 0), (27, 'A5', 0),
(27, 'B1', 0), (27, 'B2', 0), (27, 'B3', 0), (27, 'B4', 0), (27, 'B5', 0),
(27, 'C1', 0), (27, 'C2', 0), (27, 'C3', 0), (27, 'C4', 0), (27, 'C5', 0),
(27, 'D1', 0), (27, 'D2', 0), (27, 'D3', 0), (27, 'D4', 0), (27, 'D5', 0),

-- 3관 (DOLBY)
(28, 'A1', 0), (28, 'A2', 0), (28, 'A3', 0), (28, 'A4', 0), (28, 'A5', 0), (28, 'A6', 0), (28, 'A7', 0), (28, 'A8', 0),
(28, 'B1', 0), (28, 'B2', 0), (28, 'B3', 0), (28, 'B4', 0), (28, 'B5', 0), (28, 'B6', 0), (28, 'B7', 0), (28, 'B8', 0),
(28, 'C1', 0), (28, 'C2', 0), (28, 'C3', 0), (28, 'C4', 0),

-- 4관 (4DX)
(29, 'A1', 0), (29, 'A2', 0), (29, 'A3', 0), (29, 'A4', 0), (29, 'A5', 0), (29, 'A6', 0),
(29, 'B1', 0), (29, 'B2', 0), (29, 'B3', 0), (29, 'B4', 0), (29, 'B5', 0), (29, 'B6', 0),
(29, 'C1', 0), (29, 'C2', 0), (29, 'C3', 0), (29, 'C4', 0), (29, 'C5', 0), (29, 'C6', 0),
(29, 'D1', 0), (29, 'D2', 0), (29, 'D3', 0), (29, 'D4', 0), (29, 'D5', 0), (29, 'D6', 0),

-- 5관 (IMAX)
(30, 'A1', 0), (30, 'A2', 0), (30, 'A3', 0), (30, 'A4', 0), (30, 'A5', 0), (30, 'A6', 0),
(30, 'B1', 0), (30, 'B2', 0), (30, 'B3', 0), (30, 'B4', 0), (30, 'B5', 0), (30, 'B6', 0),
(30, 'C1', 0), (30, 'C2', 0), (30, 'C3', 0), (30, 'C4', 0), (30, 'C5', 0), (30, 'C6', 0),
(30, 'D1', 0), (30, 'D2', 0), (30, 'D3', 0), (30, 'D4', 0), (30, 'D5', 0), (30, 'D6', 0);

-- 세종나성 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(31, 'A1', 0), (31, 'A2', 0), (31, 'A3', 0), (31, 'A4', 0), (31, 'A5', 0),
(31, 'B1', 0), (31, 'B2', 0), (31, 'B3', 0), (31, 'B4', 0), (31, 'B5', 0),
(31, 'C1', 0), (31, 'C2', 0), (31, 'C3', 0), (31, 'C4', 0), (31, 'C5', 0),
(31, 'D1', 0), (31, 'D2', 0), (31, 'D3', 0), (31, 'D4', 0), (31, 'D5', 0),

-- 2관 (VIP)
(32, 'A1', 0), (32, 'A2', 0), (32, 'A3', 0), (32, 'A4', 0), (32, 'A5', 0),
(32, 'B1', 0), (32, 'B2', 0), (32, 'B3', 0), (32, 'B4', 0), (32, 'B5', 0),
(32, 'C1', 0), (32, 'C2', 0), (32, 'C3', 0), (32, 'C4', 0), (32, 'C5', 0),
(32, 'D1', 0), (32, 'D2', 0), (32, 'D3', 0), (32, 'D4', 0), (32, 'D5', 0),

-- 3관 (DOLBY)
(33, 'A1', 0), (33, 'A2', 0), (33, 'A3', 0), (33, 'A4', 0), (33, 'A5', 0), (33, 'A6', 0), (33, 'A7', 0), (33, 'A8', 0),
(33, 'B1', 0), (33, 'B2', 0), (33, 'B3', 0), (33, 'B4', 0), (33, 'B5', 0), (33, 'B6', 0), (33, 'B7', 0), (33, 'B8', 0),
(33, 'C1', 0), (33, 'C2', 0), (33, 'C3', 0), (33, 'C4', 0);

-- 대구신세계 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(34, 'A1', 0), (34, 'A2', 0), (34, 'A3', 0), (34, 'A4', 0), (34, 'A5', 0),
(34, 'B1', 0), (34, 'B2', 0), (34, 'B3', 0), (34, 'B4', 0), (34, 'B5', 0),
(34, 'C1', 0), (34, 'C2', 0), (34, 'C3', 0), (34, 'C4', 0), (34, 'C5', 0),
(34, 'D1', 0), (34, 'D2', 0), (34, 'D3', 0), (34, 'D4', 0), (34, 'D5', 0),

-- 2관 (VIP)
(35, 'A1', 0), (35, 'A2', 0), (35, 'A3', 0), (35, 'A4', 0), (35, 'A5', 0),
(35, 'B1', 0), (35, 'B2', 0), (35, 'B3', 0), (35, 'B4', 0), (35, 'B5', 0),
(35, 'C1', 0), (35, 'C2', 0), (35, 'C3', 0), (35, 'C4', 0), (35, 'C5', 0),
(35, 'D1', 0), (35, 'D2', 0), (35, 'D3', 0), (35, 'D4', 0), (35, 'D5', 0),

-- 3관 (DOLBY)
(36, 'A1', 0), (36, 'A2', 0), (36, 'A3', 0), (36, 'A4', 0), (36, 'A5', 0), (36, 'A6', 0), (36, 'A7', 0), (36, 'A8', 0),
(36, 'B1', 0), (36, 'B2', 0), (36, 'B3', 0), (36, 'B4', 0), (36, 'B5', 0), (36, 'B6', 0), (36, 'B7', 0), (36, 'B8', 0),
(36, 'C1', 0), (36, 'C2', 0), (36, 'C3', 0), (36, 'C4', 0),

-- 4관 (4DX)
(37, 'A1', 0), (37, 'A2', 0), (37, 'A3', 0), (37, 'A4', 0), (37, 'A5', 0), (37, 'A6', 0),
(37, 'B1', 0), (37, 'B2', 0), (37, 'B3', 0), (37, 'B4', 0), (37, 'B5', 0), (37, 'B6', 0),
(37, 'C1', 0), (37, 'C2', 0), (37, 'C3', 0), (37, 'C4', 0), (37, 'C5', 0), (37, 'C6', 0),
(37, 'D1', 0), (37, 'D2', 0), (37, 'D3', 0), (37, 'D4', 0), (37, 'D5', 0), (37, 'D6', 0);

-- 해운대 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(38, 'A1', 0), (38, 'A2', 0), (38, 'A3', 0), (38, 'A4', 0), (38, 'A5', 0),
(38, 'B1', 0), (38, 'B2', 0), (38, 'B3', 0), (38, 'B4', 0), (38, 'B5', 0),
(38, 'C1', 0), (38, 'C2', 0), (38, 'C3', 0), (38, 'C4', 0), (38, 'C5', 0),
(38, 'D1', 0), (38, 'D2', 0), (38, 'D3', 0), (38, 'D4', 0), (38, 'D5', 0),

-- 2관 (VIP)
(39, 'A1', 0), (39, 'A2', 0), (39, 'A3', 0), (39, 'A4', 0), (39, 'A5', 0),
(39, 'B1', 0), (39, 'B2', 0), (39, 'B3', 0), (39, 'B4', 0), (39, 'B5', 0),
(39, 'C1', 0), (39, 'C2', 0), (39, 'C3', 0), (39, 'C4', 0), (39, 'C5', 0),
(39, 'D1', 0), (39, 'D2', 0), (39, 'D3', 0), (39, 'D4', 0), (39, 'D5', 0),

-- 3관 (DOLBY)
(40, 'A1', 0), (40, 'A2', 0), (40, 'A3', 0), (40, 'A4', 0), (40, 'A5', 0), (40, 'A6', 0), (40, 'A7', 0), (40, 'A8', 0),
(40, 'B1', 0), (40, 'B2', 0), (40, 'B3', 0), (40, 'B4', 0), (40, 'B5', 0), (40, 'B6', 0), (40, 'B7', 0), (40, 'B8', 0),
(40, 'C1', 0), (40, 'C2', 0), (40, 'C3', 0), (40, 'C4', 0),

-- 4관 (4DX)
(41, 'A1', 0), (41, 'A2', 0), (41, 'A3', 0), (41, 'A4', 0), (41, 'A5', 0), (41, 'A6', 0),
(41, 'B1', 0), (41, 'B2', 0), (41, 'B3', 0), (41, 'B4', 0), (41, 'B5', 0), (41, 'B6', 0),
(41, 'C1', 0), (41, 'C2', 0), (41, 'C3', 0), (41, 'C4', 0), (41, 'C5', 0), (41, 'C6', 0),
(41, 'D1', 0), (41, 'D2', 0), (41, 'D3', 0), (41, 'D4', 0), (41, 'D5', 0), (41, 'D6', 0),

-- 5관 (IMAX)
(42, 'A1', 0), (42, 'A2', 0), (42, 'A3', 0), (42, 'A4', 0), (42, 'A5', 0), (42, 'A6', 0),
(42, 'B1', 0), (42, 'B2', 0), (42, 'B3', 0), (42, 'B4', 0), (42, 'B5', 0), (42, 'B6', 0),
(42, 'C1', 0), (42, 'C2', 0), (42, 'C3', 0), (42, 'C4', 0), (42, 'C5', 0), (42, 'C6', 0),
(42, 'D1', 0), (42, 'D2', 0), (42, 'D3', 0), (42, 'D4', 0), (42, 'D5', 0), (42, 'D6', 0);

-- 광주하남 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(43, 'A1', 0), (43, 'A2', 0), (43, 'A3', 0), (43, 'A4', 0), (43, 'A5', 0),
(43, 'B1', 0), (43, 'B2', 0), (43, 'B3', 0), (43, 'B4', 0), (43, 'B5', 0),
(43, 'C1', 0), (43, 'C2', 0), (43, 'C3', 0), (43, 'C4', 0), (43, 'C5', 0),
(43, 'D1', 0), (43, 'D2', 0), (43, 'D3', 0), (43, 'D4', 0), (43, 'D5', 0),

-- 2관 (VIP)
(44, 'A1', 0), (44, 'A2', 0), (44, 'A3', 0), (44, 'A4', 0), (44, 'A5', 0),
(44, 'B1', 0), (44, 'B2', 0), (44, 'B3', 0), (44, 'B4', 0), (44, 'B5', 0),
(44, 'C1', 0), (44, 'C2', 0), (44, 'C3', 0), (44, 'C4', 0), (44, 'C5', 0),
(44, 'D1', 0), (44, 'D2', 0), (44, 'D3', 0), (44, 'D4', 0), (44, 'D5', 0),

-- 3관 (DOLBY)
(45, 'A1', 0), (45, 'A2', 0), (45, 'A3', 0), (45, 'A4', 0), (45, 'A5', 0), (45, 'A6', 0), (45, 'A7', 0), (45, 'A8', 0),
(45, 'B1', 0), (45, 'B2', 0), (45, 'B3', 0), (45, 'B4', 0), (45, 'B5', 0), (45, 'B6', 0), (45, 'B7', 0), (45, 'B8', 0),
(45, 'C1', 0), (45, 'C2', 0), (45, 'C3', 0), (45, 'C4', 0),

-- 4관 (4DX)
(46, 'A1', 0), (46, 'A2', 0), (46, 'A3', 0), (46, 'A4', 0), (46, 'A5', 0), (46, 'A6', 0),
(46, 'B1', 0), (46, 'B2', 0), (46, 'B3', 0), (46, 'B4', 0), (46, 'B5', 0), (46, 'B6', 0),
(46, 'C1', 0), (46, 'C2', 0), (46, 'C3', 0), (46, 'C4', 0), (46, 'C5', 0), (46, 'C6', 0),
(46, 'D1', 0), (46, 'D2', 0), (46, 'D3', 0), (46, 'D4', 0), (46, 'D5', 0), (46, 'D6', 0),

-- 5관 (IMAX)
(47, 'A1', 0), (47, 'A2', 0), (47, 'A3', 0), (47, 'A4', 0), (47, 'A5', 0), (47, 'A6', 0),
(47, 'B1', 0), (47, 'B2', 0), (47, 'B3', 0), (47, 'B4', 0), (47, 'B5', 0), (47, 'B6', 0),
(47, 'C1', 0), (47, 'C2', 0), (47, 'C3', 0), (47, 'C4', 0), (47, 'C5', 0), (47, 'C6', 0),
(47, 'D1', 0), (47, 'D2', 0), (47, 'D3', 0), (47, 'D4', 0), (47, 'D5', 0), (47, 'D6', 0);

-- 전주혁신 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(48, 'A1', 0), (48, 'A2', 0), (48, 'A3', 0), (48, 'A4', 0), (48, 'A5', 0),
(48, 'B1', 0), (48, 'B2', 0), (48, 'B3', 0), (48, 'B4', 0), (48, 'B5', 0),
(48, 'C1', 0), (48, 'C2', 0), (48, 'C3', 0), (48, 'C4', 0), (48, 'C5', 0),
(48, 'D1', 0), (48, 'D2', 0), (48, 'D3', 0), (48, 'D4', 0), (48, 'D5', 0),

-- 2관 (VIP)
(49, 'A1', 0), (49, 'A2', 0), (49, 'A3', 0), (49, 'A4', 0), (49, 'A5', 0),
(49, 'B1', 0), (49, 'B2', 0), (49, 'B3', 0), (49, 'B4', 0), (49, 'B5', 0),
(49, 'C1', 0), (49, 'C2', 0), (49, 'C3', 0), (49, 'C4', 0), (49, 'C5', 0),
(49, 'D1', 0), (49, 'D2', 0), (49, 'D3', 0), (49, 'D4', 0), (49, 'D5', 0),

-- 3관 (DOLBY)
(50, 'A1', 0), (50, 'A2', 0), (50, 'A3', 0), (50, 'A4', 0), (50, 'A5', 0), (50, 'A6', 0), (50, 'A7', 0), (50, 'A8', 0),
(50, 'B1', 0), (50, 'B2', 0), (50, 'B3', 0), (50, 'B4', 0), (50, 'B5', 0), (50, 'B6', 0), (50, 'B7', 0), (50, 'B8', 0),
(50, 'C1', 0), (50, 'C2', 0), (50, 'C3', 0), (50, 'C4', 0);

-- 원주혁신 좌석 데이터
INSERT INTO seat (screenIdx, seatNumber, seatStatus) VALUES
-- 1관 (COMFORT)
(51, 'A1', 0), (51, 'A2', 0), (51, 'A3', 0), (51, 'A4', 0), (51, 'A5', 0),
(51, 'B1', 0), (51, 'B2', 0), (51, 'B3', 0), (51, 'B4', 0), (51, 'B5', 0),
(51, 'C1', 0), (51, 'C2', 0), (51, 'C3', 0), (51, 'C4', 0), (51, 'C5', 0),
(51, 'D1', 0), (51, 'D2', 0), (51, 'D3', 0), (51, 'D4', 0), (51, 'D5', 0),

-- 2관 (VIP)
(52, 'A1', 0), (52, 'A2', 0), (52, 'A3', 0), (52, 'A4', 0), (52, 'A5', 0),
(52, 'B1', 0), (52, 'B2', 0), (52, 'B3', 0), (52, 'B4', 0), (52, 'B5', 0),
(52, 'C1', 0), (52, 'C2', 0), (52, 'C3', 0), (52, 'C4', 0), (52, 'C5', 0),
(52, 'D1', 0), (52, 'D2', 0), (52, 'D3', 0), (52, 'D4', 0), (52, 'D5', 0),

-- 3관 (DOLBY)
(53, 'A1', 0), (53, 'A2', 0), (53, 'A3', 0), (53, 'A4', 0), (53, 'A5', 0), (53, 'A6', 0), (53, 'A7', 0), (53, 'A8', 0),
(53, 'B1', 0), (53, 'B2', 0), (53, 'B3', 0), (53, 'B4', 0), (53, 'B5', 0), (53, 'B6', 0), (53, 'B7', 0), (53, 'B8', 0),
(53, 'C1', 0), (53, 'C2', 0), (53, 'C3', 0), (53, 'C4', 0);


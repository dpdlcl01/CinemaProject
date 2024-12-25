

# Cinema Web Application
Java, JSP, MyBatis, JavaScript를 사용하여 개발한 영화 예매 웹 애플리케이션입니다.

---

## 주요 기능
- **회원가입 및 로그인**: 사용자 계정 생성 및 관리
- **영화 목록 및 예매**: 영화 상영작 관리 및 예매 기능
- **공지사항 및 게시판**: 사용자 간 커뮤니케이션 및 공지사항 확인
- **결제 모듈**: 결제 처리 기능
- **관리자/사용자 역할 관리**: 관리자와 일반 사용자의 권한을 구분하여 기능 제공

---

## 기술 스택
- **백엔드**: Java, JSP, MyBatis
- **프론트엔드**: JavaScript, jQuery
- **데이터베이스**: MySQL
- **서버**: Apache Tomcat

---

## 프로젝트 설정
**사전 준비**
프로젝트를 실행하기 위해 다음 환경이 필요합니다:
- **JDK**: 17 이상
- **Maven**: 설치 및 환경변수 설정 필요
- **MySQL**: 8.0.33 이상
- **Tomcat**: 9.0.0 이상
- **MyBatis**: 3.5.16 이상
- **IDE**: IntelliJ IDEA 또는 Eclipse

---

## 프로젝트 구조

- **src/main/java**: 백엔드 코드
- **src/main/webapp**: JSP 파일 및 정적 리소스
- **resources**: 데이터베이스 설정 파일


📂 Cinema/
├── 📂 src/
│   ├── 📂 main/
│   │   ├── 📂 java/ (Java 소스 파일, 패키지별 관리)
│   │   ├── 📂 webapp/ (JSP, HTML, CSS, JS 파일)
│   │   └── 📂 resources/ (MyBatis XML, 설정 파일 등)
├── 📂 db/ (DB 관련 문서 및 초기 SQL 파일)
├── 📂 docs/ (설계 문서, 기획 자료)
├── README.md (프로젝트 소개 및 실행 방법)
└── .gitignore (Git 관리에서 제외할 파일/폴더)

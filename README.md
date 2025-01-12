

# Cinema Web Application
Java, Servlet, JSP, MyBatis, JavaScript를 사용하여 개발한 영화 예매 웹 애플리케이션입니다.

---

## 주요 기능
- **회원가입 및 로그인**: 사용자 계정 생성 및 관리
- **영화 목록 및 예매**: 영화 상영작 관리 및 예매 기능
- **공지사항 및 게시판**: 사용자 간 커뮤니케이션 및 공지사항 확인
- **결제 모듈**: 결제 처리 기능
- **관리자/사용자 역할 관리**: 관리자와 일반 사용자의 권한을 구분하여 기능 제공

---

## 기술 스택
- **백엔드**: Java, Servlet, JSP, MyBatis
- **프론트엔드**: HTML, CSS, JavaScript, jQuery, AJAX
- **데이터베이스**: MySQL
- **서버**: Apache Tomcat (Servlet Container)

---

## 프로젝트 설정
**사전 준비**
프로젝트를 실행하기 위해 다음 환경이 필요합니다:
- **JDK**: 17 이상
- **Maven**: 설치 및 환경변수 설정 필요
- **MySQL**: 8.0.33 이상
- **Tomcat**: 9.0.0 이상
- **MyBatis**: 3.5.16 이상
- **IDE**: IntelliJ IDEA


**IntelliJ Tomcat 설정**
1) 모든 Maven 프로젝트 동기화
2) 구성편집 - 새 항목 추가 - Tomcat 서버 / 로컬 선택 - 배포 탭 선택 - [+로 추가] - 아티팩트 - 배포할 아티팩트에서 CinemaProject:war exploded 선택

---

## 프로젝트 구조

- **src/main/java**: 백엔드 코드
- **src/main/webapp**: JSP 파일 및 정적 리소스
- **resources**: 데이터베이스 설정 파일


📂 CinemaProject/  
├── 📂 db/  # DB 관련 문서 및 초기 SQL 파일  
├── 📂 docs/  # 설계 문서, 기획 자료  
├── 📂 src/  
│   └── 📂 main/  
│       ├── 📂 java/  (Java 소스 파일, 패키지별 관리)  
│       │   ├── 📂 action/  
│       │   │   ├── 📂 admin/  
│       │   │   ├── 📂 user/  
│       │   │   ├── 📝 Action.java  # Action 인터페이스  
│       │   ├── 📂 control/  
│       │   │   ├── 📝 AdminController.java  # AdminController 서블릿  
│       │   │   ├── 📝 UserController.java  # UserController 서블릿  
│       │   ├── 📂 mybatis/  
│       │   │   ├── 📂 dao/  
│       │   │   ├── 📂 service/  
│       │   │   │   ├── 📝 FactoryService.java  
│       │   │   ├── 📂 vo/  
│       │   ├── 📂 util/  
│       │   │   ├── 📝 Paging.java  
│       ├── 📂 resources/  
│       │   ├── 📂 config/  
│       │   ├── 📂 mapper/  
│       └── 📂 webapp/  
│           ├── 📂 WEB-INF/  # JSP 배치를 위한 디렉토리  
│           │   ├── 📝 user_action.properties  # 사용자 관련 액션 설정 파일  
│           │   ├── 📝 admin_action.properties  # 관리자 관련 액션 설정 파일  
│           ├── 📂 css/  
│           ├── 📂 jsp/  
│               ├── 📂 user/  # 사용자 관련 JSP 파일  
│               ├── 📂 admin/  # 관리자 관련 JSP 파일  
├── README.md (프로젝트 소개 및 실행 방법)  
└── .gitignore (Git 관리에서 제외할 파일/폴더)  
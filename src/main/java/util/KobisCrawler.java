package util;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import javax.servlet.ServletContext;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

public class KobisCrawler {

    private final ServletContext context;

    public KobisCrawler(ServletContext context) {
        this.context = context;
    }

    public List<WebElement> fetchMovieData() {
        WebDriver driver = WebDriverUtil.getDriver(context); // ✅ ServletContext를 이용해 WebDriver 가져오기

        try {
            // 1. URL 접속 및 페이지 로드
            driver.get("https://www.kobis.or.kr/kobis/business/stat/boxs/findRealTicketList.do");
            driver.manage().window().maximize();

            // 2. JavaScript로 필터링 체크박스 모두 선택
            JavascriptExecutor js = (JavascriptExecutor) driver;
            js.executeScript(
                    "document.getElementById('repNationChk').checked = true;" +
                            "document.getElementById('wideareaAll').checked = true;" +
                            "document.getElementById('sNomal').checked = true;" +
                            "document.getElementById('sMulti').checked = true;" +
                            "document.getElementById('sIndie').checked = true;" +
                            "chkform('search');" // 검색 버튼 실행
            );

            // 3. 테이블 로드 대기
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("table.tbl_comm tbody tr")));

            // 4. 테이블 데이터 가져오기
            return driver.findElements(By.cssSelector("table.tbl_comm tbody tr"));

        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
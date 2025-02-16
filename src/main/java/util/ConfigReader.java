package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigReader {

    private static Properties properties = new Properties();

    static {
        try (InputStream input = ConfigReader.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input != null) {
                properties.load(input);
            } else {
                System.out.println("config.properties 파일을 찾을 수 없습니다.");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static String getTossReservationApiKey() {
        return properties.getProperty("toss.reservation.secretKey");
    }

    public static String getTossStoreApiKey() {
        return properties.getProperty("toss.store.secretKey");
    }

    public static String getKakaoMapApiKey() {
        return properties.getProperty("kakao.map.apiKey");
    }

    public static String getTmdbMovieApiKey() {
        return properties.getProperty("tmdb.movie.apiKey");
    }

    public static String getKoficMovieApiKey() {
        return properties.getProperty("kofic.movie.apiKey");
    }
}

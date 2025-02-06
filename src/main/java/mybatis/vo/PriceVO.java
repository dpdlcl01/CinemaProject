package mybatis.vo;

public class PriceVO {

  private String priceIdx, screenType, ageGroup, dayOfWeek, timeOfDay, teenPrice, generalPrice, seatPrice;

  public String getPriceIdx() {
    return priceIdx;
  }

  public void setPriceIdx(String priceIdx) {
    this.priceIdx = priceIdx;
  }

  public String getScreenType() {
    return screenType;
  }

  public void setScreenType(String screenType) {
    this.screenType = screenType;
  }

  public String getAgeGroup() {
    return ageGroup;
  }

  public void setAgeGroup(String ageGroup) {
    this.ageGroup = ageGroup;
  }

  public String getDayOfWeek() {
    return dayOfWeek;
  }

  public void setDayOfWeek(String dayOfWeek) {
    this.dayOfWeek = dayOfWeek;
  }

  public String getTimeOfDay() {
    return timeOfDay;
  }

  public void setTimeOfDay(String timeOfDay) {
    this.timeOfDay = timeOfDay;
  }

  public String getTeenPrice() {
    return teenPrice;
  }

  public void setTeenPrice(String teenPrice) {
    this.teenPrice = teenPrice;
  }

  public String getGeneralPrice() {
    return generalPrice;
  }

  public void setGeneralPrice(String generalPrice) {
    this.generalPrice = generalPrice;
  }

  public String getSeatPrice() {
    return seatPrice;
  }

  public void setSeatPrice(String seatPrice) {
    this.seatPrice = seatPrice;
  }
}

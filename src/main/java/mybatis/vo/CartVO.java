package mybatis.vo;

public class CartVO {
    String  productIdx, productName, productPrice, productRegDate, productStatus, productImg, total_quant,productCategory;

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductRegDate() {
        return productRegDate;
    }

    public void setProductRegDate(String productRegDate) {
        this.productRegDate = productRegDate;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getTotal_quant() {
        return total_quant;
    }

    public void setTotal_quant(String total_quant) {
        this.total_quant = total_quant;
    }

    public String getProductIdx() {
        return productIdx;
    }

    public void setProductIdx(String productIdx) {
        this.productIdx = productIdx;
    }


}

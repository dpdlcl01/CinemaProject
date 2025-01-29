package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ProductDAO {

     public  static ProductVO[] gettotal(){
        SqlSession ss = FactoryService.getFactory().openSession();

        List<ProductVO> list = ss.selectList("product.total");

        ProductVO[] ar = new ProductVO[list.size()];

        list.toArray(ar);
        ss.close();

        return ar;
    }
/*어드민기능*/
    public static ProductVO[] selectAll(){
         SqlSession ss = FactoryService.getFactory().openSession();
         List<ProductVO> list = ss.selectList("product.selectAll");
         ProductVO[] ar = new ProductVO[list.size()];
         list.toArray(ar);
         ss.close();
         return ar;

    }

    public static int updateProduct(ProductVO updatedProduct) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int result = ss.update("product.updateProduct", updatedProduct); // MyBatis 쿼리 실행
        if (result > 0) {
            ss.commit(); // 커밋하여 변경 사항 반영
        }
        ss.close();
        return result;
    }

    public static boolean addProduct(ProductVO addProduct) {
        SqlSession ss = FactoryService.getFactory().openSession();
        boolean result = false;
        int cnt = ss.insert("product.addProduct", addProduct);
        if (cnt > 0) {
            ss.commit();
            result = true;
        } else {
            ss.rollback();
            result = false;
        }
        ss.close();

        return result;
    }
}

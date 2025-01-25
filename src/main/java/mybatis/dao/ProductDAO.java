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

}

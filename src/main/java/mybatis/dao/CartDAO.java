package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.CartVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class CartDAO {
    public static void addCart(String id,String idx,String quant){
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String,String> map = new HashMap<>();
        map.put("userId",id);
        map.put("productIdx",idx);
        map.put("quantity",quant);

        ss.insert("product.addCart",map);
        ss.commit();
        ss.close();

    }
    public static CartVO[] getCart(String id){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<CartVO> list = ss.selectList("product.selectCart",id);
        ss.close();
        CartVO[] cvo = new CartVO[list.size()];
        list.toArray(cvo);


        return cvo;
    }
}

package mybatis.dao.user;

import mybatis.service.FactoryService;
import mybatis.vo.CartVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class CartDAO {

    public static int delCart(String userIdx,String idx){
        int cnt=0;
        SqlSession ss = FactoryService.getFactory().openSession();
        HashMap<String,String> map = new HashMap<>();
        map.put("userIdx",userIdx);
        map.put("productIdx",idx);

        cnt = ss.delete("product.delCart",map);
        
        ss.commit();
        ss.close();


        return cnt;
    }
    public static int addCart(String id,String idx,String quant, String userIdx){
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String,String> map = new HashMap<>();
        map.put("userIdx",userIdx);
        map.put("productIdx",idx);
        map.put("quantity",quant);

        int cnt =ss.insert("product.addCart",map);
        ss.commit();
        ss.close();
        return cnt;

    }
    public static CartVO[] getCart(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<CartVO> list = ss.selectList("product.selectCart",idx);
        ss.close();
        CartVO[] cvo = new CartVO[list.size()];
        list.toArray(cvo);


        return cvo;
    }
}

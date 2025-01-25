package mybatis.dao.user;

import mybatis.service.FactoryService;
import mybatis.vo.CouponVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class CouponDAO {
    // 사용자 쿠폰 조회
    public static CouponVO[] getList(String userIdx, int begin, int end) {
        CouponVO[] ar = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("userIdx", userIdx); // 사용자 ID
        map.put("begin", begin);     // 시작 인덱스
        map.put("end", end);         // 끝 인덱스

        SqlSession ss = FactoryService.getFactory().openSession();
        List<CouponVO> list = ss.selectList("coupon.userCoupon", map);
        if(list != null && !list.isEmpty()) {
            ar = new CouponVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }
}

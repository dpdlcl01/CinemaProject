package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.CouponVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class CouponDAO {

    public static int getTotalCount(String userIdx) {
        int totalCount = 0;
        SqlSession ss = FactoryService.getFactory().openSession();
        totalCount = ss.selectOne("coupon.totalCount", userIdx);
        ss.close();
        return totalCount;
    }

    // 사용자 쿠폰 조회 페이징
    public static CouponVO[] getList(String userIdx, int begin, int numPerPage) {
        CouponVO[] ar = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("userIdx", userIdx); // 사용자 ID
        map.put("begin", begin);
        map.put("numPerPage", numPerPage);


        SqlSession ss = FactoryService.getFactory().openSession();
        List<CouponVO> list = ss.selectList("coupon.userCoupon", map);

        if(list != null && !list.isEmpty()) {
            ar = new CouponVO[list.size()];
            list.toArray(ar);
        }

        ss.close();
        return ar;
    }

    // 필터링만 적용 (페이징 없음, AJAX 요청용)
    public static CouponVO[] getListNoPaging(String userIdx, String filter) {
        CouponVO[] ar = null;

        HashMap<String, Object> map = new HashMap<>();
        map.put("userIdx", userIdx);
        map.put("filter", filter);

        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            List<CouponVO> list = ss.selectList("coupon.userCouponNoPaging", map);

            if (list != null && !list.isEmpty()) {
                ar = new CouponVO[list.size()];
                list.toArray(ar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return ar;
    }
}

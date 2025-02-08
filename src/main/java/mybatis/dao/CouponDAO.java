package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.CouponVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CouponDAO {

    public static int insertCouponForUserGrade(Map<String, String> map) {

        SqlSession ss = FactoryService.getFactory().openSession(true);

        System.out.println("insertCouponForUserGrade:" + map);
        int result = ss.insert("coupon.insertCouponForUserGrade", map);

        ss.close();


        return result;
    }

    public static int insertCoupon(Map<String, Object> couponData) {
     SqlSession ss = FactoryService.getFactory().openSession(true);


            return ss.insert("coupon.insertCoupon", couponData);

    }
    public static int delCoupon(String couponIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int result = ss.delete("coupon.updateStatus", couponIdx);
        if(result > 0){
            ss.commit();
        }else{
            ss.rollback();
        }

        ss.close();
        return result;
    }

    public static List<CouponVO> getCouponList() {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<CouponVO> list = ss.selectList("coupon.list");
        ss.close();
        return list;
    }

    public static int updateCoupon(String idx, String couponIdx){
        SqlSession ss = FactoryService.getFactory().openSession();
        HashMap<String, String> map =new HashMap<>();
        map.put("couponIdx", couponIdx);
        map.put("idx", idx);
        int result = ss.update("coupon.updateCoupon", map);
        if(result > 0){
            ss.commit();
        }else {
            ss.rollback();
        }
        ss.close();
        return result;

    }

    public static List<CouponVO> userCouponList(String userIdx) {
        List<CouponVO> couponList = null;

        SqlSession ss = FactoryService.getFactory().openSession();
        couponList = ss.selectList("coupon.getUserCouponList", userIdx);

        System.out.println(userIdx);
        ss.close();
        return couponList;
    }

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

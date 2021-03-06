package db;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import model.HCourse;
import model.HStaffDetail;
import model.HStudentDetail;
import customTools.DBUtil;

public class DBStaffDetail {
	public static HStaffDetail getUser(long userId) {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		try {
			HStaffDetail user = em.find(HStaffDetail.class, userId);
			return user;
		} finally {
			em.close();
		}
	}

	public static List<HStaffDetail> getInstructorByCourse(HCourse course) {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String sql = "SELECT s FROM HStaffDetail s INNER JOIN HClass c "
				+ "on c.HStaffDetail.userId =s.userId  WHERE c.HCourse = :course";
		System.out.println("Get query : " + sql);
		TypedQuery<HStaffDetail> query = em
				.createQuery(sql, HStaffDetail.class).setParameter("course",
						course);
		List<HStaffDetail> instructors = null;
		try {
			instructors = query.getResultList();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return instructors;
	}
	
	public static void insert(HStaffDetail staff) 
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		trans.begin(); 
		try 
		{
			em.persist(staff);
			trans.commit();
		} 
		catch (Exception e) 
		{
			System.out.println(e);
			trans.rollback();
		} 
		finally 
		{
			em.close();
		}
	}
	

}

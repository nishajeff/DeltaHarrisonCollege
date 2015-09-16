package db;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import model.HClassroom;
import model.HMajor;
import customTools.DBUtil;

public class DBMajor {
	public static List<HMajor> getAllMajors() {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String queryStr = "SELECT h FROM HMajor h";
		List<HMajor> major = null;
		try {
			Query query = em.createQuery(queryStr);
			major = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return major;
	}
	
	public static HMajor getMajor(long major)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		try
		{
			HMajor majors= em.find(HMajor.class, major);
			return majors;
		}
		finally
		{
			em.close();
		}
	}
	public static void update(HMajor major) 
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		trans.begin(); 
		try 
		{
			em.merge(major);
			trans.commit();
		} catch (Exception e) 
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

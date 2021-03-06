package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.HClass;
import model.HClassroom;
import model.HDepartment;
import model.HUser;
import db.DBClass;
import db.DBClassroom;
import db.DBDepartment;

/**
 * Servlet implementation class CurrentClassesDept
 */
@WebServlet("/CurrentClassesDept")
public class CurrentClassesDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurrentClassesDept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		List<HDepartment> departments = DBDepartment.getAllActiveDepartment();		
		request.setAttribute("departments", departments);
		getServletContext().getRequestDispatcher("/CurrentClassesDept.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		HUser user=(HUser) session.getAttribute("user");
		if(user.isAdmin()){
		String deptId=request.getParameter("department");
		List<HClass>classes=DBClass.getActiveClassesForDept(deptId);
		request.setAttribute("classes", classes);
		}
		else{
			request.setAttribute("errorMessage", "You are not an Admin");
		}
		List<HDepartment> departments = DBDepartment.getAllActiveDepartment();		
		request.setAttribute("departments", departments);
		getServletContext().getRequestDispatcher("/CurrentClassesDept.jsp").forward(request, response);
	}

}

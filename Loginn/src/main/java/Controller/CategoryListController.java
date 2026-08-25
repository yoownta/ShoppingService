package Controller; 

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Model.Category;
import Service.CategoryService;
import Service.CategoryServiceImpl;

@WebServlet(urlPatterns = "/admin/category/list")
public class CategoryListController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        // 1. Lấy danh sách danh mục từ Database lên
        List<Category> list = cateService.getAll();
        req.setAttribute("cateList", list);

        // 2. CHÌA KHÓA QUAN TRỌNG: 
        // Đẩy đường dẫn của file list-category.jsp vào biến "subPage" để file admin.jsp nhúng vào vùng giữa
        req.setAttribute("subPage", "/views/admin/list-category.jsp");

        // 3. Gọi forward ra file khung tổng admin.jsp
        req.getRequestDispatcher("/views/admin/layout/admin.jsp").forward(req, resp);
    }
}
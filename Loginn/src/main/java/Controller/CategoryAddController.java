package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.Constant;
import Model.Category;
import Service.CategoryService;
import Service.CategoryServiceImpl;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(urlPatterns = "/admin/category/add")
public class CategoryAddController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/category/add-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String categoryName = req.getParameter("categoryname");
        
        String fname = "";
        String uploadPath = Constant.DIR + "/category";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        try {
            Part filePart = req.getPart("icon");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                long currentTime = System.currentTimeMillis();
                fname = currentTime + "_" + fileName;
                filePart.write(uploadPath + File.separator + fname);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Category category = new Category();
        category.setName(categoryName);
        category.setIcon(fname); 
        
        cateService.insert(category);
        
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
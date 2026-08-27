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

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
                 maxFileSize = 1024 * 1024 * 10,
                 maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = "/admin/category/edit")
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = cateService.get(id); // Lấy danh mục cũ theo ID[cite: 3, 4]
        
        req.setAttribute("category", category);
        
        // Sửa lại đường dẫn đúng với cây thư mục hiện tại của bạn (nằm trực tiếp trong views/admin/)
        req.setAttribute("subPage", "/views/admin/edit-category.jsp");
        req.getRequestDispatcher("/views/admin/layout/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        
        Category category = new Category();
        category.setId(id);
        category.setName(name);
        
        // Xử lý upload ảnh mới nếu người dùng chọn file ảnh khác
        String uploadPath = Constant.DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        try {
            Part filePart = req.getPart("icon");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String fname = System.currentTimeMillis() + "_" + fileName;
                filePart.write(uploadPath + File.separator + fname);
                category.setIcon(fname); // Set ảnh mới
            } else {
                // Nếu không chọn ảnh mới, giữ lại ảnh cũ trong DB
                Category oldCategory = cateService.get(id);
                category.setIcon(oldCategory.getIcon());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cateService.edit(category);
        
        // Sửa lại chỗ này: Sau khi sửa xong phải chuyển hướng về lại trang danh sách
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
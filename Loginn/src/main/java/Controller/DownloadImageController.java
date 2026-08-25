package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Constant;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/image") // <-- Cực kỳ quan trọng: Phải khớp với /image trong thẻ c:url của file JSP
public class DownloadImageController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        // Lấy tên file truyền từ giao diện lên (ví dụ: category/abc.png hoặc abc.png)
        String fileName = req.getParameter("fname");
        
        if (fileName != null && !fileName.trim().isEmpty()) {
            File file = new File(Constant.DIR + "/" + fileName);
            
            resp.setContentType("image/png");
            
            // Nếu file thực sự có trên ổ đĩa thì đẩy dữ liệu ra cho trình duyệt hiển thị
            if (file.exists()) {
                Files.copy(file.toPath(), resp.getOutputStream());
            }
        }
    }
}

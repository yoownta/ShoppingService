package Controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Model.User;
import Service.UserService;
import Service.UserServiceImpl;

@WebServlet({
    "/",
    "/home",
    "/login",
    "/register",
    "/waiting",
    "/logout",
    "/error"
})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        switch (path) {
            case "/":
            case "/home":
                request.getRequestDispatcher("/views/index.jsp").forward(request, response);
                break;

            case "/login":
                // Đã loại bỏ cookie, luôn mở trang đăng nhập sạch sẽ
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                break;

            case "/register":
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                break;

            case "/waiting":
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("account") != null) {
                    User u = (User) session.getAttribute("account");
                    
                    String contextPath = request.getContextPath();
                    if (u.getRoleid() == 1) {
                        response.sendRedirect(contextPath + "/admin/category/list");
                    } else {
                        response.sendRedirect(contextPath + "/home");
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/login");
                }
                break;

            case "/logout":
                HttpSession sessionLogOut = request.getSession(false);
                if (sessionLogOut != null) {
                    sessionLogOut.invalidate(); // Hủy session khi đăng xuất
                }
                response.sendRedirect(request.getContextPath() + "/login");
                break;

            case "/error":
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
                break;

            default:
                request.getServletContext().getNamedDispatcher("default").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String path = request.getServletPath();
        UserService userService = new UserServiceImpl();

        // Xử lý logic ĐĂNG NHẬP
        if ("/login".equals(path)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println("--- Đang nhận request đăng nhập với User: [" + username + "] và Pass: [" + password + "]");
            
            if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                request.setAttribute("alert", "Tài khoản hoặc mật khẩu không được rỗng!");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }

            User user = userService.login(username, password);
            System.out.println("--- Kết quả trả về từ Service: " + user);

            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("account", user);

                // Sửa đoạn sendRedirect thành như sau để tránh lỗi 400:
                String contextPath = request.getContextPath();
                response.sendRedirect(contextPath + "/waiting");
                return;
            } else {
                request.setAttribute("alert", "Tài khoản hoặc mật khẩu không đúng!");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } 
        // Xử lý logic ĐĂNG KÝ
        else if ("/register".equals(path)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");

            if (userService.checkExistEmail(email)) {
                request.setAttribute("alert", "Email đã tồn tại!");
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                return;
            }

            if (userService.checkExistUsername(username)) {
                request.setAttribute("alert", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                return;
            }

            boolean isSuccess = userService.register(username, password, email, fullname, phone);
            if (isSuccess) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("alert", "Lỗi hệ thống khi đăng ký!");
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            }
        }
    }
}
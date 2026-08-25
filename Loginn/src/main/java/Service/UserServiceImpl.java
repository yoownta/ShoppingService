package Service;

import DAO.UserDao;
import DAO.UserDaoImpl; // Hoặc package chứa UserDaoImpl của bạn
import Model.User;
public class UserServiceImpl implements UserService {
    
    // Khởi tạo tầng DAO để gọi xuống Database
    UserDao userDao = new UserDaoImpl();

    @Override
    public User get(String username) {
        return userDao.get(username);
    }

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public boolean register(String username, String password, String email, String fullname, String phone) {
        // Kiểm tra xem username đã tồn tại chưa trước khi insert
        if (userDao.checkExistUsername(username)) {
            return false;
        }
        
        // Lấy ngày hiện tại để làm createdDate
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        
        // Gán roleid = 5 (User thường mặc định) và avatar = null
        User newUser = new User(0, email, username, fullname, password, null, 5, phone, date);
        
        // Gọi DAO để lưu vào CSDL
        userDao.insert(newUser);
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }
}
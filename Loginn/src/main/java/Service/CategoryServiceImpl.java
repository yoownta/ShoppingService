package Service; // Thay đổi package cho khớp với project của bạn

import java.io.File;
import java.util.List;
import DAO.CategoryDAO;
import DAO.CategoryDAOImpl;
import Model.Category;

public class CategoryServiceImpl implements CategoryService {
    
    CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    public void insert(Category category) {
        categoryDAO.insert(category);
    }

    @Override
    public void edit(Category newCategory) {
        Category oldCategory = categoryDAO.get(newCategory.getId());
        oldCategory.setName(newCategory.getName());
        
        if (newCategory.getIcon() != null) {
            // Xóa ảnh cũ nếu có thay đổi ảnh mới
            String fileName = oldCategory.getIcon();
            final String dir = "E:\\upload"; // Đường dẫn thư mục lưu trữ file theo slide[cite: 5]
            File file = new File(dir + "/" + fileName);
            if (file.exists()) {
                file.delete();
            }
            oldCategory.setIcon(newCategory.getIcon());
        }
        categoryDAO.edit(oldCategory);
    }

    @Override
    public void delete(int id) {
        categoryDAO.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryDAO.get(id);
    }

    @Override
    public Category get(String name) {
        return categoryDAO.get(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryDAO.getAll();
    }

    @Override
    public List<Category> search(String keyword) {
        return categoryDAO.search(keyword);
    }
}
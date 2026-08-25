package Model;

public class Category {
    private int id;        // Tương ứng với cateid trong slide
    private String name;   // Tương ứng với catename trong slide
    private String icon;   // Tương ứng với icon trong slide

    // Constructor mặc định (Không tham số)
    public Category() {
    }

    // Constructor đầy đủ tham số
    public Category(int id, String name, String icon) {
        this.id = id;
        this.name = name;
        this.icon = icon;
    }

    // Các hàm Getters và Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
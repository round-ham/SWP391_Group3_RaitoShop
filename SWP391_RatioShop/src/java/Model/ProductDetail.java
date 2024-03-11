
package Model;


public class ProductDetail {
    private int id;
    private Product product;
    private Size size;
    private Color color;
    private int quantity;
    private String productImage;

    public ProductDetail() {
    }

    public ProductDetail(int id, Product product, Size size, Color color, int quantity, String productImage) {
        this.id = id;
        this.product = product;
        this.size = size;
        this.color = color;
        this.quantity = quantity;
        this.productImage = productImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
    
    
    
}

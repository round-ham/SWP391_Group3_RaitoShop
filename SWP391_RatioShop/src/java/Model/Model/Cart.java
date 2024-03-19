
package Model;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.ProductDetailDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    private Item getItemById(int id,int sizeId, int colorId ) {

        for (Item i : items) {
            if (i.getProduct().getProduct().getProductId() == id && i.getProduct().getSize().getSizeId() == sizeId && i.getProduct().getColor().getColorId() == colorId) {
                return i;
            }
        }

        return null;
    }
    
    public int getQuantityById(int id,int sId, int mId ) {
        return getItemById(id,sId,mId).getQuantity();
    }

    public void addItem(Item i) {
        if (getItemById(i.getProduct().getProduct().getProductId(),i.getProduct().getSize().getSizeId(),i.getProduct().getColor().getColorId()) != null) {
            Item oldItem = getItemById(i.getProduct().getProduct().getProductId(),i.getProduct().getSize().getSizeId(),i.getProduct().getColor().getColorId());
            oldItem.setQuantity(oldItem.getQuantity() + i.getQuantity());
        } else {
            items.add(i);
        }
    }
    public static void main(String[] args) {
        ProductDetailDAO dao = new ProductDetailDAO();
        List<ProductDetail> list = dao.getAllProductDetails();
        Cart ca = new Cart("1:6:9:1/1:8:9:1", list);
        System.out.println(ca.getQuantityById(1, 6, 9));
        ProductDetail pd = ca.getProductById(1, 6, 9, list);
        System.out.println(pd.getColor().getColor() + pd.getSize().getSize());
        Item i = new Item(pd, 4, pd.getProduct().getUnitPrice());
        ca.addItem(i);
        for(Item it : ca.items){
            System.out.println(it.getProduct().getProduct().getProductName());
        }
        System.out.println(ca.getTotalMoney());
    }
    public void removeItem(int id,int sId, int mId) {
        if (getItemById(id,sId,mId) != null) {
            items.remove(getItemById(id,sId,mId));
        }
    }

    public double getTotalMoney() {
        double total = 0;

        for (Item i : items) {
            total += i.getQuantity() * i.getPrice();
        }

        return total;
    }

    private  ProductDetail getProductById(int pId,int sizeId, int colorId, List<ProductDetail> list) {
        for (ProductDetail x : list) {
            if (x.getProduct().getProductId() == pId && x.getSize().getSizeId() == sizeId && x.getColor().getColorId() == colorId) {
                return x;
            }
        }
        return null;
    }
    
    public Cart(String txt, List<ProductDetail> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] listP = txt.split("/");
                for (String p : listP) {
                    String[] info = p.split(":");
                    int pId = Integer.parseInt(info[0]);
                    int sizeId = Integer.parseInt(info[1]);
                    int colorId = Integer.parseInt(info[2]);
                    int quantity = Integer.parseInt(info[3]);
                    ProductDetail product = getProductById(pId, sizeId, colorId, list);
                    Item i = new Item(product, quantity, product.getProduct().getUnitPrice());
                    addItem(i);
                }
            }
        } catch (NumberFormatException e){
            
        }

    }
}

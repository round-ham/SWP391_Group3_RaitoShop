package Model;


public class Color {
    private int colorId;
    private String color;

    public Color() {
    }

    public Color(int colorId, String color) {
        this.colorId = colorId;
        this.color = color;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    
}

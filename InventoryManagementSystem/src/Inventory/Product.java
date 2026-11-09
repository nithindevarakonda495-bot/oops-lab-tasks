package Inventory;

public class Product {
    private int productId;
    private String productName;
    private Category category;
    private double price;
    private int stock;

    public Product(int productId, String productName, Category category, double price, int stock) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.stock = stock;
    }

    public int getProductId() { return productId; }
    public String getProductName() { return productName; }
    public Category getCategory() { return category; }
    public double getPrice() { return price; }
    public int getStock() { return stock; }

    public void setPrice(double price) { this.price = price; }

    public void addStock(int qty) {
        stock = stock + qty;
        System.out.println("Stock Added. New Stock: " + stock);
    }

    public void sellProduct(int qty) {
        if (stock == 0) {
            throw new RuntimeException("Stock is Zero! Cannot Sell.");
        }
        if (qty > stock) {
            System.out.println("Not enough stock! Available: " + stock);
        } else {
            stock = stock - qty;
            System.out.println("Sold Successfully. Remaining Stock: " + stock);
        }
    }

    public void display() {
        System.out.println(productId + " | " + productName + " | " + category + " | Rs." + price + " | Stock: " + stock);
    }
}
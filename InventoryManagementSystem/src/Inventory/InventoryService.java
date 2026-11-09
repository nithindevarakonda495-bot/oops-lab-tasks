package Inventory;

import java.util.*;

public class InventoryService {
    private Map<Integer, Product> products = new HashMap<>();

    public void addProduct(Product p) {
        products.put(p.getProductId(), p);
        System.out.println("Product Added Successfully!");
    }

    public void searchById(int id) {
        if (products.containsKey(id)) {
            products.get(id).display();
        } else {
            System.out.println("Product Not Found!");
        }
    }

    public void updatePrice(int id, double newPrice) {
        if (products.containsKey(id)) {
            products.get(id).setPrice(newPrice);
            System.out.println("Price Updated!");
        } else {
            System.out.println("Product Not Found!");
        }
    }

    public void addStock(int id, int qty) {
        if (products.containsKey(id)) {
            products.get(id).addStock(qty);
        } else {
            System.out.println("Product Not Found!");
        }
    }

    public void sellProduct(int id, int qty) {
        if (products.containsKey(id)) {
            try {
                products.get(id).sellProduct(qty);
            } catch (RuntimeException e) {
                System.out.println("Error: " + e.getMessage());
            }
        } else {
            System.out.println("Product Not Found!");
        }
    }

    public void showAll() {
        if (products.isEmpty()) {
            System.out.println("No Products Available!");
        } else {
            for (Product p : products.values()) {
                p.display();
            }
        }
    }

    public void showLowStock() {
        System.out.println("--- Low Stock Products (Below 5) ---");
        for (Product p : products.values()) {
            if (p.getStock() < 5) {
                p.display();
            }
        }
    }

    public void deleteProduct(int id) {
        if (products.remove(id) != null) {
            System.out.println("Product Deleted!");
        } else {
            System.out.println("Product Not Found!");
        }
    }

    public Product getProduct(int id) {
        return products.get(id);
    }
}
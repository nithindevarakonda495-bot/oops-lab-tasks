package Inventory;

public class Bill {
    public static double calculateBillTotal(Product p, int qty) {
        double total = p.getPrice() * qty;
        System.out.println("Bill Total for " + p.getProductName() + " x " + qty + " = Rs." + total);
        return total;
    }
}
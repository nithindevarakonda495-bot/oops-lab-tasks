package Inventory;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        InventoryService service = new InventoryService();

        service.addProduct(new Product(101, "HP Laptop", Category.LAPTOP, 55000, 10));
        service.addProduct(new Product(102, "Samsung Phone", Category.MOBILE, 20000, 4));
        service.addProduct(new Product(103, "Keyboard", Category.ACCESSORY, 999, 20));

        int choice;
        do {
            System.out.println("\n--- INVENTORY MANAGEMENT ---");
            System.out.println("1. Add Product");
            System.out.println("2. Search by ID");
            System.out.println("3. Update Price");
            System.out.println("4. Add Stock");
            System.out.println("5. Sell Product");
            System.out.println("6. Show All Products");
            System.out.println("7. Low Stock (Below 5)");
            System.out.println("8. Calculate Bill");
            System.out.println("9. Delete Product");
            System.out.println("0. Exit");
            System.out.print("Enter Choice: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Enter ID, Name, Price, Stock: ");
                    int id = sc.nextInt();
                    String name = sc.next();
                    double price = sc.nextDouble();
                    int stock = sc.nextInt();
                    service.addProduct(new Product(id, name, Category.LAPTOP, price, stock));
                    break;
                case 2:
                    System.out.print("Enter ID: ");
                    service.searchById(sc.nextInt());
                    break;
                case 3:
                    System.out.print("Enter ID and New Price: ");
                    service.updatePrice(sc.nextInt(), sc.nextDouble());
                    break;
                case 4:
                    System.out.print("Enter ID and Qty: ");
                    service.addStock(sc.nextInt(), sc.nextInt());
                    break;
                case 5:
                    System.out.print("Enter ID and Qty: ");
                    service.sellProduct(sc.nextInt(), sc.nextInt());
                    break;
                case 6:
                    service.showAll();
                    break;
                case 7:
                    service.showLowStock();
                    break;
                case 8:
                    System.out.print("Enter ID and Qty: ");
                    int bid = sc.nextInt();
                    int qty = sc.nextInt();
                    Product p = service.getProduct(bid);
                    if (p != null) Bill.calculateBillTotal(p, qty);
                    else System.out.println("Product Not Found!");
                    break;
                case 9:
                    System.out.print("Enter ID: ");
                    service.deleteProduct(sc.nextInt());
                    break;
            }
        } while (choice != 0);
        System.out.println("Thank You!");
        sc.close();
    }
}
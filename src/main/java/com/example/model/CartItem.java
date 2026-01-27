package com.example.model;

public class CartItem {

    private Long bookId;
    private String bookName;
    private double price;
    private int quantity;

    public CartItem(Long bookId, String bookName, double price, int quantity) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.price = price;
        this.quantity = quantity;
    }

    public Long getBookId() { return bookId; }
    public String getBookName() { return bookName; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getSubtotal() { return price * quantity; }
}


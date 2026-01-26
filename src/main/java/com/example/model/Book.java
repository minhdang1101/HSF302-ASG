package com.example.model;

import jakarta.persistence.*;

@Entity

@Table(name = "book") // Tên bảng trong PostgreSQL
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    private int bookId;

    @Column(name = "book_name")
    private String bookName;

    @Column(name = "price")
    private double price;

    @Column(name = "cover_pics")
    private String coverPics;

    @Column(name = "author")
    private String author;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    public Book() {}

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setCoverPics(String coverPics) {
        this.coverPics = coverPics;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getBookId() {
        return bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public String getCoverPics() {
        return coverPics;
    }

    public String getAuthor() {
        return author;
    }

    public double getPrice() {
        return price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
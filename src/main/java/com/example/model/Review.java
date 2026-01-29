package com.example.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Long reviewId;

    // ===== USER =====
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id", nullable = false)
    private User user;

    // ===== BOOK =====
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "book_id", nullable = false)
    private Book book;

    @Column(name = "rating")
    private Integer rating; // 1–5

    @Column(name = "comment", columnDefinition = "TEXT")
    private String comment;

    @Column(name = "created_date")
    private LocalDateTime createdDate;

    @Column(name = "status")
    private Integer status;

    // ===== Constructors =====
    public Review() {
        this.createdDate = LocalDateTime.now();
        this.status = 1;
    }

    // ===== Getter & Setter =====
    public Long getReviewId() {
        return reviewId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public Integer getStatus() {
        return status;
    }
}

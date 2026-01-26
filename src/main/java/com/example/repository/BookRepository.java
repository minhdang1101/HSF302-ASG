package com.example.repository;

import com.example.model.Book;
import com.example.model.Category;
import org.springframework.stereotype.Repository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BookRepository {

    private static EntityManagerFactory emf;

    public BookRepository() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("JPAS"); 
        }
    }

    public List<Book> getAllBooks() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("SELECT b FROM Book b", Book.class).getResultList();
        }
    }

    public List<Book> searchBooks(String keyword) {
        try (EntityManager em = emf.createEntityManager()) {
            String jpql = "SELECT b FROM Book b WHERE LOWER(b.bookName) LIKE LOWER(:kw)";
            return em.createQuery(jpql, Book.class)
                    .setParameter("kw", "%" + keyword + "%")
                    .getResultList();
        }
    }

    public List<Book> getBooksByCategory(int cateId) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("SELECT b FROM Book b WHERE b.category.categoryId = :id", Book.class)
                    .setParameter("id", cateId)
                    .getResultList();
        }
    }

    public List<Book> getTopSellingBooks(int limit) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("SELECT b FROM Book b ORDER BY b.price DESC", Book.class)
                    .setMaxResults(limit)
                    .getResultList();
        }
    }

    public List<Category> getAllCategories() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("SELECT c FROM Category c", Category.class).getResultList();
        }
    }

    public List<Book> findBooksByCriteria(String keyword, Integer cateId, Double minPrice, Double maxPrice) {
        try (EntityManager em = emf.createEntityManager()) {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Book> cq = cb.createQuery(Book.class);
            Root<Book> book = cq.from(Book.class);
            List<Predicate> predicates = new ArrayList<>();

            if (keyword != null && !keyword.isEmpty()) {
                predicates.add(cb.like(cb.lower(book.get("bookName")), "%" + keyword.toLowerCase() + "%"));
            }
            if (cateId != null) {
                predicates.add(cb.equal(book.get("category").get("categoryId"), cateId));
            }

            if (minPrice != null) {
                predicates.add(cb.ge(book.get("price"), minPrice));
            }
            if (maxPrice != null) {
                predicates.add(cb.le(book.get("price"), maxPrice));
            }

            cq.where(predicates.toArray(new Predicate[0]));
            return em.createQuery(cq).getResultList();
        }
    }
}
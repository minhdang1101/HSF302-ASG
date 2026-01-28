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
        emf = Persistence.createEntityManagerFactory("JPAS");
    }
    public Book getBookById(Long bookId) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery(
                            "SELECT b FROM Book b " +
                                    "LEFT JOIN FETCH b.category " +
                                    "WHERE b.bookId = :id",
                            Book.class
                    )
                    .setParameter("id", bookId)
                    .getSingleResult();
        }
    }

}

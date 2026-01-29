package com.example.repository;

import com.example.model.Review;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewRepository {

    private static EntityManagerFactory emf;

    public ReviewRepository() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("JPAS");
        }
    }

    public List<Review> findByBookId(Long bookId) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery(
                            "SELECT r FROM Review r " +
                                    "JOIN FETCH r.user " +
                                    "WHERE r.book.bookId = :bookId " +
                                    "AND r.status = 1 " +
                                    "ORDER BY r.createdDate DESC",
                            Review.class
                    )
                    .setParameter("bookId", bookId)
                    .getResultList();
        }
    }

    public void save(Review review) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(review);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}

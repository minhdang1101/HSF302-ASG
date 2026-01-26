package com.example.repository;

import com.example.model.Banner;
import org.springframework.stereotype.Repository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

@Repository
public class BannerRepository {

    private static EntityManagerFactory emf;

    public BannerRepository() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("JPAS");
        }
    }

    public List<Banner> getAllBanners() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("SELECT b FROM Banner b WHERE b.isActive = true", Banner.class)
                     .getResultList();
        }
    }
    
    public void save(Banner banner) {
        try (EntityManager em = emf.createEntityManager()) {
            em.getTransaction().begin();
            em.persist(banner);
            em.getTransaction().commit();
        }
    }
}

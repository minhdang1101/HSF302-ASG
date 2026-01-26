package com.example.service;

import com.example.model.Book;
import com.example.model.Category;
import com.example.repository.BookRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BookService {

    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> getTopSellingBooks(int limit) {
        return bookRepository.getTopSellingBooks(limit);
    }

    public List<Category> getAllCategories() {
        return bookRepository.getAllCategories();
    }

    public List<Book> getAllBooks() {
        return bookRepository.getAllBooks();
    }

    public List<Book> searchBooks(String keyword) {
        return bookRepository.searchBooks(keyword);
    }

    public List<Book> getBooksByCategory(int cateId) {
        return bookRepository.getBooksByCategory(cateId);
    }

    public List<Book> findBooksByCriteria(String keyword, Integer cateId, Double minPrice, Double maxPrice) {
        return bookRepository.findBooksByCriteria(keyword, cateId, minPrice, maxPrice);
    }
}

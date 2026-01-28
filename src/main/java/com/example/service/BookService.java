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

    public Book getBookDetail(Long bookId) {
        return bookRepository.getBookById(bookId);
    }

}

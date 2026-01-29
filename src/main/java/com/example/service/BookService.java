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

    public String getPreviewContent(Long bookId) {
        Book book = bookRepository.getBookById(bookId);

        String content = book.getBookContent();
        if (content == null) return "";

        int previewLength = Math.min(content.length(), 800); // ~1–2 trang
        return content.substring(0, previewLength) + "...";
    }

}

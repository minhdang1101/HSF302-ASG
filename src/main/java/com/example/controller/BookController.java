package com.example.controller;

import com.example.model.Review;
import com.example.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.model.Book;
import com.example.service.BookService;

import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private ReviewService reviewService;
    @GetMapping("/detail")
    public String bookDetail(@RequestParam("id") Long id, Model model) {
        Book book = bookService.getBookDetail(id);
        model.addAttribute("book", book);
        List<Review> reviews = reviewService.getReviewsByBook(id);
        model.addAttribute("reviews", reviews);
        return "book-detail";
    }

    @GetMapping("/book/preview/{id}")
    public String previewBook(@PathVariable Long id, Model model) {
        Book book = bookService.getBookDetail(id);
        String preview = bookService.getPreviewContent(id);

        model.addAttribute("book", book);
        model.addAttribute("preview", preview);

        return "book-preview";
    }

}

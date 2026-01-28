package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.model.Book;
import com.example.service.BookService;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    @GetMapping("/detail")
    public String bookDetail(@RequestParam("id") Long id, Model model) {
        Book book = bookService.getBookDetail(id);
        model.addAttribute("book", book);
        return "book-detail";
    }
}

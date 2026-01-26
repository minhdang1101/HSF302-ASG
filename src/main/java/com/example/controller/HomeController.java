package com.example.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private com.example.service.BookService bookService;

    @Autowired
    private com.example.service.BannerService bannerService;

    @GetMapping("/")
    public String showHome(Model model) {
        model.addAttribute("books", bookService.getTopSellingBooks(8));
        model.addAttribute("categories", bookService.getAllCategories());
        model.addAttribute("banners", bannerService.getAllActiveBanners());
        return "home";
    }

    @GetMapping("/store")
    public String showStore(@RequestParam(name = "keyword", required = false) String keyword,
                            @RequestParam(name = "cateId", required = false) Integer cateId,
                            Model model) {
        if (keyword != null && !keyword.isEmpty()) {
            model.addAttribute("books", bookService.searchBooks(keyword));
        } else if (cateId != null) {
            model.addAttribute("books", bookService.getBooksByCategory(cateId));
        } else {
            model.addAttribute("books", bookService.getAllBooks());
        }

        model.addAttribute("categories", bookService.getAllCategories());
        return "store";
    }

    @GetMapping("/api/search")
    public String searchBooks(@RequestParam(name = "keyword", required = false) String keyword,
                              @RequestParam(name = "cateId", required = false) Integer cateId,
                              @RequestParam(name = "minPrice", required = false) Double minPrice,
                              @RequestParam(name = "maxPrice", required = false) Double maxPrice,
                              Model model) {
        
        model.addAttribute("books", bookService.findBooksByCriteria(keyword, cateId, minPrice, maxPrice));
        return "fragments/book-list";
    }
}
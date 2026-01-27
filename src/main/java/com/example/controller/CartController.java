package com.example.controller;

import com.example.model.Book;
import com.example.model.CartItem;
import com.example.repository.BookRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private BookRepository bookRepository;

    private List<CartItem> getCart(HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @GetMapping
    public String viewCart(HttpSession session, Model model) {
        model.addAttribute("cart", getCart(session));
        return "cart";
    }

    @GetMapping("/add/{bookId}")
    public String addToCart(@PathVariable Long bookId, HttpSession session) {
        Book book = bookRepository.findById(bookId).orElse(null);
        if (book == null) return "redirect:/";

        List<CartItem> cart = getCart(session);

        for (CartItem item : cart) {
            if (item.getBookId().equals(bookId)) {
                item.setQuantity(item.getQuantity() + 1);
                return "redirect:/cart";
            }
        }

        cart.add(new CartItem(bookId, book.getBookName(), book.getPrice(), 1));
        return "redirect:/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam List<Long> bookId,
                             @RequestParam List<Integer> quantity,
                             HttpSession session) {

        List<CartItem> cart = getCart(session);

        for (int i = 0; i < bookId.size(); i++) {
            Long id = bookId.get(i);
            int qty = quantity.get(i);

            for (CartItem item : cart) {
                if (item.getBookId().equals(id) && qty > 0) {
                    item.setQuantity(qty);
                }
            }
        }
        return "redirect:/cart";
    }

    @GetMapping("/remove/{bookId}")
    public String removeItem(@PathVariable Long bookId, HttpSession session) {
        List<CartItem> cart = getCart(session);
        cart.removeIf(item -> item.getBookId().equals(bookId));
        return "redirect:/cart";
    }
}

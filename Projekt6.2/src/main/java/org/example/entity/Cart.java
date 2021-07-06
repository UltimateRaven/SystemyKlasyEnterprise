package org.example.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="kosze")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    public Cart() {}

    public Cart(String id) {
        this.id = Integer.parseInt(id);
    }

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "cart",cascade = CascadeType.ALL)
    List<Book> books;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Book> getBooks() {
        return books;
    }
    public void setBooks(List<Book> books) {
        this.books = books;
    }
    public void addBook(Book book){
        if (books.isEmpty()) {
            books = new ArrayList<>();
        }
        book.setCart(this);
        books.add(book);
    }

    @Override
    public String toString() {
        return "Koszyk{" +
                "id=" + id +
                ", books=" + books +
                '}';
    }
}

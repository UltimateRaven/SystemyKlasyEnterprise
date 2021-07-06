package org.example.services;

import org.example.entity.Author;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AuthorService {

    List<Author> getAuthor();
    void saveAuthor(Author author);
    Author getAuthor(int authorId);
    void deleteAuthor(int authorId);
}

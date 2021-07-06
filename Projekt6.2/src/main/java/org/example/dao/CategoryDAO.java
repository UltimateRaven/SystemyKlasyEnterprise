package org.example.dao;

import org.example.entity.Category;

import java.util.List;

public interface CategoryDAO {
    List<Category> getCategories();
    void saveCategory(Category category);
    Category getCategory(int categoryId);
    void deleteCategory(int categoryId);
}

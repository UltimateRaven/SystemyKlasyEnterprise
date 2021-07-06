package org.example.dao;

import org.example.entity.Cart;
import org.example.entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDAOImpl implements CartDAO {

    //automatyczne wykorzystanie beana sessionFactory
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public List<Cart> getCarts() {
        //sesja hibertabe
        Session currentSession = sessionFactory.getCurrentSession();
        //zapytanie
        Query<Cart> query = currentSession.createQuery("from Cart", Cart.class);
        List<Cart> cart = query.getResultList();
        return cart;
    }

    @Override
    public void saveCart(Cart cart) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(cart);
    }

    @Override
    public Cart getCart(int cartId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Cart.class, cartId);
    }

    @Override
    public void deleteCart(int cartId) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(cartId);
    }
}

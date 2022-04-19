package com.mgd.sale.dao;

import com.mgd.sale.domain.Product;

import java.util.List;

public interface ProductDao {

    List<Product> selectProducts();

    Product selectProductById(int id);
}

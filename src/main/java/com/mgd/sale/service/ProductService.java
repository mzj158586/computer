package com.mgd.sale.service;

import com.mgd.sale.domain.Product;

import java.util.List;

public interface ProductService {

     Product selectProductById(int id);

    List<Product> selectProducts();

}

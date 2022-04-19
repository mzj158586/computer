package com.mgd.sale.service.impl;

import com.mgd.myexception.ProductException;
import com.mgd.sale.dao.ProductDao;
import com.mgd.sale.domain.Product;
import com.mgd.sale.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author : 梅广东
 * @Date : 2022/4/16 10:57
 * @Description :
 **/
@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;

    @Override
    public Product selectProductById(int id) {

        Product product = productDao.selectProductById(id);

        return product;
    }

    @Override
    public List<Product> selectProducts() {
        List<Product> products = productDao.selectProducts();
        if (products==null){
            throw  new ProductException("商品没有找到");
        }
        return products;
    }
}

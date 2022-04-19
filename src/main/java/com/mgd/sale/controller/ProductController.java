package com.mgd.sale.controller;

import com.mgd.sale.domain.Product;
import com.mgd.sale.service.ProductService;
import com.mgd.vo.ResultVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author : 梅广东
 * @Date : 2022/4/16 10:52
 * @Description :
 **/
@Controller
@RequestMapping("/sale")
public class ProductController {

    @Resource
    private ProductService productService;


    @ResponseBody
    @RequestMapping("/selectProducts.do")
    public ResultVo doSaleProducts(){
        List<Product> products = productService.selectProducts();
        ResultVo success = ResultVo.success();
        success.setResult(products);
        return success;
    }

    /**
     * description : 选择商品
     * @date : 2022/4/16 11:50
      * @param id:
      * @return: com.mgd.vo.ResultVo
     */

    @RequestMapping("/selectProductById.do")
    public ModelAndView doSelectProductById(int id, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        Product product = productService.selectProductById(id);
        mv.addObject("product",product);
        if (product==null){
            mv.setViewName("/web/index.jsp");
        }else {
            mv.setViewName("/web/product.jsp");
        }

        return mv;
    }

}

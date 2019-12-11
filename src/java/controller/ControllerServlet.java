/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.ShoppingCart;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session_bean.CategorySessionBean;
import session_bean.ProductSessionBean;

/**
 *
 * @author Nguyen Minh Dang
 */
@WebServlet(name = "ControllerServlet", urlPatterns = {"/ControllerServlet", 
                                                       "/productList", 
                                                       "/productDetail",
                                                       "/product-list",
                                                       "/addToCart",
                                                       "/checkout"
})
public class ControllerServlet extends HttpServlet {
    
    @EJB
    ProductSessionBean prod;
    @EJB
    CategorySessionBean cate;
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        String servletPath = request.getServletPath();
        if (servletPath.equals("/productList")){
            int page = 1;
            int prodsPerPage = 12;
            if (request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            int a = (page-1)*prodsPerPage;
            List<Product> list = prod.findRange(new int[]{a, a + prodsPerPage});
            int noOfProds = prod.count();
            int noOfPages = (int) Math.ceil(noOfProds * 1.0 / prodsPerPage);
            session.setAttribute("productList", list);
            session.setAttribute("noOfPages", noOfPages);
            session.setAttribute("currentPage", page);
            request.setAttribute("title", "Product List");
        } 
        if (servletPath.equals("/productDetail")){
            int id;
            if (request.getParameter("id") != null){
                id = Integer.parseInt(request.getParameter("id"));
                Product selectedProd = prod.find(id);
                session.setAttribute("prods", selectedProd);
                request.setAttribute("title", selectedProd.getName());
            }
        }
        if (servletPath.equals("/product-list")){
            int cateid;
            cateid = Integer.parseInt(request.getParameter("cate"));
            Category selectedcate = cate.find(cateid);
            List<Product> cateprods = (List<Product>)selectedcate.getProductCollection();
            session.setAttribute("cate", selectedcate);
            session.setAttribute("prods", cateprods);
            request.setAttribute("title", selectedcate.getName());
        }
        if (servletPath.equals("/checkout")){
            String clear = request.getParameter("clear");
            if ((clear != null) && clear.equals("true")){
                ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                cart.clear();
            }
        }
        if (servletPath.equals("/addToCart")) {
            // if user is adding item to cart for first time
            // create cart object and attach it to user session
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

            if (cart == null) {
                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }
            // get user input from request
            if (request.getParameter("id") != null) {
                Product product = prod.find(Integer.parseInt(request.getParameter("id")));
                cart.addItem(product);
                request.setAttribute("title", product.getCateID());
            }
            String userView = (String) session.getAttribute("view");

            servletPath = userView;
        }

        
        String url = servletPath + ".jsp";
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{   
    }
}

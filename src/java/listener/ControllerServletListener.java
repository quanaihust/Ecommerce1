/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import session_bean.CategorySessionBean;
import session_bean.ProductSessionBean;

/**
 * Web application lifecycle listener.
 *
 * @author Nguyen Minh Dang
 */
public class ControllerServletListener implements ServletContextListener {
    
    @EJB
    ProductSessionBean productSessionBean;
    @EJB
    CategorySessionBean categorySessionBean;
    ServletContext context;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = sce.getServletContext();
        context.setAttribute("newProducts", productSessionBean.findRange(new int[]{0, 8}));
        context.setAttribute("newCategory", categorySessionBean.findAll());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        this.context = null;
    }
}

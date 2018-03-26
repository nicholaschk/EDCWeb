package com.sdm.edc.web;

import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.SessionHolder;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sdm.edc.util.Config;

public class StartupListener extends ContextLoaderListener implements
		ServletContextListener {

	private static ApplicationContext ctx = null;
	public void contextInitialized(ServletContextEvent event) {
		try {
			// call Spring's context ContextLoaderListener to initialize
			// all the context files specified in web.xml
			try {
				super.contextInitialized(event);
			} catch (Exception ex) {
				ex.printStackTrace();

			}
			ServletContext context = event.getServletContext();

			ctx = WebApplicationContextUtils
					.getRequiredWebApplicationContext(event.getServletContext());

			context.setAttribute("context", ctx);
//
//			SessionFactory ssf = null;
//
//			ssf = (SessionFactory) ctx.getBean("sessionFactory");
//
//			Session session = ssf.openSession();
//
//			TransactionSynchronizationManager.bindResource(ssf,
//					new SessionHolder(session));
			context.setAttribute("traceNumber", new AtomicInteger(0));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}


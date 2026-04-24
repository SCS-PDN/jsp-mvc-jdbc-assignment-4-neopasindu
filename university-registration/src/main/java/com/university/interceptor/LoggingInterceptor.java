package com.university.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

public class LoggingInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(LoggingInterceptor.class.getName());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String method = request.getMethod();
        String uri = request.getRequestURI();

        if ("POST".equals(method) && uri.endsWith("/login")) {
            logger.info("[LOGIN ATTEMPT] email=" + request.getParameter("email"));
        } else if ("POST".equals(method) && uri.contains("/register/")) {
            logger.info("[REGISTRATION ATTEMPT] " + uri
                        + " student=" + getStudentName(request));
        }

        logger.info("[REQUEST] " + method + " " + uri);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) {
        String method = request.getMethod();
        String uri = request.getRequestURI();

        if ("POST".equals(method) && uri.endsWith("/login")) {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("student") != null) {
                logger.info("[LOGIN SUCCESS] email=" + request.getParameter("email"));
            } else {
                logger.info("[LOGIN FAILED] email=" + request.getParameter("email"));
            }
        } else if ("POST".equals(method) && uri.contains("/register/")) {
            logger.info("[REGISTRATION SUCCESS] " + uri
                        + " student=" + getStudentName(request));
        }
    }

    private String getStudentName(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("student") != null) {
            com.university.model.Student s =
                (com.university.model.Student) session.getAttribute("student");
            return s.getName();
        }
        return "unknown";
    }
}

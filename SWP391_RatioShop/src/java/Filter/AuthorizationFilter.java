/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package Filter;

import Model.Accounts;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;

/**
 *
 * @author vietd
 */
public class AuthorizationFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with. If
    // this value is null, this filter instance is not currently
    // configured.
    private FilterConfig filterConfig = null;

    public AuthorizationFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthorizationFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
         * for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
         * String name = (String)en.nextElement();
         * String values[] = request.getParameterValues(name);
         * int n = values.length;
         * StringBuffer buf = new StringBuffer();
         * buf.append(name);
         * buf.append("=");
         * for(int i=0; i < n; i++) {
         * buf.append(values[i]);
         * if (i < n-1)
         * buf.append(",");
         * }
         * log(buf.toString());
         * }
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthorizationFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed.
        /*
         * for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
         * String name = (String)en.nextElement();
         * Object value = request.getAttribute(name);
         * log("attribute: " + name + "=" + value.toString());
         * 
         * }
         */
        // For example, a filter might append something to the response.
        /*
         * PrintWriter respOut = new PrintWriter(response.getWriter());
         * respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request  The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain    The filter chain we are processing
     *
     * @exception IOException      if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("AuthorizationFilter:doFilter()");
        }

        doBeforeProcessing(request, response);

        // Lấy ra url pattern hiện tại
        // Kiểm tra xem url pattern hiện tại có trong danh sách url pattern không
        // Nếu có thì kiểm tra xem role của user hiện tại có trong danh sách role không
        // Nếu có thì cho phép truy cập
        // Nếu không thì trả về trang login

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String url = httpRequest.getRequestURL().toString().toLowerCase();
        String uri = httpRequest.getRequestURI().toLowerCase();

        Accounts currentUser = (Accounts) httpRequest.getSession().getAttribute("account");
        String currentRole = RoleName.GUEST;
        if (currentUser != null) {
            currentRole = currentUser.getRoleName().toLowerCase();
        }

        // Continue with the filter chain
        Throwable problem = null;
        boolean isAuthorized = false;
        try {
            // nếu RouterAuthorization.routerConfigs chứa url hiện tại thì kiểm tra role
            // nếu không chứa thì cho phép truy cập
            if (RouterAuthorization.routerConfigs.stream()
                    .anyMatch((routerConfig) -> (uri.contains(routerConfig.getUrlPattern().toLowerCase())))) {

                for (RouterConfig routerConfig : RouterAuthorization.routerConfigs) {
                    if (uri.contains(routerConfig.getUrlPattern().toLowerCase())) {
                        if (routerConfig.getRoles().contains(currentRole)) {
                            isAuthorized = true;
                            break;
                        }
                    }
                }

            } else {
                isAuthorized = true;
            }

            if (isAuthorized) {
                chain.doFilter(request, response);
            } else {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            }
        } catch (ServletException | IOException t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
        }

        doAfterProcessing(request, response);
    }

    /**
     * Return the filter configuration object for this filter.
     *
     * @return
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     *
     * @param filterConfig
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthorizationFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthorizationFilter()");
        }
        StringBuilder sb = new StringBuilder("AuthorizationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                try (PrintStream ps = new PrintStream(response.getOutputStream());
                        PrintWriter pw = new PrintWriter(ps)) {
                    pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); // NOI18N

                    // PENDING! Localize this for next official release
                    pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                    pw.print(stackTrace);
                    pw.print("</pre></body>\n</html>"); // NOI18N
                }
                response.getOutputStream().close();
            } catch (IOException ex) {
            }
        } else {
            try {
                try (PrintStream ps = new PrintStream(response.getOutputStream())) {
                    t.printStackTrace(ps);
                }
                response.getOutputStream().close();
            } catch (IOException ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (IOException ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}

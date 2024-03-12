/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Filter;

import java.util.ArrayList;
import java.util.List;

class RoleName {

    public static final String CUSTOMER = "customers";
    public static final String ADMIN = "admin";
    public static final String SELLER = "seller";
    public static final String SHIPPER = "shipper";
    public static final String MARKETING = "marketing staff";
    public static final String GUEST = "guest";
}

/**
 *
 * Khai báo các url pattern theo từng role
 */
public class RouterConfig {

    private String urlPattern;
    private List<String> roles;

    public RouterConfig() {
    }

    public RouterConfig(String urlPattern, List<String> roles) {
        this.urlPattern = urlPattern;
        this.roles = roles;
    }

    public String getUrlPattern() {
        return urlPattern;
    }

    public void setUrlPattern(String urlPattern) {
        this.urlPattern = urlPattern;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
}

/**
 * Khai báo các filter trong chương trình theo từng url pattern và theo từng
 * role
 */
class RouterAuthorization {

    public static List<RouterConfig> routerConfigs = new ArrayList<RouterConfig>() {
        {
            add(new RouterConfig("/manage-brand", new ArrayList<String>() {
                {
                    add(RoleName.SELLER);
                }
            }));
               add(new RouterConfig("/manage-products", new ArrayList<String>() {
                {
                    add(RoleName.SELLER);
                }
            }));
                 add(new RouterConfig("/manage-category", new ArrayList<String>() {
                {
                    add(RoleName.SELLER);
                }
            }));
            add(new RouterConfig("/manage-orders", new ArrayList<String>() {
                {
                    add(RoleName.SELLER);
                }
            }));
             add(new RouterConfig("/sales", new ArrayList<String>() {
                {
                    add(RoleName.SELLER);
                }
            }));
            sales
               
        }
    };
}

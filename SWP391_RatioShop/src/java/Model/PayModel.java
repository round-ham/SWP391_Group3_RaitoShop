
package Model;

public class PayModel {
    public Long vnp_Ammount;
    public String vnp_OrderInfo;
    public String vnp_OrderType = "200000";
    public Long vnp_TxnRef;

    public PayModel() {
    }

    public PayModel(Long vnp_Ammount, String vnp_OrderInfo, Long vnp_TxnRef) {
        this.vnp_Ammount = vnp_Ammount;
        this.vnp_OrderInfo = vnp_OrderInfo;
        this.vnp_TxnRef = vnp_TxnRef;
    }

    public Long getVnp_Ammount() {
        return vnp_Ammount;
    }

    public void setVnp_Ammount(Long vnp_Ammount) {
        this.vnp_Ammount = vnp_Ammount * 100;
    }

    public String getVnp_OrderInfo() {
        return vnp_OrderInfo;
    }

    public void setVnp_OrderInfo(String vnp_OrderInfo) {
        this.vnp_OrderInfo = vnp_OrderInfo;
    }

    public String getVnp_OrderType() {
        return vnp_OrderType;
    }

    public void setVnp_OrderType(String vnp_OrderType) {
        this.vnp_OrderType = vnp_OrderType;
    }

    public Long getVnp_TxnRef() {
        return vnp_TxnRef;
    }

    public void setVnp_TxnRef(Long vnp_TxnRef) {
        this.vnp_TxnRef = vnp_TxnRef;
    }
    
    
}

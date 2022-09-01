package com.kbhyazilim.Entities;

public class ShoppingCart {
    private int sepetID;
    private int urunID;
    private int uyeID;
    private int adet;

    public ShoppingCart(int sepetID, int urunID, int uyeID, int adet) {
        this.sepetID = sepetID;
        this.urunID = urunID;
        this.uyeID = uyeID;
        this.adet = adet;
    }

    public ShoppingCart(int urunID, int uyeID, int adet) {
        this.urunID = urunID;
        this.uyeID = uyeID;
        this.adet = adet;
    }

    public ShoppingCart(int urunID, int uyeID) {
        this.urunID = urunID;
        this.uyeID = uyeID;
    }

    public ShoppingCart(int uyeID) {
        this.uyeID = uyeID;
    }

    public int getSepetID() {
        return sepetID;
    }

    public void setSepetID(int sepetID) {
        this.sepetID = sepetID;
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }

    public int getUyeID() {
        return uyeID;
    }

    public void setUyeID(int uyeID) {
        this.uyeID = uyeID;
    }

    public int getAdet() {
        return adet;
    }

    public void setAdet(int adet) {
        this.adet = adet;
    }
    
    
}

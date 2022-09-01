package com.kbhyazilim.Entities;

public class Order {
    private int siparisID;
    private int uyeID;
    private int urunID;
    private int adet;
    private int durum;

    public Order(int siparisID, int uyeID, int urunID, int adet, int durum) {
        this.siparisID = siparisID;
        this.uyeID = uyeID;
        this.urunID = urunID;
        this.adet = adet;
        this.durum = durum;
    }

    public Order(int uyeID, int urunID, int adet, int durum) {
        this.uyeID = uyeID;
        this.urunID = urunID;
        this.adet = adet;
        this.durum = durum;
    }

    public Order(int siparisID) {
        this.siparisID = siparisID;
    }

    public int getSiparisID() {
        return siparisID;
    }

    public void setSiparisID(int siparisID) {
        this.siparisID = siparisID;
    }

    public int getUyeID() {
        return uyeID;
    }

    public void setUyeID(int uyeID) {
        this.uyeID = uyeID;
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }

    public int getAdet() {
        return adet;
    }

    public void setAdet(int adet) {
        this.adet = adet;
    }

    public int getDurum() {
        return durum;
    }

    public void setDurum(int durum) {
        this.durum = durum;
    }
    
    
}

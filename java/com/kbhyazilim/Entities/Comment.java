package com.kbhyazilim.Entities;

public class Comment {
    private int yorumID;
    private String yorumAdSoyad;
    private String yorumIcerik;
    private String yorumTarih;
    private int yorumOnay;
    private int urunID;

    public Comment(int yorumID, String yorumAdSoyad, String yorumIcerik, String yorumTarih, int yorumOnay, int urunID) {
        this.yorumID = yorumID;
        this.yorumAdSoyad = yorumAdSoyad;
        this.yorumIcerik = yorumIcerik;
        this.yorumTarih = yorumTarih;
        this.yorumOnay = yorumOnay;
        this.urunID = urunID;
    }

    public Comment(String yorumAdSoyad, String yorumIcerik, String yorumTarih, int yorumOnay, int urunID) {
        this.yorumAdSoyad = yorumAdSoyad;
        this.yorumIcerik = yorumIcerik;
        this.yorumTarih = yorumTarih;
        this.yorumOnay = yorumOnay;
        this.urunID = urunID;
    }

    public Comment(int yorumID) {
        this.yorumID = yorumID;
    }

    public int getYorumID() {
        return yorumID;
    }

    public void setYorumID(int yorumID) {
        this.yorumID = yorumID;
    }

    public String getYorumAdSoyad() {
        return yorumAdSoyad;
    }

    public void setYorumAdSoyad(String yorumAdSoyad) {
        this.yorumAdSoyad = yorumAdSoyad;
    }

    public String getYorumIcerik() {
        return yorumIcerik;
    }

    public void setYorumIcerik(String yorumIcerik) {
        this.yorumIcerik = yorumIcerik;
    }

    public String getYorumTarih() {
        return yorumTarih;
    }

    public void setYorumTarih(String yorumTarih) {
        this.yorumTarih = yorumTarih;
    }

    public int getYorumOnay() {
        return yorumOnay;
    }

    public void setYorumOnay(int yorumOnay) {
        this.yorumOnay = yorumOnay;
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }
    
    
}

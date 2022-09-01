package com.kbhyazilim.Entities;

public class Product {
    private int UrunID;
    private String UrunAdi;
    private int UrunFiyat;
    private String UrunAciklama;
    private String UrunRenk;
    private int katNo;
    private int altNo;
    private int resimID;
    private String resim;
    private String resim_durum;

    public Product(int UrunID) {
        this.UrunID = UrunID;
    }

    public Product(int UrunID, String resim) {
        this.UrunID = UrunID;
        this.resim = resim;
    }

    public Product(int UrunID, String UrunAdi, int UrunFiyat, String UrunAciklama, String UrunRenk, int katNo, int altNo) {
        this.UrunID = UrunID;
        this.UrunAdi = UrunAdi;
        this.UrunFiyat = UrunFiyat;
        this.UrunAciklama = UrunAciklama;
        this.UrunRenk = UrunRenk;
        this.katNo = katNo;
        this.altNo = altNo;
    }
    public Product(int UrunID, String UrunAdi, int UrunFiyat, String UrunAciklama, String UrunRenk, int katNo, int altNo,String resim,String resim_durum) {
        this.UrunID = UrunID;
        this.UrunAdi = UrunAdi;
        this.UrunFiyat = UrunFiyat;
        this.UrunAciklama = UrunAciklama;
        this.UrunRenk = UrunRenk;
        this.katNo = katNo;
        this.altNo = altNo;
        this.resim = resim;
        this.resim_durum = resim_durum;
    }

    public Product(int UrunID, String UrunAdi, int UrunFiyat, String UrunAciklama, String UrunRenk, int katNo, int altNo, int resimID, String resim, String resim_durum) {
        this.UrunID = UrunID;
        this.UrunAdi = UrunAdi;
        this.UrunFiyat = UrunFiyat;
        this.UrunAciklama = UrunAciklama;
        this.UrunRenk = UrunRenk;
        this.katNo = katNo;
        this.altNo = altNo;
        this.resimID = resimID;
        this.resim = resim;
        this.resim_durum = resim_durum;
    }

    public Product(String UrunAdi, int UrunFiyat, String UrunAciklama, String UrunRenk, int katNo, int altNo) {
        this.UrunAdi = UrunAdi;
        this.UrunFiyat = UrunFiyat;
        this.UrunAciklama = UrunAciklama;
        this.UrunRenk = UrunRenk;
        this.katNo = katNo;
        this.altNo = altNo;
        
    }

    public int getUrunID() {
        return UrunID;
    }

    public void setUrunID(int UrunID) {
        this.UrunID = UrunID;
    }

    public int getResimID() {
        return resimID;
    }

    public void setResimID(int resimID) {
        this.resimID = resimID;
    }

    public String getResim() {
        return resim;
    }

    public void setResim(String resim) {
        this.resim = resim;
    }

    public String getUrunAdi() {
        return UrunAdi;
    }

    public void setUrunAdi(String UrunAdi) {
        this.UrunAdi = UrunAdi;
    }

    public int getUrunFiyat() {
        return UrunFiyat;
    }

    public void setUrunFiyat(int UrunFiyat) {
        this.UrunFiyat = UrunFiyat;
    }

    public String getUrunAciklama() {
        return UrunAciklama;
    }

    public void setUrunAciklama(String UrunAciklama) {
        this.UrunAciklama = UrunAciklama;
    }

    public String getUrunRenk() {
        return UrunRenk;
    }

    public void setUrunRenk(String UrunRenk) {
        this.UrunRenk = UrunRenk;
    }

    public int getKatNo() {
        return katNo;
    }

    public void setKatNo(int katNo) {
        this.katNo = katNo;
    }

    public int getAltNo() {
        return altNo;
    }

    public void setAltNo(int altNo) {
        this.altNo = altNo;
    }

    public String getResim_durum() {
        return resim_durum;
    }

    public void setResim_durum(String resim_durum) {
        this.resim_durum = resim_durum;
    }
    
    
}

package com.kbhyazilim.Entities;


public class Admin {
    private int no;
    private String ad;
    private String soyad;
    private String kullaniciadi;
    private String sifre;
    private String email;

    public Admin(int no, String ad, String soyad, String kullaniciadi, String sifre, String email) {
        this.no = no;
        this.ad = ad;
        this.soyad = soyad;
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
        this.email = email;
    }

    public Admin(String kullaniciadi, String sifre) {
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
    }

    public Admin(String kullaniciadi) {
        this.kullaniciadi = kullaniciadi;
    }

    public Admin(String ad, String soyad, String kullaniciadi, String sifre, String email) {
        this.ad = ad;
        this.soyad = soyad;
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
        this.email = email;
    }
    
    
    
    

    public int getNo() {
        return no;
    }   

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }

    public String getKullaniciadi() {
        return kullaniciadi;
    }

    public void setKullaniciadi(String kullaniciadi) {
        this.kullaniciadi = kullaniciadi;
    }

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}

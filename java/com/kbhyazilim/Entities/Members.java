package com.kbhyazilim.Entities;



public class Members {
    private int no;
    private String ad;
    private String soyad;
    private String kullaniciadi;
    private String sifre;
    private String email;
    private int ilceID;
    private int ilID;
    private String tarih;
    private int onay;
    private String sehirAdi;
    private String ilceAdi;
    //Constructor
    public Members(int no, String ad, String soyad, String kullaniciadi, String sifre, String email, int ilceID, int ilID, String tarih, int onay) {
        this.no = no;
        this.ad = ad;
        this.soyad = soyad;
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
        this.email = email;
        this.ilceID = ilceID;
        this.ilID = ilID;
        this.tarih = tarih;
        this.onay = onay;
     }

    public Members(int no, String ad, String soyad, String kullaniciadi, String sifre, String email, int ilID,int ilceID) {
        this.no = no;
        this.ad = ad;
        this.soyad = soyad;
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
        this.email = email;
        this.ilceID = ilceID;
        this.ilID = ilID;
    }

    public Members(String ad, String soyad, String kullaniciadi, String sifre, String email, int ilceID, int ilID, String tarih, int onay) {
        this.ad = ad;
        this.soyad = soyad;
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
        this.email = email;
        this.ilceID = ilceID;
        this.ilID = ilID;
        this.tarih = tarih;
        this.onay = onay;
    }

    public Members(int ilID, String sehirAdi) {
        this.ilID = ilID;
        this.sehirAdi = sehirAdi;
    }
    
    public Members(int no) // silme veya güncelleme işlemleri için kullanabiliriz.
    {
        this.no = no;
    }

    public Members(int ilceID , String ilceAdi ,int ilID ) {
        this.ilceID = ilceID;
        this.ilID = ilID;
        this.ilceAdi = ilceAdi;
    }

    public Members(String kullaniciadi, String sifre) {
        this.kullaniciadi = kullaniciadi;
        this.sifre = sifre;
    }

    public Members(String kullaniciadi) {
        this.kullaniciadi = kullaniciadi;
    }

    
    
    
    //Getter - Setter
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

    public int getIlceID() {
        return ilceID;
    }

    public void setIlceID(int ilceID) {
        this.ilceID = ilceID;
    }

    public int getIlID() {
        return ilID;
    }

    public void setIlID(int ilID) {
        this.ilID = ilID;
    }

    public String getTarih() {
        return tarih;
    }

    public void setTarih(String tarih) {
        this.tarih = tarih;
    }

    public int getOnay() {
        return onay;
    }

    public void setOnay(int onay) {
        this.onay = onay;
    }

    public String getSehirAdi() {
        return sehirAdi;
    }

    public void setSehirAdi(String sehirAdi) {
        this.sehirAdi = sehirAdi;
    }

    public String getIlceAdi() {
        return ilceAdi;
    }

    public void setIlceAdi(String ilceAdi) {
        this.ilceAdi = ilceAdi;
    }
    
    
}

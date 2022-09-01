package com.kbhyazilim.Entities;

public class Stok {
    private int stokID;
    private int urunID;
    private int urunAdet;
    private String urunBirim;
    private int urunKDV;

    public Stok(int stokID, int urunID, int urunAdet, String urunBirim, int urunKDV) {
        this.stokID = stokID;
        this.urunID = urunID;
        this.urunAdet = urunAdet;
        this.urunBirim = urunBirim;
        this.urunKDV = urunKDV;
    }

    public Stok(int stokID) {
        this.stokID = stokID;
    }

   
    
    
    public Stok(int urunID, int urunAdet, String urunBirim, int urunKDV) {
        this.urunID = urunID;
        this.urunAdet = urunAdet;
        this.urunBirim = urunBirim;
        this.urunKDV = urunKDV;
    }

    public Stok(int stokID, int urunID) {
        this.stokID = stokID;
        this.urunID = urunID;
    }

    public int getStokID() {
        return stokID;
    }

    public int getUrunID() {
        return urunID;
    }

    public void setUrunID(int urunID) {
        this.urunID = urunID;
    }

    public int getUrunAdet() {
        return urunAdet;
    }

    public void setUrunAdet(int urunAdet) {
        this.urunAdet = urunAdet;
    }

    public String getUrunBirim() {
        return urunBirim;
    }

    public void setUrunBirim(String urunBirim) {
        this.urunBirim = urunBirim;
    }

    public int getUrunKDV() {
        return urunKDV;
    }

    public void setUrunKDV(int urunKDV) {
        this.urunKDV = urunKDV;
    }
    
    
}

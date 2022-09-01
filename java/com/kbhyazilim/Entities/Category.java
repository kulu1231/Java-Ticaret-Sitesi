package com.kbhyazilim.Entities;

public class Category {
    private int kat_id;
    private String kat_adi;

    // Constructor
    public Category(String kat_adi) {
        this.kat_adi = kat_adi;
    }
    public Category(int kat_id, String kat_adi) {
        this.kat_id = kat_id;
        this.kat_adi = kat_adi;
    }
    public Category(int kat_id) {
        this.kat_id = kat_id;
       
    }
    
    
    
    // Getter - Setter
     public int getKat_id() {
        return kat_id;
    }

    public String getKat_adi() {
        return kat_adi;
    }

    public void setKat_adi(String kat_adi) {
        this.kat_adi = kat_adi;
    }

   
    
    
    
}

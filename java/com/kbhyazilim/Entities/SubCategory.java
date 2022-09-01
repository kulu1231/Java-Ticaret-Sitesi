package com.kbhyazilim.Entities;

public class SubCategory {
    private int altid;
    private String altadi;
    private int kat_id;

    public SubCategory(int altid, String altadi, int kat_id) {
        this.altid = altid;
        this.altadi = altadi;
        this.kat_id = kat_id;
    }

    public SubCategory(String altadi, int kat_id) {
        this.altadi = altadi;
        this.kat_id = kat_id;
    }

    public SubCategory(int altid) {
        this.altid = altid;
    }
    
    public int getAltid() {
        return altid;
    }

    public String getAltadi() {
        return altadi;
    }

    public void setAltadi(String altadi) {
        this.altadi = altadi;
    }

    public int getKat_id() {
        return kat_id;
    }

    public void setKat_id(int kat_id) {
        this.kat_id = kat_id;
    }
    
    
            
}

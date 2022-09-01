package com.kbhyazilim.Entities;


public class Slider {
    private int slider_id ;
    private String slider_adi;
    private String slider_durum;
//Constructor
public Slider(String slider_adi)
{
this.slider_adi = slider_adi;
}

public Slider (int slider_id,String slider_adi,String slider_durum)
{
this.slider_id = slider_id;
this.slider_adi = slider_adi;
this.slider_durum = slider_durum;
}
public Slider (int slider_id)
{
 this.slider_id=slider_id;
}


    public int getSlider_id() {
        return slider_id;
    }

    public String getSlider_adi() {
        return slider_adi;
    }
    
    public void setSlider_adi(String slider_adi)
    {
        this.slider_adi=slider_adi;
    }

    public String getSlider_durum() {
        return slider_durum;
    }

    public void setSlider_durum(String slider_durum) {
        this.slider_durum = slider_durum;
    }

    }



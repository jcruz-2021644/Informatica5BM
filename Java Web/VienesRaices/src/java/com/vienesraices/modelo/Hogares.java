package com.vienesraices.modelo;

/**
 *
 * @author informatica
 */
public class Hogares {

    private int codigoHogar;
    private String tipoHogar;
    private String ubicacion;
    private Double precio;
    private int codigoProveedor;

    public Hogares() {
    }

    public Hogares(int codigoHogar, String tipoHogar, String ubicacion, Double precio, int codigoProveedor) {
        this.codigoHogar = codigoHogar;
        this.tipoHogar = tipoHogar;
        this.ubicacion = ubicacion;
        this.precio = precio;
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoHogar() {
        return codigoHogar;
    }

    public void setCodigoHogar(int codigoHogar) {
        this.codigoHogar = codigoHogar;
    }

    public String getTipoHogar() {
        return tipoHogar;
    }

    public void setTipoHogar(String tipoHogar) {
        this.tipoHogar = tipoHogar;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }
    
    
}

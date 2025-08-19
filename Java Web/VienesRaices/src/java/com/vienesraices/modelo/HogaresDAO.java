
package com.vienesraices.modelo;

import com.vienesraices.config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HogaresDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Hogares> listar() {
        String sql = "call sp_ListarHogar();";
        List<Hogares> listaHogares = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Hogares hoga = new Hogares();
                hoga.setTipoHogar(rs.getString(1));
                hoga.setUbicacion(rs.getString(2));
                hoga.setPrecio(rs.getDouble(3));
                hoga.setCodigoProveedor(rs.getInt(4));
                listaHogares.add(hoga);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaHogares;
    }

    public int agregar(Hogares hog) {
        String sql = "call sp_AgregarHogar(?, ?, ?, ?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1,hog.getTipoHogar());
            ps.setString(2, hog.getUbicacion());
            ps.setDouble(3, hog.getPrecio());
            ps.setInt(4, hog.getCodigoProveedor());
            ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public int eliminar(int codigoHogar) {
        String sql = "call sp_EliminarHogar(?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoHogar);

            resp = ps.executeUpdate();
            System.out.println("Hogar eliminado. Filas afectadas: " + resp);

        } catch (Exception e) {
            System.out.println("Error al eliminar Hogar: " + e.getMessage());
            e.printStackTrace();
        }
        return resp;
    }

    public Hogares buscar(int codigoHogar) {
        String sql = "call sp_BuscarHogar(?);";
        Hogares hogar = null;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoHogar);
            rs = ps.executeQuery();

            if (rs.next()) {
                hogar = new Hogares();
                hogar.setCodigoProveedor(rs.getInt(1));
                hogar.setTipoHogar(rs.getString(2));
                hogar.setUbicacion(rs.getString(3));
                hogar.setPrecio(rs.getDouble(4));
                hogar.setCodigoProveedor(rs.getShort(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hogar;
    }
}

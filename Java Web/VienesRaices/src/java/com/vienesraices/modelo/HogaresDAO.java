package com.vienesraices.modelo;

import com.vienesraices.config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                hoga.setCodigoHogar(rs.getInt(1));
                hoga.setTipoHogar(rs.getString(2));
                hoga.setUbicacion(rs.getString(3));
                hoga.setPrecio(rs.getDouble(4));
                hoga.setCodigoProveedor(rs.getInt(5 ));
                listaHogares.add(hoga);
            }
        } catch (SQLException e) {
            System.err.println("Error al listar hogares: " + e.getMessage());
            e.printStackTrace();
        }

        return listaHogares;
    }

    public int agregar(Hogares hog) {
        String sql = "call sp_AgregarHogar(?, ?, ?, ?);";
        int resultado = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, hog.getTipoHogar());
            ps.setString(2, hog.getUbicacion());
            ps.setDouble(3, hog.getPrecio());
            ps.setInt(4, hog.getCodigoProveedor());

            resultado = ps.executeUpdate();
            System.out.println("Hogar agregado. Filas afectadas: " + resultado);

        } catch (SQLException e) {
            System.err.println("Error al agregar hogar: " + e.getMessage());
            e.printStackTrace();
        }

        return resultado;
    }

    public int eliminar(int codigoHogar) {
        String sql = "call sp_EliminarHogar(?);";
        int resultado = 0;

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoHogar);
            resultado = ps.executeUpdate();
            System.out.println("Hogar eliminado. Filas afectadas: " + resultado);

        } catch (SQLException e) {
            System.err.println("Error al eliminar hogar: " + e.getMessage());
            e.printStackTrace();
        }

        return resultado;
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
                hogar.setCodigoHogar(rs.getInt(1));
                hogar.setTipoHogar(rs.getString(2));
                hogar.setUbicacion(rs.getString(3));
                hogar.setPrecio(rs.getDouble(4));
                hogar.setCodigoProveedor(rs.getInt(5));
            }

        } catch (SQLException e) {
            System.err.println("Error al buscar hogar: " + e.getMessage());
            e.printStackTrace();
        }
        return hogar;
    }

    public int actualizar(Hogares hog) {
        String sql = "call sp_EditarHogar(?, ?, ?, ?, ?);";

        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, hog.getCodigoHogar());
            ps.setString(2, hog.getTipoHogar());
            ps.setString(3, hog.getUbicacion());
            ps.setDouble(4, hog.getPrecio());
            ps.setInt(5, hog.getCodigoProveedor());
            resp = ps.executeUpdate();
            System.out.println("Hogar actualizado. Filas afectadas: " + resp);

        } catch (SQLException e) {
            System.err.println("Error al actualizar hogar: " + e.getMessage());
            e.printStackTrace();
        }
        return resp;
    }
}

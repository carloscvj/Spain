/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  carlos
 * Created: 23-jun-2019
 */

USE Spain;
SELECT Municipios.municipio, Provincias.provincia, Regiones.region
       FROM Municipios, Provincias, Regiones
       WHERE Municipios.Provincias_idProvincia = Provincias.idProvincia AND Provincias.Regiones_idRegion = Regiones.idRegion
       order by Municipios.municipio;
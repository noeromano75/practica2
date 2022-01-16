//
//  Contacto.swift
//  practica2
//
//  Created by Noe Romano Vazquez on 13/01/22.
//  Copyright © 2022 noeromano. All rights reserved.
//

import Foundation

enum Parentesco:String{
    case Hermano
    case Padre
    case Madre
    case Hijo
    case Pareja
    case Primo
}
class Contacto {
    var nombre:String
    var edad:Int
    var fechaNacimiento:String
    var domicilio:String
    var parentesco: Parentesco
    
    init(nombre:String,edad:Int, domicilio:String, fechaNacimiento:String, parentesco:Parentesco){
        self.nombre = nombre
        self.edad = edad
        self.parentesco = parentesco
        self.domicilio = domicilio
        self.fechaNacimiento = fechaNacimiento
    }
}


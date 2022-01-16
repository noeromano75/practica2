//
//  ViewController2.swift
//  practica2
//
//  Created by Noe Romano Vazquez on 13/01/22.
//  Copyright © 2022 noeromano. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var contactoDetail:Contacto!
    var indice:Int!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var domicilio: UITextField!
    @IBOutlet weak var edadtext: UITextField!
    @IBOutlet weak var fechaNacimientoText: UITextField!
    @IBOutlet weak var nombreText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contactoDetail.nombre)
        print(contactoDetail.edad)
        print(contactoDetail.fechaNacimiento)
        print(contactoDetail.domicilio)
        print(contactoDetail.parentesco)
        

        self.nombreText.text = contactoDetail.nombre
        //self.edadtext.text = contactoDetail.edad
        self.fechaNacimientoText.text = contactoDetail.fechaNacimiento
        self.domicilio.text = contactoDetail.domicilio
        // Do any additional setup after loading the view.
    } 
    
    @IBAction func actualizarInfo(_ sender: Any) {
        callBack?(nombreText.text!,fechaNacimientoText.text!,domicilio.text!,indice,contactoDetail.parentesco,contactoDetail.edad)
        self.dismiss(animated: true, completion: nil)
    }
        
    var callBack:((String,String,String,Int,Parentesco,Int)->Void)?
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

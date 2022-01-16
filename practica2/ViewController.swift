//
//  ViewController.swift
//  practica2
//
//  Created by Noe Romano Vazquez on 10/01/22.
//  Copyright © 2022 noeromano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewm: UITableView!
    
    var contactos = [Contacto(nombre: "Natalia", edad: 24,domicilio: "EdoMex",fechaNacimiento: "16051995", parentesco: .Pareja), Contacto(nombre: "Isis",edad: 21,domicilio: "EdoMex",fechaNacimiento: "20022000",parentesco:.Hermano), Contacto(nombre: "Ita", edad: 29,domicilio: "EdoMex",fechaNacimiento: "03061992",parentesco:.Hermano),Contacto(nombre: "William", edad: 17,domicilio: "EdoMex",fechaNacimiento: "05092004",parentesco: .Primo)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewm.dataSource = self
        tableViewm.delegate = self
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcd = segue.destination as? ViewController2{

        }
        
    }*/
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = "\(contactos[indexPath.row].nombre)"
        cell.detailTextLabel?.text = "\(contactos[indexPath.row].edad)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("se ha seleccionado \(contactos[indexPath.row].nombre) - \(indexPath.row)")
        if contactos[indexPath.row].edad > 25 {
            let activityCtrl = UIActivityViewController(activityItems: [NSLocalizedString("Hola  \(contactos[indexPath.row].nombre) felices \(contactos[indexPath.row].edad) años. Pastela increible.", comment: "PD: Noe Romano")], applicationActivities: nil)
            
            self.present(activityCtrl, animated: true,completion: nil)
            
        }else{
            if let vcd = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as? ViewController2{
                vcd.contactoDetail = contactos[indexPath.row]
                vcd.indice = indexPath.row
                
                vcd.callBack = {
                    
                    (nombre,fecha,domicilio,indice,parentesco,edad)in
                    print("Data - \(fecha) - \(domicilio) - \(parentesco) - \(edad) - \(indice)")
                    self.contactos[indice].nombre = nombre
                    self.contactos[indice].fechaNacimiento = fecha
                    self.contactos[indice].domicilio = domicilio
                    self.contactos[indice].parentesco = parentesco
                    self.contactos[indice].edad = edad
                        /*= Contacto(nombre: nombre, edad: edad, domicilio: domicilio,fechaNacimiento: fecha, parentesco: parentesco)*/
                    print("Done2!");
                    self.tableViewm.reloadData();
                }
                
                
                
                self.present(vcd, animated: true) {
                    print("Done1!")
                }
            }
        }
    }
}

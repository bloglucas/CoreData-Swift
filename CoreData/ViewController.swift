//
//  ViewController.swift
//  CoreData
//
//  Created by Lucas Conceição on 17/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBAction func salvarCidade(sender: AnyObject) {
        
        var cidade:Cidade = Cidade(entity: Cidade.entityDescription(), insertIntoManagedObjectContext: nil)
        cidade.nome = "Nome da Cidade"
        cidade.salvar()
        
        NSLog("Cidade salva")
    }

    @IBAction func consultarCidades(sender: AnyObject) {
        
        var retorno = DataManager.getAllManagedObjectsFromEntity(Cidade.entityDescription())
        if (retorno.sucesso){
            
            if(retorno.objects.count == 0){
                NSLog("Não existem registros")
            }else{
                for obj in retorno.objects as [Cidade]{
                    obj as Cidade
                    NSLog("Nome da cidade: \(obj.nome)")
                }
            }
            
        }else{
            NSLog("Erro ao buscar cidades")
        }
        
    }
    
    @IBAction func excluir(){
        var retorno = DataManager.getAllManagedObjectsFromEntity(Cidade.entityDescription())
        if (retorno.sucesso && retorno.objects.count > 0){
            
            var deletedObject = retorno.objects.objectAtIndex(0) as Cidade
            deletedObject.delete()
            
        }
    }
    
    @IBAction func alterar(sender: AnyObject) {
        
        var retorno = DataManager.getAllManagedObjectsFromEntity(Cidade.entityDescription())
        if (retorno.sucesso && retorno.objects.count > 0){
            
            var objAlterado = retorno.objects.objectAtIndex(0) as Cidade
            objAlterado.nome = "Nome Alterado"
            objAlterado.salvar()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


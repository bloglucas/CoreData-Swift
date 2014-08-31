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
    
    @IBAction func incluirCadastro(){
        
        var retorno = DataManager.getAllManagedObjectsFromEntity(Cidade.entityDescription())
        var cidade:Cidade?
        var cadastro:Cadastro = Cadastro(entity: Cadastro.entityDescription(), insertIntoManagedObjectContext: DataManager.getContext())
        cadastro.salvar()
        
        if(retorno.sucesso){
            cidade = retorno.objects.objectAtIndex(0) as? Cidade
        }
        
        cadastro.nome = "Lucas"
        cadastro.telefone = NSNumber(integer: 6181339520)
        cadastro.cidade = cidade
        cadastro.salvar()
        
    }
    
    @IBAction func consultarCadastros() {
        
        var retorno = DataManager.getAllManagedObjectsFromEntity(Cadastro.entityDescription())
        if (retorno.sucesso){
            
            if(retorno.objects.count == 0){
                NSLog("Não existem registros")
            }else{
                for obj in retorno.objects as [Cadastro]{
                    obj as Cadastro
                    NSLog("Nome do Cadastro: \(obj.nome)")
                    NSLog("Telefone do Cadstro: \(obj.telefone)")

                    if let cidade = obj.cidade {
                        NSLog("Cidade do Cadastro: \(cidade.nome)")
                    }else{
                        NSLog("Sem Cidade")
                    }
                    NSLog("---------")
                }
            }
            
        }else{
            NSLog("Erro ao buscar cadastros")
        }
        
    }

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
    
    @IBAction func excluirCidade(){
        var retorno = DataManager.getAllManagedObjectsFromEntity(Cidade.entityDescription())
        if (retorno.sucesso && retorno.objects.count > 0){
            
            var deletedObject = retorno.objects.objectAtIndex(0) as Cidade
            deletedObject.delete()
            
        }
    }
    
    @IBAction func alterarCidade(sender: AnyObject) {
        
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


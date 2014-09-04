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
    
    @IBAction func fetchRequest(){
        var retorno = DataManager.getFromFetchRequest("FetchNomeContains")
        if (retorno.sucesso){
            NSLog("%i",retorno.objects.count)
        }
        
        var variaveis:NSMutableDictionary = NSMutableDictionary()
        variaveis.setObject("Lucas", forKey: "NOME")
        var retorno2 = DataManager.getFromFetchRequest("FetchVariavel", variaveis: variaveis)
        if (retorno2.sucesso){
            NSLog("%i",retorno2.objects.count)
        }
    }
    
    @IBAction func fetchTeste(){
        
        var retornoCidade = DataManager.getAllManagedObjectsFromEntity(Cidade.entityDescription())
        var cidade = retornoCidade.objects[0] as Cidade
        var listaCidade = cidade.cadastros
        NSLog("No %@ existem %i cadastros",cidade.nome, listaCidade.count)
       
        var retornoCadastro = DataManager.getAllManagedObjectsFromEntity(Cadastro.entityDescription())
        var cadastro = retornoCadastro.objects[0] as Cadastro
        var listaCadastro = cadastro.rio
        NSLog("%i",listaCadastro.count)
        
    }
    
    @IBAction func incluirCadastro(){
        
        
        var cadastro:Cadastro = Cadastro(entity: Cadastro.entityDescription(), insertIntoManagedObjectContext: nil)
        cadastro.nome = "Lucas"
        cadastro.telefone = NSNumber(integer: 6181339520)
        cadastro.salvar()
        
        var retorno = DataManager.getAllManagedObjectsFromEntity(Cidade.entityDescription())
        var cidade:Cidade?
        if(retorno.sucesso){
            cidade = retorno.objects.objectAtIndex(0) as? Cidade
        }
        
        cadastro.cidade = cidade
        cadastro.salvar()
        
    }
    
    @IBAction func pesquisarCidade(){
        
        var format:String = "nome LIKE %@"
        var arguments:NSArray = ["Rio"]
        var predicate:NSPredicate = NSPredicate(format: format, argumentArray: arguments)
        
        var retorno = DataManager.getManagedObjectsFromEntity(Cidade.entityDescription(), predicate: predicate)
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
        cidade.nome = "Rio"
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


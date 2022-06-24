//
//  AnasayfaInteractor.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: targetPath).appendingPathComponent("records.sqlite")
        db = FMDatabase(path: dbURL.path)
        //print(dbURL)
        //print(db)

    }
    
    func tumtoDosAl() {
        db?.open()
        var list = [ToDos]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM todos", values: nil)
            //print(result)
            while result.next() {
                let toDo = ToDos(toDo_id: Int(result.string(forColumn: "todo_id"))!, toDo_content: result.string(forColumn: "todo_content")!)
                list.append(toDo)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(toDoListesi: list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func toDoAra(aramaKelimesi: String) {
        db?.open()
        var list = [ToDos]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM todos WHERE todo_content like '%\(aramaKelimesi)%'", values: nil)
            
            while result.next() {
                let toDo = ToDos(toDo_id: Int(result.string(forColumn: "todo_id"))!, toDo_content: result.string(forColumn: "todo_content")!)
                list.append(toDo)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(toDoListesi: list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func toDoSil(toDo_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM todos WHERE todo_id = ?", values: [toDo_id])
            tumtoDosAl()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}

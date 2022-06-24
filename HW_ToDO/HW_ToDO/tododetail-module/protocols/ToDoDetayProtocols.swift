//
//  ToDoDetayProtocols.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

protocol ViewToPresenterToDoDetayProtocol {
    var toDoDetayInteractor:PresenterToInteractorToDoDetayProtocol? {get set}
    
    func guncelle(toDo_id:Int,toDo_content:String)
}

protocol PresenterToInteractorToDoDetayProtocol {
    func toDoGuncelle(toDo_id:Int,toDo_content:String)
}

protocol PresenterToRouterToDoDetayProtocol {
    static func createModule(ref:ToDoDetayVC)
}


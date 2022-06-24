//
//  ToDoKayitProtocols.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

protocol ViewToPresenterToDoKayitProtocol {
    var toDoKayitInteractor:PresenterToInteractorToDoKayitProtocol? {get set}
    
    func ekle(toDo_content:String)
}

protocol PresenterToInteractorToDoKayitProtocol {
    func toDoKayit(toDo_content:String)
}

protocol PresenterToRouterToDoKayitProtocol {
    static func createModule(ref:ToDoKayitVC)
}


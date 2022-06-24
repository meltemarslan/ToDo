//
//  ToDoDetayPresenter.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class ToDoDetayPresenter : ViewToPresenterToDoDetayProtocol {
    var toDoDetayInteractor: PresenterToInteractorToDoDetayProtocol?
    
    
    func guncelle(toDo_id:Int, toDo_content: String) {
        toDoDetayInteractor?.toDoGuncelle(toDo_id: toDo_id, toDo_content: toDo_content)
    }
}




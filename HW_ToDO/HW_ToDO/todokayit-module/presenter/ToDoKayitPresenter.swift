//
//  ToDoKayitPresenter.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class ToDoKayitPresenter : ViewToPresenterToDoKayitProtocol {
   // var toDo: PresenterToInteractorToDoKayitProtocol?
    
   var toDoKayitInteractor: PresenterToInteractorToDoKayitProtocol?
    
    func ekle(toDo_content: String) {
        toDoKayitInteractor?.toDoKayit(toDo_content: toDo_content)
    }
}


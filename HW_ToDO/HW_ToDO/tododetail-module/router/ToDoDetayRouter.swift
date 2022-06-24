//
//  ToDoDetayRouter.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class ToDoDetayRouter : PresenterToRouterToDoDetayProtocol {
    static func createModule(ref: ToDoDetayVC) {
        ref.toDoDetayPresenterNesnesi = ToDoDetayPresenter()
        ref.toDoDetayPresenterNesnesi?.toDoDetayInteractor = ToDoDetayInteractor()
    }
}


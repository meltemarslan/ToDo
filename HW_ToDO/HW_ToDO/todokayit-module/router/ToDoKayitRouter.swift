//
//  ToDoKayitRouter.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class ToDoKayitRouter : PresenterToRouterToDoKayitProtocol {
    static func createModule(ref: ToDoKayitVC) {
        ref.toDoKayitPresenterNesnesi = ToDoKayitPresenter()
        ref.toDoKayitPresenterNesnesi?.toDoKayitInteractor = ToDoKayitInteractor()
    }
}


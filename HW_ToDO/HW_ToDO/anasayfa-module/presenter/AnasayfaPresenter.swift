//
//  AnasayfaPresenter.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
  
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func toDosYukle() {
        anasayfaInteractor?.tumtoDosAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.toDoAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(toDo_id: Int) {
        anasayfaInteractor?.toDoSil(toDo_id: toDo_id)
    }
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(toDoListesi: Array<ToDos>) {
        anasayfaView?.vieweVeriGonder(toDoListesi: toDoListesi)
    }
}

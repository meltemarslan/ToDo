//
//  AnasayfaProtocols.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

//Ana protocoller
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func toDosYukle()
    func ara(aramaKelimesi:String)
    func sil(toDo_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumtoDosAl()
    func toDoAra(aramaKelimesi:String)
    func toDoSil(toDo_id:Int)
}


//Taşıyıcı protocoller
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(toDoListesi:Array<ToDos>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(toDoListesi:Array<ToDos>)
}

//Router protocol
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}

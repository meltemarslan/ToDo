//
//  ToDoKayitVC.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import UIKit


class ToDoKayitVC: UIViewController {
   // @IBOutlet weak var tfToDo: UITextField!
    
    @IBOutlet weak var tfToDo: UITextField!
    var toDoKayitPresenterNesnesi:ViewToPresenterToDoKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoKayitRouter.createModule(ref: self)
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let toDo = tfToDo.text {
            toDoKayitPresenterNesnesi?.ekle(toDo_content: toDo)
            let alertYes = UIAlertController(title: "Added", message: "", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel) { action in }
            alertYes.addAction(okay)
            self.present(alertYes, animated: true)
    }
    }
}


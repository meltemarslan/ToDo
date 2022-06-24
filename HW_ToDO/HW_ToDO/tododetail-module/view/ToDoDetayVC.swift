//
//  ToDoDetayVC.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import UIKit

class ToDoDetayVC: UIViewController {


    @IBOutlet weak var tftoDo: UITextField!
    // @IBOutlet weak var tftoDo: UITextField!
  //  @IBOutlet weak var tfKisiTel: UITextField!
    
    var toDo:ToDos?
    var toDoDetayPresenterNesnesi:ViewToPresenterToDoDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = toDo {
            tftoDo.text = k.toDo_content
           // tfKisiTel.text = k.kisi_tel
        }
        
        ToDoDetayRouter.createModule(ref: self)
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let tc = tftoDo.text, let t = toDo {
            toDoDetayPresenterNesnesi?.guncelle(toDo_id: t.toDo_id!, toDo_content: tc)
            let alertYes = UIAlertController(title: "Updated", message: "", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel) { action in }
            alertYes.addAction(okay)
            self.present(alertYes, animated: true)
        }
    }
    
}

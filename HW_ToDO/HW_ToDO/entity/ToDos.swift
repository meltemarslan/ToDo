//
//  ToDos.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import Foundation

class ToDos {
    var toDo_id:Int?
    var toDo_content:String?
    
    init (toDo_id:Int,toDo_content:String) {
        self.toDo_id = toDo_id
        self.toDo_content = toDo_content
    }
}

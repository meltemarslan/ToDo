//
//  AnasayfaVC.swift
//  HW_ToDO
//
//  Created by Meltem Arslan on 17.06.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var toDosTableView: UITableView!
    var toDosListe = [ToDos]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        

        
        AnasayfaRouter.createModule(ref: self)
        
       // anasayfaPresenterNesnesi?.toDosYukle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.toDosYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let toDo = sender as? ToDos {
                let gidilecekVC = segue.destination as! ToDoDetayVC
                gidilecekVC.toDo = toDo
            }
        }
    }
    func databaseCopy() {
        let bundlePath = Bundle.main.path(forResource: "records", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("records.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: placeToCopy.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            } catch {}
        }
    }
}


extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(toDoListesi: Array<ToDos>) {
        self.toDosListe = toDoListesi
        self.toDosTableView.reloadData()
    }
}

extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDosListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "toDosHucre", for: indexPath) as! TableViewHucre
        
        hucre.toDoBilgiLabel.text = "\(toDo.toDo_content!)"
        
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let toDo = self.toDosListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(toDo.toDo_content!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(toDo_id: toDo.toDo_id!)
                
                let alertYes = UIAlertController(title: "Deleted", message: "", preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .cancel) { action in }
                alertYes.addAction(okay)
                self.present(alertYes, animated: true)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDosListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




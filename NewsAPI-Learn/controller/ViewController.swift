//
//  ViewController.swift
//  NewsAPI-Learn
//
//  Created by iav on 28/03/20.
//  Copyright © 2020 iav. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func profile(_ sender: Any) {
        self.performSegue(withIdentifier: "profilDetail", sender: self)
    }
    
    var stuntingModel = [Photos]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataJSON{
            self.tableView.reloadData()
        }
        self.navigationItem.title = "Stunting"
        
        tableView.delegate = self
        tableView.dataSource = self
        // Menghubungkan berkas XIB untuk HeroTableViewCell dengn heroTableView.
        tableView.register(UINib(nibName: "AlproTableViewCell", bundle: nil), forCellReuseIdentifier: "AlproCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuntingModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlproCell", for: indexPath) as! AlproTableViewCell
        
        // Menetapkan nilai hero ke view di dalam cel
        let hero = stuntingModel[indexPath.row]
        cell.nameLbl.text = hero.judul
        cell.statusLbl.text = hero.jenis
        
        let url = URL(string: hero.gambar)
        cell.ivAlpro.downloadedImages(from: url!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "showDetails", sender: self)
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let destinaton = segue.destination as? DetailNewsViewController {
             destinaton.stuntingModel = stuntingModel[tableView.indexPathForSelectedRow!.row]
         }
     }
    
    func getDataJSON(completed: @escaping () -> () ){
        let url = URL(string: "https://script.google.com/a/upgris.ac.id/macros/s/AKfycbwx9ePmIQxgV4_bwDyaLylItWQNKlxnfIKex4p-jQ/exec?action=read&sheetName=materi")
       
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            if let data = data{                
                do{
                    self.stuntingModel = try JSONDecoder().decode([Photos].self, from: data)
                    DispatchQueue.main.async {
                    completed()
                    }
                } catch {
                    print("JSON Error")
                }
            }
            
        }.resume()
    }
}

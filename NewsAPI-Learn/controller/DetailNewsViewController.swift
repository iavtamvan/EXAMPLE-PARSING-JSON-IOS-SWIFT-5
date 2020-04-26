//
//  DetailNewsViewController.swift
//  NewsAPI-Learn
//
//  Created by iav on 28/03/20.
//  Copyright © 2020 iav. All rights reserved.
//

import UIKit
class DetailNewsViewController: UIViewController {
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var tittleLbl: UILabel!
    @IBOutlet weak var tglLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    var stuntingModel: Photos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = stuntingModel?.jenis
        
        self.tittleLbl.text = stuntingModel?.judul
        self.tglLbl.text = stuntingModel?.jenis
        self.contentLbl.text = stuntingModel?.isi
        
        print("" + stuntingModel!.gambar)
        
        let url = URL(string: stuntingModel!.gambar)
        self.imageVIew.downloadedImages(from: url!)

        // Do any additional setup after loading the view.
    }

}

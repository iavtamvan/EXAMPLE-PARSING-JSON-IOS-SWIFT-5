//
//  AlproTableViewCell.swift
//  NewsAPI-Learn
//
//  Created by iav on 24/04/20.
//  Copyright © 2020 iav. All rights reserved.
//

import UIKit

class AlproTableViewCell: UITableViewCell {

    @IBOutlet weak var ivAlpro: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

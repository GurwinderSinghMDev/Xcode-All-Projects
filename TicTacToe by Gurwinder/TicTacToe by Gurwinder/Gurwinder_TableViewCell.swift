//
//  Gurwinder_TableViewCell.swift
//  TicTacToe by Gurwinder
//
//  Created by Gurwinder Singh on 2023-06-05.
//

import UIKit

class Gurwinder_TableViewCell: UITableViewCell {
    
    // MARK:- class Varriables
    var gameData : GameData?
    
    
// MARK:- OUTLETS
    
    @IBOutlet weak var winLossImage: UIImageView!
    
    @IBOutlet weak var whoWON: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  MarkTableViewCell.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit

class MarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var DetailButton: UIButton!
    @IBOutlet weak var SubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        contentView..backgroundColor = UIColor.ITechArtColors.WhiteBackground
//            SubtitleLabel.textColor = UIColor.ITechArtColors.TextGrey
//            TitleLabel.textColor = UIColor.ITechArtColors.Black
    }

}




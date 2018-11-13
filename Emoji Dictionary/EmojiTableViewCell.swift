//
//  EmojiTableViewCell.swift
//  Emoji Dictionary
//
//  Created by Student on 13/11/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func update(with emoji: Emoji) {
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

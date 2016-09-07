//
//  SegmentControlTableViewCell.swift
//  Bundle
//
//  Created by Sean Murphy on 8/19/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import XMSegmentedControl

class SegmentControlTableViewCell: UITableViewCell {

	@IBOutlet weak var contactsSegmentedControlView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	@IBOutlet weak var contactsSegmentedControl: UISegmentedControl!
}

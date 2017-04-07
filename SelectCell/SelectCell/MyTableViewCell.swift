//
//  MyTableViewCell.swift
//  SelectCell
//
//  Created by Joanna Bednarz on 07/04/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    // MARK: Properties
    static let cellIdentifier: String = "CellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    private var traits: UIAccessibilityTraits = UIAccessibilityTraitNone

    // MARK: UITableViewCell life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        traits = super.accessibilityTraits
    }

    // MARK: UIAccessibilityElement
    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            if isSelected {
                return traits | UIAccessibilityTraitSelected
            }
            return traits
        }

        set {
            traits = newValue
        }
    }

}



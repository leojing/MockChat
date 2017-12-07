//
//  BaseChatCell.swift
//  Chat
//
//  Created by Jing Luo on 6/12/17.
//  Copyright © 2017 Jing Luo. All rights reserved.
//

import Foundation
import UIKit

class BaseChatCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var messageContentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBackgroundView: UIImageView!
    @IBOutlet weak var messageSentFailedIcon: UIImageView!
    @IBOutlet weak var addedContentView: UIView!

    @IBOutlet weak var messageLabelWidthConstraint: NSLayoutConstraint?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        messageBackgroundView.layer.masksToBounds = true
        messageBackgroundView.layer.cornerRadius = 10
        
        if let width = messageLabel.text?.width(withConstraintedHeight: 20, font: UIFont(name: "Avenir-Light", size: 15)!) {
            messageLabelWidthConstraint?.constant = width > 200 ? 200:width
            layoutIfNeeded()
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func reuseId() -> String {
        return String(describing: self)
    }

    func update(_ value: Any) {
        
    }
}

extension String {
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

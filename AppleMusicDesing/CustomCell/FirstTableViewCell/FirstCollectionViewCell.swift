//
//  FirstCollectionViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 11.08.2023.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var lblThird: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 13
    }

}

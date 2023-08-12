//
//  ThirdCollectionViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 11.08.2023.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblMusicName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 10
    }

}

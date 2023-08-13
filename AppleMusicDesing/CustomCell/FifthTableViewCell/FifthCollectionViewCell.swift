//
//  FifthCollectionViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 12.08.2023.
//

import UIKit

class FifthCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblMusicName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 15
    }

}

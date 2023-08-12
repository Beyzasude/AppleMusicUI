//
//  SecondTableViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 11.08.2023.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    
    var musicList = [Music]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        configureData()
        configureLayout()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureData() {
        let m1 = Music(musicName: "Uzamsal Ses: Türkçe Müzik", artistName: "Apple Music", image: "2.1")
        let m2 = Music(musicName: "İHYA - Single", artistName: "KARDELEN", image: "2.2")
        let m3 = Music(musicName: "A Love Letter To You 5", artistName: "Trippie Redd", image: "2.3")
        let m4 = Music(musicName: "NAYLON - Single", artistName: "Lil Zey", image: "2.4")
        let m5 = Music(musicName: "Dans Et(feat. chillhead & Kubilay Tok) - Single", artistName: "İfade & Geka", image: "2.5")
        let m6 = Music(musicName: "Uzamsal Ses: Hit'ler", artistName: "Apple Music: Hit'ler", image: "2.6")
        
        musicList.append(m1)
        musicList.append(m2)
        musicList.append(m3)
        musicList.append(m4)
        musicList.append(m5)
        musicList.append(m6)
    }
    
    func configureLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let hucreGenisligi = secondCollectionView.bounds.width
        let hucreUzunlugu = secondCollectionView.bounds.height
        layout.itemSize = CGSizeMake(hucreGenisligi/1.8, hucreUzunlugu)
        secondCollectionView.collectionViewLayout = layout
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "SecondCollectionViewCell", bundle: nil)
        secondCollectionView.register(customCellNib, forCellWithReuseIdentifier: "secondCollectionViewCell")
    }
}

extension SecondTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "secondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell{
            let music = musicList[indexPath.row]
            cell.lblMusicName.text = music.musicName
            cell.lblArtistName.text = music.artistName
            cell.imgView.image = UIImage(named: music.image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

//
//  ThirdTableViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 11.08.2023.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var thirdCollectionView: UICollectionView!
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    
    var musicList = [Music]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        configureData()
        configureLayout()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureData() {
        let m1 = Music(musicName: "Zirvedekiler: Türkçe Pop", artistName: "Apple Music: Pop", image: "3.1")
        let m2 = Music(musicName: "Bugünün Hit'leri", artistName: "Apple Music: Hit'ler", image: "3.2")
        let m3 = Music(musicName: "Zirvedekiler: Türkiye", artistName: "Apple Music: Pop", image: "3.3")
        let m4 = Music(musicName: "Shazam Stars", artistName: "Apple Music", image: "3.4")
        let m5 = Music(musicName: "Yarının Hit'leri", artistName: "Apple Music", image: "3.5")
        
        musicList.append(m1)
        musicList.append(m2)
        musicList.append(m3)
        musicList.append(m4)
        musicList.append(m5)
    }
    
    func configureLayout() {
        
        /*let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 16) / 1
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth/2)
        thirdCollectionView.collectionViewLayout = layout
        */
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let hucreGenisligi = thirdCollectionView.bounds.width
        let hucreUzunlugu = thirdCollectionView.bounds.height
        layout.itemSize = CGSizeMake(hucreGenisligi/1.8, hucreUzunlugu)
        thirdCollectionView.collectionViewLayout = layout
        
         
         
        /*let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 20) / 2
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth)
        thirdCollectionView.collectionViewLayout = layout
        */
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "ThirdCollectionViewCell", bundle: nil)
        thirdCollectionView.register(customCellNib, forCellWithReuseIdentifier: "thirdCollectionViewCell")
    }
}

extension ThirdTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: "thirdCollectionViewCell", for: indexPath) as? ThirdCollectionViewCell{
            let music = musicList[indexPath.row]
            cell.lblMusicName.text = music.musicName
            cell.lblArtistName.text = music.artistName
            cell.imgView.image = UIImage(named: music.image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

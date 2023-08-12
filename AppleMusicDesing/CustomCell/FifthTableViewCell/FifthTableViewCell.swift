//
//  FifthTableViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 12.08.2023.
//

import UIKit

class FifthTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    @IBOutlet weak var fifthCollectionView: UICollectionView!
    
    var musicList = [Music]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fifthCollectionView.delegate = self
        fifthCollectionView.dataSource = self
        configureData()
        collectionViewTasarim()
        //configureLayout()
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
        let m6 = Music(musicName: "Günün Yenileri", artistName: "Apple Music", image: "3.6")
        
        musicList.append(m1)
        musicList.append(m2)
        musicList.append(m3)
        musicList.append(m4)
        musicList.append(m5)
        musicList.append(m6)
    }
    
    func collectionViewTasarim(){
        let tasarim = UICollectionViewFlowLayout()
        tasarim.scrollDirection = .horizontal
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tasarim.minimumInteritemSpacing = 0 // yatay
        tasarim.minimumLineSpacing = 0 // dikey
        print(fifthCollectionView.bounds.width, fifthCollectionView.bounds.height )
        let hucreGenisligi = (fifthCollectionView.bounds.width - 35)/2
        let hucreUzunlugu = (fifthCollectionView.bounds.height*1.6)/2
        tasarim.itemSize = CGSize(width: hucreGenisligi, height: hucreUzunlugu)
        fifthCollectionView.collectionViewLayout = tasarim
    }
    
    func configureLayout() {
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.scrollDirection = .horizontal
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tasarim.minimumInteritemSpacing = 0
        tasarim.minimumLineSpacing = 0
        let hucreGenisligi = fifthCollectionView.bounds.width
        let hucreUzunlugu = fifthCollectionView.bounds.height
        tasarim.itemSize = CGSize(width: hucreGenisligi/2, height: hucreUzunlugu)
        fifthCollectionView.collectionViewLayout = tasarim
        
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "FifthCollectionViewCell", bundle: nil)
        fifthCollectionView.register(customCellNib, forCellWithReuseIdentifier: "fifthCollectionViewCell")
    }
}

extension FifthTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = fifthCollectionView.dequeueReusableCell(withReuseIdentifier: "fifthCollectionViewCell", for: indexPath) as? FifthCollectionViewCell{
            let music = musicList[indexPath.row]
            cell.lblMusicName.text = music.musicName
            cell.lblArtistName.text = music.artistName
            cell.imgView.image = UIImage(named: music.image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

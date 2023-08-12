//
//  FourthTableViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 11.08.2023.
//

import UIKit

class FourthTableViewCell: UITableViewCell {

    @IBOutlet weak var fourthCollectionView: UICollectionView!
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    var musicList = [Music]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fourthCollectionView.delegate = self
        fourthCollectionView.dataSource = self
        configureData()
        collectionViewTasarim()
       // configureLayout()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureData() {
        let m1 = Music(musicName: "Olmuşum Leyla", artistName: "Buray", image: "4.1")
        let m2 = Music(musicName: "Dans Et (feat. chillhead & Kubilay Tok)", artistName: "İfade & Geka", image: "4.2")
        let m3 = Music(musicName: "Gözdeki Maviye", artistName: "Murat Boz", image: "4.3")
        let m4 = Music(musicName: "Bruce Lee", artistName: "BEGE", image: "4.4")
        let m5 = Music(musicName: "Sakinleştim", artistName: "Pinhani", image: "4.5")
        let m6 = Music(musicName: "Günü Gelir", artistName: "Dedublüman", image: "4.6")
        let m7 = Music(musicName: "LOVE LOVE", artistName: "GLS", image: "4.7")
        let m8 = Music(musicName: "Sen & Ben", artistName: "Defa", image: "4.8")
        musicList.append(m1)
        musicList.append(m2)
        musicList.append(m3)
        musicList.append(m4)
        musicList.append(m5)
        musicList.append(m6)
        musicList.append(m7)
        musicList.append(m8)
    }
    
    func collectionViewTasarim(){
        let tasarim = UICollectionViewFlowLayout()
        tasarim.scrollDirection = .horizontal
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tasarim.minimumInteritemSpacing = 0 // yatay
        tasarim.minimumLineSpacing = 0 // dikey
        print(fourthCollectionView.bounds.width, fourthCollectionView.bounds.height )
        let hucreGenisligi = fourthCollectionView.bounds.width - 35
        let hucreUzunlugu = (fourthCollectionView.bounds.height)/2
        tasarim.itemSize = CGSize(width: hucreGenisligi, height: hucreUzunlugu)
        fourthCollectionView.collectionViewLayout = tasarim
    }
    
    func configureLayout() {

       /* let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let hucreGenisligi = fourthCollectionView.bounds.width
        let hucreUzunlugu = fourthCollectionView.bounds.height
        layout.itemSize = CGSizeMake(hucreGenisligi/1.8, hucreUzunlugu)
        fourthCollectionView.collectionViewLayout = layout
        */
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth/2)
        fourthCollectionView.collectionViewLayout = layout
        
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "FourthCollectionViewCell", bundle: nil)
        fourthCollectionView.register(customCellNib, forCellWithReuseIdentifier: "fourthCollectionViewCell")
    }
}

extension FourthTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = fourthCollectionView.dequeueReusableCell(withReuseIdentifier: "fourthCollectionViewCell", for: indexPath) as? FourthCollectionViewCell{
            let music = musicList[indexPath.row]
            cell.lblMusicName.text = music.musicName
            cell.lblArtistName.text = music.artistName
            cell.imgView.image = UIImage(named: music.image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

//
//  TableViewCell.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 11.08.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    var musicList = [FirstMusic]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
        configureLayout()
        configureData()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureData() {
        let m1 = FirstMusic(musicDetail: "EN POPÜLER LİSTE", category: "Zirvedekiler: Türkçe Pop", appleMusic: "Apple Music: Pop", image: "1")
        let m2 = FirstMusic(musicDetail: "ŞİMDİ DİNLE", category: "Zirvedekiler: Türkçe Rap", appleMusic: "Apple Music: Hip-Hop/Rap", image: "2")
        let m3 = FirstMusic(musicDetail: "HAFTA'NIN SINGLE'I", category: "İHYA - Single", appleMusic: "KARDELEN", image: "3")
        let m4 = FirstMusic(musicDetail: "YILDIZI PARLAYANLAR", category: "Türkiye'nin Yıldızlarını Keşfet", appleMusic: "", image: "4")
        let m5 = FirstMusic(musicDetail: "UZAMSAL SESTE YENİ", category: "NAYLON - Single", appleMusic: "Lil Zey", image: "5")
        musicList.append(m1)
        musicList.append(m2)
        musicList.append(m3)
        musicList.append(m4)
        musicList.append(m5)
    }
    
    func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 50) / 1
        layout.itemSize = CGSize(width: itemWidth , height: itemWidth * 0.75)
        firstCollectionView.collectionViewLayout = layout
    }
    
    func customNibs() {
        let customCellNib: UINib = UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        firstCollectionView.register(customCellNib, forCellWithReuseIdentifier: "firstCollectionViewCell")
    }
    
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "firstCollectionViewCell", for: indexPath) as? FirstCollectionViewCell{
            let music = musicList[indexPath.row]
            cell.lblFirst.text = music.musicDetail
            cell.lblSecond.text = music.category
            cell.lblThird.text = music.appleMusic
            cell.imgView.image = UIImage(named: music.image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
}

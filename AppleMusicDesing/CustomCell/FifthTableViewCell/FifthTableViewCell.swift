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
        //collectionViewTasarim()
        configureLayout()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureData() {
        let m1 = Music(musicName: "Gazino", artistName: "Gazino Kültürünün ışıltılı atmosferinde, sahne farklı türlerin.", image: "3.7")
        let m2 = Music(musicName: "Shazam Stars", artistName: "Yükselişteki sanatçılar, yarının yıldızları ve çok daha fazlası.", image: "3.4")
        let m3 = Music(musicName: "Yaz Partisi", artistName: "Yüksek Tempolu yazın Hit'leri ile partiye ışınlan!", image: "3.9")
        let m4 = Music(musicName: "Günün Yenileri", artistName: "Haftanın şarkısı KAROL G'den Mi Ex Tenia Razon, Uzamnsal Ses'te.", image: "3.6")
        let m5 = Music(musicName: "Yeniden Dinle: Türkçe Rap", artistName: "Türün en yeni hit'lerinden özenle oluşturulmuş bir koleksiyon.", image: "3.10")
        musicList.append(m1)
        musicList.append(m2)
        musicList.append(m3)
        musicList.append(m4)
        musicList.append(m5)
    
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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 0
        let hucreGenisligi = fifthCollectionView.bounds.width
        let hucreUzunlugu = fifthCollectionView.bounds.height
        layout.itemSize = CGSizeMake(hucreGenisligi-20, hucreUzunlugu*1.7)
        fifthCollectionView.collectionViewLayout = layout
        
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

//
//  Music.swift
//  AppleMusicDesing
//
//  Created by Beyza Sude Erol on 11.08.2023.
//

import Foundation

class Music {
    var musicName:String?
    var artistName:String?
    var image:String?
    
    init(musicName: String, artistName: String, image: String) {
        self.musicName = musicName
        self.artistName = artistName
        self.image = image
    }
}

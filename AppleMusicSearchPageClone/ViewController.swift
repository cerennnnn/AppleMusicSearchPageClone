//
//  ViewController.swift
//  AppleMusicSearchPageClone
//
//  Created by Ceren Güneş on 30.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var MusicCollection: UICollectionView!
    var playlist = [Music]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        MusicCollection.delegate = self
        MusicCollection.dataSource = self
        
        let p1 = Music(imageName: "britney", title: "Hits")
        let p2 = Music(imageName: "jackson", title: "K-pop")
        let p3 = Music(imageName: "hwasa", title: "Party")
        let p4 = Music(imageName: "miley", title: "Pop")
        let p5 = Music(imageName: "drake", title: "Hip-Hop/Rap")
        let p6 = Music(imageName: "taylor", title: "Hits")
        let p7 = Music(imageName: "nicki", title: "Spatial Audio")
        let p8 = Music(imageName: "david", title: "Dance")
        
        playlist = [p1, p2, p3, p4, p5, p6, p7, p8]
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 15
        
        let screenWidth = UIScreen.main.bounds.width
        let itemSize = (screenWidth - 35) / 2
        design.itemSize = CGSize(width: itemSize, height: itemSize )
        
        MusicCollection.collectionViewLayout = design
        
        let appearance = UITabBarAppearance()
       
           tabbarItemColor(itemAppearance: appearance.stackedLayoutAppearance)
           tabbarItemColor(itemAppearance: appearance.inlineLayoutAppearance)
           tabbarItemColor(itemAppearance: appearance.compactInlineLayoutAppearance)
           
           tabBarController?.tabBar.barStyle = .black
           tabBarController?.tabBar.standardAppearance = appearance
           tabBarController?.tabBar.scrollEdgeAppearance = appearance
       }

       func tabbarItemColor(itemAppearance: UITabBarItemAppearance) {
           
           itemAppearance.selected.iconColor = UIColor.red
           itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
           
           itemAppearance.normal.iconColor = UIColor.gray
           itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
       }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MusicCollectionViewCell
        
        let playlistItem = playlist[indexPath.row]
        
        if let imageName = playlistItem.imageName {
            cell.musicImage.image = UIImage(named: imageName)
        }
        cell.title.text = playlistItem.title
        cell.layer.cornerRadius = 15
        
        return cell
    }
}

//
//  MemoCollectionViewController.swift
//  MemoPad
//
//  Created by あらいゆめ on 2023/02/11.
//

import UIKit

class MemoCollectionViewController: UIViewController , UICollectionViewDataSource{
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var savedate:UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedate.register (defaults: [ "titles":[] , "contents":[] ])
        titles = savedate.object(forKey: "titles") as! [String]
        contents = savedate.object(forKey: "contents") as! [String]
    
        
        collectionView.dataSource = self
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        var contentConfiguration =  UIListContentConfiguration.cell()
        
        contentConfiguration.text = titles[indexPath.item]
        
        contentConfiguration.secondaryText = contents[indexPath.item]
        
        cell.contentConfiguration = contentConfiguration
        
        return cell
        
                                                      
                                                      
    }
  
   
}

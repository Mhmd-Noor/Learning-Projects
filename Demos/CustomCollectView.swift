//
//  CustomCollectView.swift
//  Demos
//
//  Created by Mohammad Noor on 7/10/24.
//

import UIKit

class CustomCollectView: NSObject {

}


extension CustomCollectView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var color: CGColor!
        if collectionView.tag > 0 {
          color = CGColor(red: CGFloat(indexPath.item)/30.0,
                        green: 0.5,
                        blue: 1.0 - CGFloat(indexPath.item)/30.0,
                        alpha: 0.5)
        } else {
            color = CGColor(red: 0.5,
                          green: CGFloat(indexPath.item)/30.0,
                          blue: 1.0 - CGFloat(indexPath.item)/30.0,
                          alpha: 0.5)
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! CustomCollectViewCell
        
        cell.innerCellLabel.text = String(indexPath.item)
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 2.0
        cell.contentView.layer.backgroundColor = color
        cell.contentView.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = collectionView.frame.size
        cellSize.width *= 0.20
        return cellSize
    }
}

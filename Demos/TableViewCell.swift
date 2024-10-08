//
//  TableViewCell.swift
//  Demos
//
//  Created by Mohammad Noor on 7/10/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet private var inCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {

        inCollectionView.delegate = dataSourceDelegate
        inCollectionView.dataSource = dataSourceDelegate
        inCollectionView.tag = row
        inCollectionView.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

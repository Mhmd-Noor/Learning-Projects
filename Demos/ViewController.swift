//
//  ViewController.swift
//  Demos
//
//  Created by Mohammad Noor on 7/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private let innerCollectionView = CustomCollectView()
    
    @IBOutlet weak var promtTextField: UITextField!
    
    @IBOutlet weak var promptLabel: UILabel!
    
    @IBOutlet weak var musicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        
        promtTextField.layer.cornerRadius = 10.0
        promtTextField.clipsToBounds = true
        promptLabel.text = "Prompt Text"
        musicLabel.text = "Music Style"
        
        promtTextField.delegate = self
    }


}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        label.text = (section > 0) ? "Music Length":"Example Prompts"
        label.textColor = UIColor.black
        label.frame = CGRect(x: 0, y: 0,
                             width: tableView.frame.width * 0.5,
                             height: tableView.frame.width * 0.05)
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "tvCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tableCell = cell as! TableViewCell
        tableCell.setCollectionViewDataSourceDelegate(innerCollectionView, forRow: indexPath.section)
    }
}




extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCollectionViewCell", for: indexPath) as! BottomCollectionViewCell
        
        cell.bottomCollectionViewCellLabel.text = String(indexPath.item)
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 2.0
        cell.contentView.layer.backgroundColor = CGColor(red: CGFloat(indexPath.item)/30.0,
                                                         green: 1.0 - CGFloat(indexPath.item)/30.0,
                                                         blue: 0.5,
                                                         alpha: 0.5)
        cell.contentView.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = collectionView.frame.size
        cellSize.width *= 0.20
        cellSize.height *= 0.20
        return cellSize
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }
}


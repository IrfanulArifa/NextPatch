//
//  HeaderViewCell.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    @IBOutlet weak var searchTF: UITextField!
    var searchText: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

extension HeaderViewCell {
    func setupUI() {
        searchTF.addTarget(self, action: #selector(searchAction), for: .editingChanged)
    }
    
    @objc
    private func searchAction() {
        self.searchText?(searchTF.text ?? "")
    }
}

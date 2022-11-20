//
//  ANFProductItemCell.swift
//  ANF Code Test
//
//  Created by Rashad Abdul-Salam on 11/20/22.
//

import Foundation
import UIKit

protocol ANFIdentifiable { }
extension ANFIdentifiable {
    static var Identifier: String {
        String(describing: Self.self)
    }
}

class ANFProductItemCell : UITableViewCell, ANFIdentifiable {
    
    private static var ContentData_BaseHeight = 50.0
    
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var topDescriptionLabel: UILabel! {
        didSet {
            topDescriptionLabel.font = .systemFont(ofSize: 13.0)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .boldSystemFont(ofSize: 17.0)
        }
    }
    @IBOutlet weak var promoMessageLabel: UILabel! {
        didSet {
            promoMessageLabel.font = .systemFont(ofSize: 11.0)
        }
    }
    
    @IBOutlet weak var bottomDescriptionLabel: UILabel! {
        didSet {
            bottomDescriptionLabel.font = .systemFont(ofSize: 13.0)
        }
    }
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private var contentData : [ANFProductContent]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentTableView.separatorStyle = .none
    }
    
    func configure(_ productItem: ANFProductItem, completion: (()->Void)?=nil) {
        
        self.productImageView?.image = nil
        let imageProvider = ANFImageProviderService(urlStr: productItem.backgroundImage)
        imageProvider.fetchImage { [weak self] image, error in
            guard let self = self else { return}
            self.productImageView.image = image
            completion?()
        }
        self.topDescriptionLabel.text = productItem.topDescription
        self.titleLabel.text = productItem.title
        self.promoMessageLabel.text = productItem.promoMessage
        self.promoMessageLabel.textColor = .gray
        self.bottomDescriptionLabel.attributedText = NSAttributedString.MakeHyperlink(from: productItem.bottomDescription)
        // MARK: TableView Storyboard
        self.contentData = productItem.content
        self.tableViewHeight.constant = CGFloat(contentData?.count ?? 0) * Self.ContentData_BaseHeight
        self.contentTableView.reloadData()

    }
}

extension ANFProductItemCell : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contentData = self.contentData else {
            return 0
        }
        return contentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let contentData = self.contentData,
            let cell = tableView.dequeueReusableCell(withIdentifier: ANFProductContentDataCell.Identifier) as? ANFProductContentDataCell
        else {
            return UITableViewCell()
        }
        let content = contentData[indexPath.row]
        
        cell.configure(content)
        return cell
    }
    
}

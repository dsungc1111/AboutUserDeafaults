//
//  CityTableViewCell.swift
//  AboutUserDeafaults
//
//  Created by 최대성 on 5/31/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var recommendLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        
        
        cityLabel.font = .boldSystemFont(ofSize: 20)
        cityLabel.textColor = .white
        recommendLabel.font = .systemFont(ofSize: 15)
        recommendLabel.textColor = .white
        recommendLabel.layer.masksToBounds = true
        recommendLabel.layer.maskedCorners = .layerMaxXMinYCorner
        
        
        cityImageView.clipsToBounds = true
        cityImageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        cityImageView.contentMode = .scaleAspectFill
        
        
        likeButton.tintColor = .yellow
    }
   
    
    
    func configureCell(data: City  ) {
        cityLabel.text = data.city_name
        recommendLabel.text = data.city_explain
        
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        
       
        let image = data.like ? "star.fill" : "star"
        let bookmark = UIImage(systemName: image)
        likeButton.setImage(bookmark, for: .normal)
        
        
    }
    
    
}

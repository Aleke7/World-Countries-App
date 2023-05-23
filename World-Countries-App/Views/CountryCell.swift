//
//  CountryCell.swift
//  World-Countries-App
//
//  Created by Almat Begaidarov on 23.05.2023.
//

import UIKit
import SnapKit

class CountryCell: UITableViewCell {
    
    static let identifier = "CountryCell"
        
    private lazy var flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func makeConstraints() {
        
        flagImage.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(50)
            
        }
        
    }
    

}

extension UIImageView {
    func loadImage(urlString: String) {
        guard let imageURL = URL(string: urlString) else {
            self.image = UIImage(systemName: "picture")
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

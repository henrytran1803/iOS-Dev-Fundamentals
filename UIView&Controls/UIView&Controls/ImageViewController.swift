//
//  ImageViewController.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/21/25.
//

import UIKit
import UIKit

class ImageViewController: UIViewController {
    
    // MARK: - UIImageView 1
    let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image") // Đảm bảo ảnh "Image1.jpg" có trong Assets
        imageView.contentMode = .scaleAspectFit // Hiển thị ảnh không bị méo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - UIImageView 2
    let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image2") // Đảm bảo ảnh "Image2.jpg" có trong Assets
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Thêm hai UIImageView vào view
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        
        // MARK: - Nâng cao: Bo góc và viền ảnh
        imageView1.layer.cornerRadius = 20
        imageView1.layer.borderWidth = 2
        imageView1.layer.borderColor = UIColor.red.cgColor
        imageView1.clipsToBounds = true

        imageView2.layer.cornerRadius = 20
        imageView2.layer.borderWidth = 2
        imageView2.layer.borderColor = UIColor.blue.cgColor
        imageView2.clipsToBounds = true
        
        // MARK: - Nâng cao: Hiệu ứng đổ bóng
        imageView1.layer.shadowColor = UIColor.black.cgColor
        imageView1.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageView1.layer.shadowOpacity = 0.7
        imageView1.layer.shadowRadius = 10

        imageView2.layer.shadowColor = UIColor.black.cgColor
        imageView2.layer.shadowOffset = CGSize(width: -5, height: -5)
        imageView2.layer.shadowOpacity = 0.7
        imageView2.layer.shadowRadius = 10

        // MARK: - Auto Layout cho hai ảnh
        NSLayoutConstraint.activate([
            // Ảnh 1: Ở trên
            imageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView1.widthAnchor.constraint(equalToConstant: 200),
            imageView1.heightAnchor.constraint(equalToConstant: 200),

            // Ảnh 2: Ở dưới, cách ảnh 1 khoảng 20px
            imageView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView2.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 20),
            imageView2.widthAnchor.constraint(equalToConstant: 200),
            imageView2.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // ✅ Các tính năng nâng cao, bạn có thể bật/tắt bằng cách bỏ comment lại
        // applyShadowAndBorder(imageView: imageView1)
        // applyShadowAndBorder(imageView: imageView2)
        // loadImageFromURL(imageView: imageView1, urlString: "https://your-image-url.com/image1.jpg")
         loadImageFromURL(imageView: imageView2, urlString: "https://picsum.photos/200/300")
//         animateImageChange(imageView: imageView2, newImage: UIImage(named: "NewImage")!)
    }
    
    // MARK: - Nâng cao: Tạo hiệu ứng đổ bóng và viền
    func applyShadowAndBorder(imageView: UIImageView) {
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.purple.cgColor
        imageView.clipsToBounds = true

        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageView.layer.shadowOpacity = 0.7
        imageView.layer.shadowRadius = 10
    }
    
    // MARK: - Nâng cao: Tải ảnh từ URL
    func loadImageFromURL(imageView: UIImageView, urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
    }
    
    // MARK: - Nâng cao: Hiệu ứng chuyển đổi ảnh
    func animateImageChange(imageView: UIImageView, newImage: UIImage) {
        UIView.transition(with: imageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            imageView.image = newImage
        }, completion: nil)
    }
}

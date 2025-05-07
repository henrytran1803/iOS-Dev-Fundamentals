//
//  ProductCell.swift
//  HomeWork_Buoi11_TranVietAnh
//
//  Created by Việt Anh Trần on 23/4/25.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    private var sizes: [SizeOption] = []
    private var isFavourite: Bool = false
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var favoriteImage: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configCell()
    }
    func configCell() {
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
        sizeCollectionView.register(type: SizeCell.self)
    }
    
    func bindData(product: Product){
        nameLbl.text = product.name
        priceLbl.text = "\(product.price)$"
        productImage.image = UIImage(named: product.image)
        isFavourite = product.isLike
        sizes = product.sizeOptions



        sizeCollectionView.reloadData() // QUAN TRỌNG: đảm bảo gọi reload
    }
    @IBAction func didTapFarvorite(_ sender: Any) {
        isFavourite.toggle()
        let image = isFavourite ? UIImage(named: "ic_check_favourite") : UIImage(named: "ic_uncheck_favourite")
        favoriteImage.setImage(image, for: .normal)
    }
    
}
extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: SizeCell.self, indexPath: indexPath)
        cell.bindData(size: sizes[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 24, height: 15)
    }
}


//
//  CollectionViewController.swift
//  HomeWork-3
//
//  Created by Sergey Starchenkov on 11.05.2021.
//

import UIKit

internal final class CollectionViewController: LoggerViewController
{
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var quoteArray = [QuoteInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }
    
    private func configureCollection() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.initialize()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(collectionView.snp.width)
        }
    }
    
    private func initialize() {
        quoteArray = DataModel.init().quoteInfo
    }
}

// MARK: CollectionViewDelegate, CollectionViewDataSource
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quoteArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.config(with: quoteArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.width - 16
        return CGSize(width: size, height: size)
    }
}

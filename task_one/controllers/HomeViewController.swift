//
//  HomeViewController.swift
//  task_one
//
//  Created by Sanjar Aslonov on 18/02/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
    
    let numberofColumns: CGFloat = 2
    var items: Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    // MARK: - Methods
    
    func initViews() {
        addNavigationBar()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberofColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(title: " Best Coding", image: "im_mac"))
        items.append(Item(title: " Amazing Coding", image: "ios"))
        items.append(Item(title: " Best Coding", image: "im_mac"))
        items.append(Item(title: " Amazing Coding", image: "ios"))
        items.append(Item(title: " Best Coding", image: "im_mac"))
        items.append(Item(title: " Amazing Coding", image: "ios"))
        items.append(Item(title: " Best Coding", image: "im_mac"))
        items.append(Item(title: " Amazing Coding", image: "ios"))
        items.append(Item(title: " Best Coding", image: "im_mac"))
    }
    
    func addNavigationBar() {
        let scroll = UIImage(named: "ic_article")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(rightTapped))
        
        title = "Collection View"
    }
    
    func callScrollController() {
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Actions

    @objc func rightTapped() {
        callScrollController()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: item.image!)
        cell.imageTitle.text = item.title
        
        return cell
    }
    

}

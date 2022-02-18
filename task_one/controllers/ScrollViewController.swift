//
//  ScrollViewController.swift
//  task_one
//
//  Created by Sanjar Aslonov on 18/02/22.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet var mImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    // MARK: - Methods
    
    func initViews() {
        addNavigationBar()
    }
    
    func addNavigationBar() {
        let back = UIImage(named: "ic_back")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(collectionTapped))
        
        title = "Scroll View"
    }
    
    // MARK: - Actions
    
    @objc func collectionTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//
//  DetailedViewController.swift
//  MemeMe 2.0
//
//  Created by Ahmed Al Ramadhan on 07/12/2018.
//  Copyright © 2018 Ahmed Al Ramadhan. All rights reserved.

import UIKit

class DetailedViewController: UIViewController{
    
    var meme: Meme!
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        memeImage.image = meme.memedImage
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}

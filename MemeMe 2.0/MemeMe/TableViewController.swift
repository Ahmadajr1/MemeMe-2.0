//
//  TableViewController.swift
//  MemeMe 1.0
//
//  Created by Ahmed Al Ramadhan on 30/11/2018.
//  Copyright © 2018 Ahmed Al Ramadhan. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController{
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = "\(String(meme.topTextField))...\(String(meme.bottomTextField))"
        cell.imageView?.image = meme.memedImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        let meme = self.memes[(indexPath as NSIndexPath).row]
        VC.meme = meme
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController!.pushViewController(VC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    @IBAction func EnterMemeCreator(_ sender: Any) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "MemeCreatorViewController") as! MemeCreatorViewController
        self.present(VC, animated: true, completion: nil)
    }
}


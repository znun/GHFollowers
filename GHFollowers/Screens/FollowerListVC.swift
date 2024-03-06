//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Mahmudul Hasan on 1/3/24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad stuff Happened", message: errorMessage!.rawValue, buttonTitle: "OK")
                
                return
            }
            
            print("Followers count: \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

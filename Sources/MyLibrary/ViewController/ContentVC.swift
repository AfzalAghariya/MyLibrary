//
//  ContainerVC.swift
//  AfzalPracticalTask
//
//  Created by Mohammed Afzal on 18/08/23.
//

import UIKit
import SDWebImage

class ContentVC: UIViewController {

    @IBOutlet weak var imgPoster: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imgPoster.sd_setImage(with: URL(string: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1200"))
    }
}

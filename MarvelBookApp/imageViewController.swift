//
//  imageViewController.swift
//  MarvelBookApp
//
//  Created by Emre Gemici on 17.07.2022.
//

import UIKit

class imageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedName = ""
    var selectedImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = selectedName
        imageView.image = selectedImages
    }
    


}

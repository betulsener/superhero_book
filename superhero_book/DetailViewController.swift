//
//  DetailViewController.swift
//  superhero_book
//
//  Created by Betul Sener on 17.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var detailTextView: UITextView!
 
    
    var pickedSuperHeroDetail = ""
    var pickedSuperHeroName = ""
    var pickedSuperHeroImageName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: pickedSuperHeroImageName)
        label.text = pickedSuperHeroName
        detailTextView.text = pickedSuperHeroDetail
       // detailLabel.text = pickedSuperHeroDetail

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

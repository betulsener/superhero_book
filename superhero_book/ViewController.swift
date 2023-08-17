//
//  ViewController.swift
//  superhero_book
//
//  Created by Betul Sener on 16.08.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var superheroNames = [String]()
    
    var superHeroImageNames = [String]()
    
    var superheroDetails = [String]()
    
    var pickedName = ""
    
    var pickedImage = ""
    
    var pickedDetail = ""

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
 
        superheroNames.append("Batman")
        superheroNames.append("Superman")
        superheroNames.append("Iron Man")
        superheroNames.append("Spiderman")
        superheroNames.append("Captain America")
        
        superheroDetails.append("Batman is a superhero appearing in American comic books published by DC Comics. The character was created by artist Bob Kane and writer Bill Finger, and debuted in the 27th issue of the comic book Detective Comics on March 30, 1939. In the DC Universe continuity, Batman is the alias of Bruce Wayne, a wealthy American playboy, philanthropist, and industrialist who resides in Gotham City. Batman's origin story features him swearing vengeance against criminals after witnessing the murder of his parents Thomas and Martha as a child, a vendetta tempered with the ideal of justice. He trains himself physically and intellectually, crafts a bat-inspired persona, and monitors the Gotham streets at night. Kane, Finger, and other creators accompanied Batman with supporting characters, including his sidekicks Robin and Batgirl; allies Alfred Pennyworth, James Gordon, and Catwoman; and foes such as the Penguin, the Riddler, Two-Face, and his archenemy, the Joker.")
        superheroDetails.append("Superman is a superhero who appears in American comic books published by DC Comics. The character was created by writer Jerry Siegel and artist Joe Shuster, and debuted in the comic book Action Comics #1 (cover-dated June 1938 and published April 18, 1938).[1] Superman has been adapted to a number of other media, which includes radio serials, novels, films, television shows, theater, and video games.")
        superheroDetails.append("Iron Man is a superhero appearing in American comic books published by Marvel Comics. Co-created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby, the character first appeared in Tales of Suspense #39 (cover dated March 1963), and received his own title in Iron Man #1 (May 1968). In 1963, the character founded the Avengers superhero team with Thor, Ant-Man, Wasp and the Hulk.")
        superheroDetails.append("Spider-Man is a superhero appearing in American comic books published by Marvel Comics. Created by writer-editor Stan Lee and artist Steve Ditko, he first appeared in the anthology comic book Amazing Fantasy #15 (August 1962) in the Silver Age of Comic Books. He has been featured in comic books, television shows, films, video games, novels, and plays.")
        superheroDetails.append("Captain America is a superhero created by Joe Simon and Jack Kirby who appears in American comic books published by Marvel Comics. The character first appeared in Captain America Comics #1, published on December 20, 1940 by Timely Comics, a corporate predecessor to Marvel. Captain America's civilian identity is Steve Rogers, a frail man enhanced to the peak of human physical perfection by an experimental supersoldier serum after joining the United States Army to aid the country's efforts in World War II. Equipped with an American flag-inspired costume and a virtually indestructible shield, Captain America and his sidekick Bucky Barnes clashed frequently with the villainous Red Skull and other members of the Axis powers. In the final days of the war, an accident left Captain America frozen in a state of suspended animation until he was revived in modern times. He resumes his exploits as a costumed hero and becomes leader of the superhero team the Avengers, but frequently struggles as a man out of time to adjust to the new era.")
  
        superHeroImageNames.append("batman")
        superHeroImageNames.append("superman")
        superHeroImageNames.append("ironman")
        superHeroImageNames.append("spiderman")
        superHeroImageNames.append("captainamerica")
      
        
        
    }

    //numberOfRows InSection -> how many rows in it?
    //cellForRow atIndexPath -> what to show in cells?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superheroNames[indexPath.row]
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            superheroNames.remove(at: indexPath.row)
            superHeroImageNames.remove(at: indexPath.row)
            superheroDetails.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        pickedName = superheroNames[indexPath.row]
        pickedImage = superHeroImageNames[indexPath.row]
        pickedDetail = superheroDetails[indexPath.row]
        
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.pickedSuperHeroName = pickedName
            destinationVC.pickedSuperHeroImageName = pickedImage
            destinationVC.pickedSuperHeroDetail = pickedDetail
        }
            
    }
}


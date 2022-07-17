//
//  ViewController.swift
//  MarvelBookApp
//
//  Created by Emre Gemici on 17.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var marvelCharacters = [String]()
    var marvelImages = [UIImage]()
    var chosenName = ""
    var chosenImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sınıfları kullanabilmek bu ikisini viewController a eşitliyoruz.
        tableView.delegate = self
        tableView.dataSource = self
        
        //MarvelBook Data
        
        marvelCharacters.append("Iron Man")
        marvelCharacters.append("Spiderman")
        marvelCharacters.append("Hulk")
        marvelCharacters.append("Black Widow")
        marvelCharacters.append("Captain America")
        
        
        
        marvelImages.append(UIImage(named: "ironman")!)
        marvelImages.append(UIImage(named: "spiderman")!)
        marvelImages.append(UIImage(named: "Hulk")!)
        marvelImages.append(UIImage(named: "BlackWidow")!)
        marvelImages.append(UIImage(named: "CaptainAmerica")!)

        
                            
        
    }
    
    //UITableViewDelegate,UITableViewDataSource sınıflarının kullanbilmesi için eklenmesi gereken fonksiyonları eklliyoruz.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell oluşturucağum ve UITableViewCell döndürmemi istiyor.
        let cell = UITableViewCell()
        cell.textLabel?.text = marvelCharacters[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //benden kaç tane satır oluşturucağımı soruyor.
        return marvelCharacters.count
    }
    
    // TableView üzerinden sola sürükleyerek satırları silme işlemi  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            marvelCharacters.remove(at: indexPath.row)
            marvelImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // Seçenek seçildiği zaman ne yapılsın komutu
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenName = marvelCharacters[indexPath.row]    //seçilen seçeneğin index i ni aldık
         chosenImage = marvelImages[indexPath.row]  // ve değişkenlerimize gösterildiği gibi eşitledik
        
        performSegue(withIdentifier: "toImageViewController", sender: nil) // segue ye verdiğimiz Identifier burada kullanıyoruz.
    }
    
    // Veri aktarabilmek için ViewController identity isini gösterek ona ulaşmabilmesini sağlayan code dizisi
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{ //oluşturduğumuz ViewController ID si
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedName = chosenName
            destinationVC.selectedImages = chosenImage
            
        }
        
    }
    
}

 

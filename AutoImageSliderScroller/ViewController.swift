//
//  ViewController.swift
//  AutoImageSliderScroller
//
//  Created by Dheeraj Arora on 16/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionImage: UICollectionView!
    @IBOutlet weak var myPageController: UIPageControl!
    var imgArr = [UIImage(named: "Alexandra Daddario"),
                  UIImage(named: "Angelina Jolie"),
                  UIImage(named: "Anne Hathaway"),
                  UIImage(named: "Dakota Johnson"),
                  UIImage(named: "Emma Stone"),
                  UIImage(named: "Emma Watson"),
                  UIImage(named: "Halle Berry"),
                  UIImage(named: "Jessica Alba"),
                  UIImage(named: "Scarlett Johansson")]
    
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        myPageController.numberOfPages = imgArr.count
        myPageController.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            
        }
    }

   @objc func changeImage() {
    if counter < imgArr.count{
        let index = IndexPath.init(item: counter, section: 0)
        self.myCollectionImage.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        myPageController.currentPage = counter
        counter += 1
    }else{
        counter = 0
        let index = IndexPath.init(item: counter, section: 0)
        self.myCollectionImage.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
         myPageController.currentPage = counter
        counter = 1
        
    }
  }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
          cell.myImage.image = imgArr[indexPath.row]
        return cell
    }
  
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = myCollectionImage.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

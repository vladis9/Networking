//
//  MainViewController.swift
//  Networking
//
//  Created by Vlad Zinevich on 14.08.2021.
//

import UIKit

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example One"
    case exampleTwo = "Example Two"
    case exampleThree = "Example Three"
    case exampleFour = "Example Four"
    case ourCourses = "Our Courses"
}

class MainViewController: UICollectionViewController {
    
    let userActions = UserActions.allCases
    
    //MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage:
            performSegue(withIdentifier: "ShowImage", sender: self)
        case .exampleOne:
            performSegue(withIdentifier: "ExampleOne", sender: self)
        case .exampleTwo:
            performSegue(withIdentifier: "ExampleTwo", sender: self)
        case .exampleThree:
            performSegue(withIdentifier: "ExampleThree", sender: self)
        case .exampleFour:
            performSegue(withIdentifier: "ExampleFour", sender: self)
        case .ourCourses:
            performSegue(withIdentifier: "OurCourses", sender: self)
        }
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "ShowImage" {
            let courseVC = segue.destination as! CoursesViewController
            
            switch segue.identifier {
            case "ExampleOne":
                courseVC.fetchDataV1()
            case "ExampleTwo":
                courseVC.fetchDataV2()
            case "ExampleThree":
                courseVC.fetchDataV3()
            case "ExampleFour":
                courseVC.fetchDataV4()
            case "OurCourses":
                courseVC.fetchData()
            default:
                break
            }
        }
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
    }
}

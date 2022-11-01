//
//  ViewController.swift
//  ImageVault
//
//  Created by Vikash Hart on 10/30/22.
//

import UIKit

class ViewController: UIViewController {

    private let landingView = LandingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(landingView)
        view.backgroundColor = .clear
        landingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func getFilePath(fileName: String) -> String? {
         let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
         let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
         var filePath: String?
         let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
         if paths.count > 0 {
             let dirPath = paths[0] as NSString
             filePath = dirPath.appendingPathComponent(fileName)
         }
         else {
             filePath = nil
         }

         return filePath
     }

     func getImage(imageNames: [String]) -> [UIImage] {
         var savedImages: [UIImage] = [UIImage]()

         for imageName in imageNames {
             if let imagePath = getFilePath(fileName: imageName) {
                 guard let image = UIImage(contentsOfFile: imagePath) else { return [] }
                 savedImages.append(image)
             }
         }

         return savedImages
     }
}


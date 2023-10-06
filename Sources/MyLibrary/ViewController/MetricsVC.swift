//
//  MetricsVC.swift
//  AfzalPracticalTask
//
//  Created by Mohammed Afzal on 18/08/23.
//

import UIKit

class MetricsVC: UIViewController {
    
    @IBOutlet weak var MetricsCV: UICollectionView!
    
    var dummyArray = [DummyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.readFile(name: "DummyJson")
        MetricsCV.register(UINib(nibName: "MetricsCell", bundle: .myPackage), forCellWithReuseIdentifier: "MetricsCell")
    }
    
    // Read Json from local file for dummy data
    func readFile(name: String)
    {
        guard let fileUrl = Bundle.myPackage.url(forResource: name, withExtension: "json"),
              let jsonData = try? Data(contentsOf: fileUrl) else {
            return
        }
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]]
            let fetchedData = jsonArray?.compactMap { json -> DummyData? in
                
                guard let numberCount = json["numbers"] as? String,
                      let description = json["description"] as? String
                else
                {
                    return nil
                }
                return DummyData(numbers: numberCount, description: description)
                
            }
            
            dummyArray = fetchedData!
            DispatchQueue.main.async {
                self.MetricsCV.reloadData()
                
            }
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }
}

//MARK: - CollectionView Delegate Methods

extension MetricsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dummyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MetricsCell", for: indexPath) as! MetricsCell
        cell.lblNumber.text = dummyArray[indexPath.row].numbers
        cell.lblDesc.text = dummyArray[indexPath.row].description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width / 3, height: width / 4)
    }
}

//
//  ViewController.swift
//  AfzalPracticalTask
//
//  Created by Mohammed Afzal on 18/08/23.
//

import UIKit


public extension Bundle {
    static var myPackage: Bundle {
        return Bundle.module
    }
}


@available(iOS 13.0, *)
public class HomeVC: UIViewController {
    
    @IBOutlet weak var SocialCV: UICollectionView!
    
    @IBOutlet weak var lblMetrics: UILabel!
    @IBOutlet weak var metricsBottomView: UIView!
    
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var contentBottomView: UIView!
    
    @IBOutlet weak var lblDemographics: UILabel!
    @IBOutlet weak var demographicsBottomView: UIView!
    
    @IBOutlet weak var MetricsView: UIView!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var DemoGraphicsView: UIView!
    
    var socialArray = [SocialModel]()
    
    public static let HomeStoryboard = UIStoryboard(name: "Analytics", bundle: .myPackage)
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        socialArray = [SocialModel(name: "Mathew Michel", personIcon: UIImage(named: "YoutubePerson", in: .myPackage, with: nil)!, socialIcon: UIImage(named: "YoutubeIcon", in: .myPackage, with: nil)!),
                       SocialModel(name: "@mathewmicheli", personIcon: UIImage(named: "Twitterperson", in: .myPackage, with: nil)!, socialIcon: UIImage(named: "TwitterIcon", in: .myPackage, with: nil)!)]
        
        SocialCV.register(UINib(nibName: "SocialCell", bundle: .myPackage), forCellWithReuseIdentifier: "SocialCell")
    }
    
    @IBAction func btnSelectOption(_ sender: UIButton)
    {
        switch sender.tag {
        case 0:
            lblMetrics.textColor = .black
            metricsBottomView.backgroundColor = .systemGreen
            
            lblContent.textColor = .systemGray2
            contentBottomView.backgroundColor = .clear
            
            lblDemographics.textColor = .systemGray2
            demographicsBottomView.backgroundColor = .clear
            
            self.MetricsView.isHidden = false
            self.ContentView.isHidden = true
            self.DemoGraphicsView.isHidden = true
            
            
        case 1:
            lblMetrics.textColor = .systemGray2
            metricsBottomView.backgroundColor = .clear
            
            lblContent.textColor = .black
            contentBottomView.backgroundColor = .systemGreen
            
            lblDemographics.textColor = .systemGray2
            demographicsBottomView.backgroundColor = .clear
            
            self.MetricsView.isHidden = true
            self.ContentView.isHidden = false
            self.DemoGraphicsView.isHidden = true
            
        case 2:
            lblMetrics.textColor = .systemGray2
            metricsBottomView.backgroundColor = .clear
            
            lblContent.textColor = .systemGray2
            contentBottomView.backgroundColor = .clear
            
            lblDemographics.textColor = .black
            demographicsBottomView.backgroundColor = .systemGreen
            
            self.MetricsView.isHidden = true
            self.ContentView.isHidden = true
            self.DemoGraphicsView.isHidden = false
            
        default:
            print("Default case ... ")
        }
    }
}

//MARK: - CollectionView Delegate Methods

@available(iOS 13.0, *)
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialArray.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SocialCell", for: indexPath) as! SocialCell
        let data = socialArray[indexPath.row]
        cell.lblName.text = data.name
        cell.socialIcon.image = data.socialIcon
        cell.personIcon.image = data.personIcon
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 56)
    }
}


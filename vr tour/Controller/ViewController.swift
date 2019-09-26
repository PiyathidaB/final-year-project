//
//  ViewController.swift
//  vr tour
//
//  Created by student on 3/7/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import UIKit
import OmniVirtSDK
import GoogleMaps



class ViewController: UIViewController ,GMSMapViewDelegate, CustomInfoWindowDelegate, SWRevealViewControllerDelegate, MenuDelegate {
    
    var menuTableViewController: MenuTableViewController?
    @IBOutlet weak var mapView: GMSMapView!
    var tappedMarker: GMSMarker?
    var customInfoWindow: CustomInfoWindow?
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var infoButton: UIBarButtonItem!
    let zoom : Float = 17.9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyDvWNii5wnWMsCIwxAB9ABlqPu7k7El0iw")
        slideMenus()
        let position = CLLocationCoordinate2D(latitude: 17.016935, longitude: 99.703700)
        let camera = GMSCameraPosition.camera(withTarget: position, zoom: zoom)
        mapView.camera = camera
        mapView.delegate = self//set window
        mapView.mapType = .satellite
        
        let markers = TempleDatabase.temples()
        
        for marker in markers {
            let pointMarker = GMSMarker()
            pointMarker.position = CLLocationCoordinate2DMake(marker.lat, marker.long)
            pointMarker.title = marker.name
            pointMarker.map = mapView
           
            pointMarker.icon = self.imageWithImage(image: UIImage(named: marker.icon)!, scaledToSize: CGSize(width: 80.0, height: 80.0))
            self.customInfoWindow = CustomInfoWindow().loadView()
            customInfoWindow?.delegate = self
            
        }
        
    }
    
    func slideMenus(){
        if (self.revealViewController() != nil) {
            menuTableViewController = self.revealViewController()?.rearViewController as? MenuTableViewController
            menuTableViewController?.delegate = self
            self.revealViewController()?.delegate = self
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.navigationItem.leftBarButtonItem?.target = revealViewController()
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
        }else{
            print("error")
            print(revealViewController())
        }
    }
    
    @IBAction func infoAlert(){
        print("yes")
        let alertController = UIAlertController(title: "How to play", message: "1 2 3 4", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed cancel")
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //func show customInfoWindow
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        NSLog("\(String(describing: marker.title))")
        tappedMarker = marker
        
        if marker.title == "Wat Mahathat"{
            let vr = PlayerViewController()
            self.present(vr, animated: true, completion: nil)
        }
        else{
            let position = CLLocationCoordinate2D(latitude: 17.016935, longitude: 99.703700)
            mapView.animate(toLocation: position)
            let point = mapView.projection.point(for: position)
            let newPoint = mapView.projection.coordinate(for: point)
            let camera = GMSCameraUpdate.setTarget(newPoint)
            mapView.animate(with: camera)
            
            let opaqueWhite = UIColor(white: 1, alpha: 0.85)
            customInfoWindow?.layer.backgroundColor = opaqueWhite.cgColor
            customInfoWindow?.layer.cornerRadius = 15
            customInfoWindow?.center = mapView.projection.point(for: position)
            customInfoWindow?.setTitle(title: marker.title ?? "xxx")
            self.mapView.addSubview(customInfoWindow!)
        }
        
        
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return UIView()
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        customInfoWindow?.removeFromSuperview()
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        guard let position = tappedMarker?.position else {
            return
        }
        customInfoWindow?.center = mapView.projection.point(for: position)
        customInfoWindow?.center.y -= 100
    }
    
    //action homeButton
    @IBAction func pointMahathat(){
        let position = CLLocationCoordinate2D(latitude: 17.016935, longitude: 99.703700)
        mapView.camera = GMSCameraPosition.camera(withTarget: position, zoom: zoom)
        print("tab homButton")
    }
    
    func showButtonDidTouch() {
        print("go to VRPlayer")
        let vr = PlayerViewController()
        self.present(vr, animated: true, completion: nil)
    }
    
    @IBAction func showQuest() {
        self.performSegue(withIdentifier: "openQuest", sender: nil)
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func showPosition(position: CLLocationCoordinate2D) {
        print(position)
        mapView.camera = GMSCameraPosition.camera(withTarget: position, zoom: zoom)
        self.revealViewController()?.revealToggle(animated: true)
    }
}
    





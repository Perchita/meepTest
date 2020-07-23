//
//  ViewController.swift
//  SimpleMeep
//
//  Created by Jose on 21/07/2020.
//  Copyright © 2020 Jose. All rights reserved.
//

import UIKit
import GoogleMaps

class SimpleMeepViewController: UIViewController {

    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: GMSMapView!

    private var simpleMeepPresenter = SimpleMeepViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.simpleMeepPresenter.loadResources(completion: { resources in
            
            //need main threat for change gmsmarker
            DispatchQueue.main.sync {
                self.markResources(resources: resources!)
            }
        })
        
        //Configure mapView
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        let cord2D = CLLocationCoordinate2D(latitude: (Constants.latitude1), longitude: (Constants.longitude1))
        mapView.camera = GMSCameraPosition.camera(withTarget: cord2D, zoom: 15)
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

    }
    
    //MARK: Helpers
    
    private func markResources(resources: [ResourceModel]) {
        self.simpleMeepPresenter.groupResourcesByCompany(resources: resources).forEach { (companyZoneId, resources) in
            resources.forEach { (resource) in
                if let lat = resource.lat, let lon = resource.lon {
                    let cord2D = CLLocationCoordinate2D(latitude: (lat), longitude: (lon))
                    
                    let marker = GMSMarker()
                    marker.position =  cord2D
                    marker.title = resource.name
                    
                    let markerImage = UIImage(named: "icon_offer_pickup")!
                    let tintedImage = markerImage.withRenderingMode(.alwaysTemplate)
                    let markerView = UIImageView(image: tintedImage)
                    markerView.tintColor = UIColor.random()
                    marker.iconView = markerView
                    marker.map = self.mapView
                }
            }
        }
    }
    
}


extension SimpleMeepViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        mapView.camera = GMSCameraPosition.camera(withTarget: locValue, zoom: 15)
        let projection = mapView.projection.visibleRegion()
        
        self.simpleMeepPresenter.setRegionCoordinates(projection.nearLeft, projection.farRight)
                
        self.simpleMeepPresenter.loadResources(completion: { resources in
            
            //need main threat for change gmsmarker
            DispatchQueue.main.sync {
                self.markResources(resources: resources!)
            }
        })
    }
    
}

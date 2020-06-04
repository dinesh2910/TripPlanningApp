//
//  AddTripViewController.swift
//  TripPlanningApp
//
//  Created by Dinesh Danda on 6/3/20.
//  Copyright © 2020 Dinesh Danda. All rights reserved.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var tripImage: UIImageView!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Fonts.tripTitleFont, size: 22)
        tripImage.layer.cornerRadius = 10
    }

    @IBAction func didPressCancelButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func didPressSaveButton(_ sender: UIButton) {
        
        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
            imageView.image = #imageLiteral(resourceName: "pngfuel.com")
            imageView.contentMode = .scaleAspectFit
            tripTextField.rightView = imageView
            tripTextField.rightViewMode = .always
            return
        }
        
        TripFunctions.createTrip(tripModel: TripModel.init(tripTitle: newTripName, tripImage: tripImage.image))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    
    fileprivate func presentPhotoPickerController() {
        let myPickerImageView = UIImagePickerController()
        myPickerImageView.delegate = self
        myPickerImageView.sourceType = .photoLibrary
        self.present(myPickerImageView, animated: true)
    }
    
    @IBAction func didPressCameraButton(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        self.presentPhotoPickerController()
                    }
                case .notDetermined:
                    self.presentPhotoPickerController()
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Access to Photo Library Has been restricted", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Denied", message: "Access to Photo Library Has been Denied, goto Setting", preferredStyle: .alert)
                    let gotoSettingsAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                        DispatchQueue.main.async {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    }
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                        alert.addAction(gotoSettingsAction)
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.tripImage.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

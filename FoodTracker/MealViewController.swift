//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Arkadiusz Żmudzin on 12.10.2016.
//  Copyright © 2016 Arkadiusz Żmudzin. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    // MARK: Overriden functions

    override func viewDidLoad() {
        super.viewDidLoad()
        mealName.delegate = self
        checkValidName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        mealName.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidName()
        navigationItem.title = textField.text
    }
    
    func checkValidName() {
        let text = mealName.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as AnyObject? {
            let name = mealName.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
            
        }
    }

}


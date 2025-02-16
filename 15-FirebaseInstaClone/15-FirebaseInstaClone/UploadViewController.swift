//
//  UploadViewController.swift
//  15-FirebaseInstaClone
//
//  Created by Eren Ali Koca on 5.01.2025.
//

import UIKit
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class UploadViewController: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    
    @IBOutlet weak var uploadButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
    }
    
    func makeAlert(titleInput : String , messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func actionButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        
        let mediaFolder = storageReferance.child("media")
        // klsaörü oluşturur storage de
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let imageRef = mediaFolder.child("\(UUID().uuidString).jpg")
            imageRef.putData(data, metadata: nil) { (metadata,error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    imageRef.downloadURL { (url,error) in
                        if error == nil{
                            let imageURL = url?.absoluteString
                            
                            //DATABASE
                            
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreRef : DocumentReference? = nil
                            let firestorePost = ["imageUrl" : imageURL!,"postedBy" : Auth.auth().currentUser?.email ?? "" ,"postComment" : self.commentText.text! , "date" : FieldValue.serverTimestamp(), "likes" : 0]
                            firestoreRef = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { (error) in
                                if error != nil{
                                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                                }else{
                                    self.imageView.image = UIImage(systemName: "photo.on.rectangle")?.withTintColor(.gray)
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                            
                        }
                    }
                }
            }
        }
        
        
    }
    
}

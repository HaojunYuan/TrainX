//
//  UploadPostViewModel.swift
//  TrainX
//
//  Created by Brian Yuan on 3/16/24.
//

import Foundation

class UploadPostViewModel: ObservableObject {
    @Published var didUploadTweeet = false
    let service = PostService()
    
    func uploadPost(withCaption caption: String) {
        service.uploadPost(caption: caption) { success in
            if success {
                //dismiss view
                self.didUploadTweeet = true
            } else {
                //show error
            }
        }
    }
}

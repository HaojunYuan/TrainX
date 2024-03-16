//
//  CreateNewPostView.swift
//  TrainX
//
//  Created by Brian Yuan on 3/16/24.
//

import SwiftUI
import Kingfisher

struct NewPostView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Text("New Post")
                    .font(.title3)
                
                Spacer()

                Button {
                    viewModel.uploadPost(withCaption: caption)
                } label: {
                    Text("Post")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(.blue)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                }
                
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadTweeet) { success in
            if success {
                viewModel.didUploadTweeet = false
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}

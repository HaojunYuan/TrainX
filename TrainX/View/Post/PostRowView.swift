//
//  PostRowView.swift
//  TrainX
//
//  Created by Brian Yuan on 3/16/24.
//

import SwiftUI
import Kingfisher

struct PostRowView: View {
    @ObservedObject var viewModel: PostRowViewModel
    
    init(post: Post) {
        self.viewModel = PostRowViewModel(post: post)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = self.viewModel.post.user {
                HStack(alignment: .top, spacing: 12) {
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(user.userName)
                                .font(.subheadline).bold()
                            
//                            Text("@\(user.username)")
//                                .font(.caption)
//                                .foregroundColor(.gray)
                            
                            Text("2w")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Text(self.viewModel.post.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                buttonsView
                
                Divider()
            }
        }
    }
}

extension PostRowView {
    var buttonsView: some View {
        //Bottom button action
        HStack {
            Button {
                //Action here
            } label: {
                 Image(systemName: "bubble.left")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button {
                    //Action here
            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button {
                viewModel.post.didLike ?? false ? viewModel.unlikePost() : viewModel.likePost()
            } label: {
                Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                    .font(.subheadline)
                    .foregroundColor(viewModel.post.didLike ?? false ? .red : .gray)
            }
            
            Spacer()
            
            Button {
                    //Action here
            } label: {
                Image(systemName: "bookmark")
                    .font(.subheadline)
            }
        }
        .padding()
        .foregroundColor(.gray)
    }
}


//#Preview {
//    PostRowView()
//}

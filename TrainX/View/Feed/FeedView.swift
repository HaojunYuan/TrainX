//
//  FeedView.swift
//  TrainX
//
//  Created by Brian Yuan on 3/16/24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewPostView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        PostRowView(post: post)
                            .padding()
                    }
                }
            }
            
            Button {
                print("New post")
                showNewPostView.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundStyle(.blue)
                    .font(.system(size: 40))
            }
            .background(Color("themeColor"))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .padding(.trailing, 10)
            .padding(.bottom, 20)
            .fullScreenCover(isPresented: $showNewPostView, onDismiss: {
                viewModel.fetchPosts()
            }) {
               NewPostView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    FeedView()
}

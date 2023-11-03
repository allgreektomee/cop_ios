//
//  PostingView.swift
//  agtm
//
//  Created by yujin on 2023/07/13.
//

import SwiftUI

struct PostingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @StateObject var imageNetwork: ImageNetwork
    @State var image: Image?
    
    @State var placeholderText: String = "공유하고 싶은 내용을 입력해주세요."
    @State var content: String = ""
    
    @State private var showModal = false
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    func loadImageURL() {
        imageNetwork.getImageURL()
    }
    
    func postImage() {
//        imageNetwork.postImage(data: selectedUIImage?.jpegData(compressionQuality: 1.0) ?? Data())
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("사진 등록")
                .padding(.leading, 20)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let image = image {
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.leading, 25)
//                    .cornerRadius(10)
            } else {
                Button {
                    showImagePicker.toggle()
                } label: {
                    Image(systemName: "plus.viewfinder")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width:50, height:50)
                        .padding(.leading, 25)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    loadImage()
                    loadImageURL()
                }) {
                    ImagePicker(image: $selectedUIImage)
                }
                .padding(.bottom, 50)
            }
            
            
            Text("내용 입력")
                .padding(.leading, 20)
                .padding(.bottom, -5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                TextEditor(text: $content)
                    .font(.body)
                    .opacity(self.content.isEmpty ? 0.25 : 1)
                    .frame(height: 200)
                
                if self.content.isEmpty {
                    TextEditor(text: $placeholderText)
                        .font(.body)
                        .foregroundColor(.gray)
                        .disabled(true)
                        .padding()
                        .frame(height: 200)
                }
            }.overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()
            .padding(.bottom, 50)
            
            
            Text("상품 태그")
                .padding(.leading, 20)
                .padding(.bottom, -5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                self.showModal = true
            } label: {
                Text("상품태그추가")
                    .padding(.trailing, 10)
            }
            .sheet(isPresented: self.$showModal) {
                TagMenuView()
//                    .presentationDragIndicator(.visible)
            }

        }
        
        
        Button {
            postImage()
//            self.showModal = false
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("업로드")
                .padding(.trailing, 10)
        }
    }
}

//struct PostingView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostingView()
//    }
//}

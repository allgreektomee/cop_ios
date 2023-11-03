//
//  ClassModel.swift
//  agtm
//
//  Created by 20201385 on 2023/06/08.
//

import Foundation

struct ClassSlideModel: Identifiable {
    var id = UUID()
    var imageName : String
    var menuName : String
}

func getClassSlide() -> [ClassSlideModel] {
    return [ClassSlideModel(imageName: "testMenu", menuName: "전체"),
            ClassSlideModel(imageName: "testMenu", menuName: "클래스1"),
            ClassSlideModel(imageName: "testMenu", menuName: "클래스2"),
            ClassSlideModel(imageName: "testMenu", menuName: "클래스3"),
            ClassSlideModel(imageName: "testMenu", menuName: "클래스4"),
            ClassSlideModel(imageName: "testMenu", menuName: "클래스5"),]
}


struct ClassMenuGridModel: Identifiable {
    var id = UUID()
    var imageName : String
    var menuName : String
}


func getClassMenuGrid() -> [ClassMenuGridModel] {
    return [ClassMenuGridModel(imageName: "testMenu", menuName: "게시글0"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글1"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글2"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글3"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글4"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글5"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글0"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글1"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글2"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글3"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글4"),
            ClassMenuGridModel(imageName: "testMenu", menuName: "게시글5"),]
}

//
//  NetworkService.swift
//  agtm
//
//  Created by yujin on 2023/07/14.
//

import Foundation

import Combine
import Moya

enum NetworkService {
    case login(LoginData)
    case signUp(SignUpData)
    case getWineList(page: Int, user: String)
    case getWineDetail(id: Int, user: String)
    case getWineType(type: String, user: String)
    case getWineRecommand(filter: String, user: String)
    case getWineClass(user: String)
    case getWineClassDetail(page: Int, user: String)
    case getProfile
    case getNoticeList
    case getNotice(type: Int)
    case getLikeWineList(name: String)
    case getLikeClassList(name: String)
    case getOrderWineList(name: String)
    case getOrderClassList(name: String)
    case postLikeWine(LikeData, pk: Int, name: String)
    case postLikeClass(LikeData, pk: Int, name: String)
    case getWineReview(id: Int, name: String)
    case getClassReview(id: Int, name: String)
    case postReview(ReviewData, type: String, id: Int, name: String)
    case getUserInfo(name: String)
    case getUserReview(name: String, type: String)
}

extension NetworkService: TargetType {
    var baseURL: URL {
        return URL(string: "https://agtm-back.onrender.com")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "api/v1/users/login"
        case .signUp:
            return "api/v1/users/signup"
        case .getWineList(_, let user):
            return "/api/v1/wine/@\(user)"
        case .getWineDetail(let id, let user):
            return "/api/v1/wine/\(id)/@\(user)"
        case .getWineType(let type, let user):
            return "/api/v1/wine/type/@\(type)/@\(user)"
        case .getWineRecommand(let filter, let user):
            return "api/v1/wine/re/@\(filter)/@\(user)"
        case .getWineClass(let user):
            return "api/v1/class/@\(user)"
        case .getWineClassDetail(let id, let user):
            return "/api/v1/class/\(id)/@\(user)"
        case .getProfile:
            return "/api/v1/users/me"
        case .getNoticeList:
            return "/api/v1/notice"
        case .getNotice(let type):
            return "api/v1/notice/type/\(type)"
        case .getLikeWineList(let name):
            return "api/v1/users/@\(name)/likes/wine"
        case .getLikeClassList(let name):
            return "/api/v1/users/@\(name)/likes/class"
        case .getOrderWineList(let name):
            return "api/v1/users/@\(name)/order/wine"
        case .getOrderClassList(let name):
            return "/api/v1/users/@\(name)/order/class"
        case .postLikeWine(_, let id, let name):
            return "api/v1/like/wine/\(id)/@\(name)"
        case .postLikeClass(_, let id, let name):
            return "api/v1/like/class/\(id)/@\(name)"
        case .getWineReview(let id, let name):
            return "/api/v1/wine/\(id)/reviews/@\(name)"
        case .getClassReview(let id, let name):
            return "/api/v1/class/\(id)/reviews/@\(name)"
        case .postReview(_, let type, let id, let name):
            return "/api/v1/\(type)/\(id)/reviews/@\(name)"
        case .getUserInfo(let name):
            return "/api/v1/users/me/@\(name)"
        case .getUserReview(let name, let type):
            return "/api/v1/users/@\(name)/reviews/\(type)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .signUp, .postLikeWine, .postLikeClass, .postReview:
            return .post
        case .getWineList, .getWineDetail, .getWineClass, .getWineType,
                .getWineRecommand, .getWineClassDetail, .getProfile,
                .getNoticeList, .getNotice, .getLikeWineList,
                .getLikeClassList, .getOrderWineList, .getOrderClassList,
                .getClassReview, .getWineReview, .getUserInfo, .getUserReview:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let data):
            return .requestJSONEncodable(data)
        case .signUp(let data):
            return .requestJSONEncodable(data)
        case .postLikeWine(let data, _, _):
            return .requestJSONEncodable(data)
        case .postLikeClass(let data, _, _):
            return .requestJSONEncodable(data)
        case .postReview(let data, _, _, _):
            return .requestJSONEncodable(data)
        case .getWineList(let page, _):
            let param = ["page" : page] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getWineRecommand(let filter, _):
            let param = ["filter" : filter] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getLikeWineList(let name):
            let param = ["name" : name] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getLikeClassList(let name):
            let param = ["name" : name] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getOrderWineList(let name):
            let param = ["name" : name] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getOrderClassList(let name):
            let param = ["name" : name] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        case .getWineDetail, .getWineClass, .getWineClassDetail, .getWineType, .getProfile, .getNoticeList, .getNotice, .getClassReview, .getWineReview, .getUserInfo, .getUserReview:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var headers = [String:String]()
        
        headers["Content-Type"] = "application/json"
        
        return headers
    }
}

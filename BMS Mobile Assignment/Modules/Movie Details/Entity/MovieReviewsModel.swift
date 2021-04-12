//
//  MovieReviewsModel.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation
struct MovieReviewsModel: Codable {
  let id: Int?
  let page: Int?
  let results: [MovieReview]?
  let total_pages: Int?
  let total_results: Int?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case page = "page"
    case results = "results"
    case total_pages = "total_pages"
    case total_results = "total_results"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decodeIfPresent(Int.self, forKey: .id)
    page = try values.decodeIfPresent(Int.self, forKey: .page)
    results = try values.decodeIfPresent([MovieReview].self, forKey: .results)
    total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
    total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
  }
}

struct MovieReview: Codable {
  let author: String?
  let content: String?
  let id: String?
  let url: String?
  let authorDetails: AuthorDetails?
  
  enum CodingKeys: String, CodingKey {
    case author = "author"
    case content = "content"
    case id = "id"
    case url = "url"
    case authorDetails = "author_details"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    author = try values.decodeIfPresent(String.self, forKey: .author)
    content = try values.decodeIfPresent(String.self, forKey: .content)
    id = try values.decodeIfPresent(String.self, forKey: .id)
    url = try values.decodeIfPresent(String.self, forKey: .url)
    authorDetails = try values.decodeIfPresent(AuthorDetails.self, forKey: .authorDetails)
  }
}

struct AuthorDetails: Codable {
  let name: String?
  let username: String?
  let avatar_path: String?
  let rating: Int?
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case username = "username"
    case avatar_path = "avatar_path"
    case rating = "rating"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    username = try values.decodeIfPresent(String.self, forKey: .username)
    avatar_path = try values.decodeIfPresent(String.self, forKey: .avatar_path)
    rating = try values.decodeIfPresent(Int.self, forKey: .rating)
  }
}

//
//  CreditsModel.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import Foundation
struct CreditsModel: Codable {
  let id: Int?
  let cast: [Cast]?
  let crew: [Crew]?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case cast = "cast"
    case crew = "crew"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decodeIfPresent(Int.self, forKey: .id)
    cast = try values.decodeIfPresent([Cast].self, forKey: .cast)
    crew = try values.decodeIfPresent([Crew].self, forKey: .crew)
  }
}

struct Cast: Codable {
  let cast_id: Int?
  let character: String?
  let credit_id: String?
  let gender: Int?
  let id: Int?
  let name: String?
  let order: Int?
  let profile_path: String?
  
  enum CodingKeys: String, CodingKey {
    case cast_id = "cast_id"
    case character = "character"
    case credit_id = "credit_id"
    case gender = "gender"
    case id = "id"
    case name = "name"
    case order = "order"
    case profile_path = "profile_path"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    cast_id = try values.decodeIfPresent(Int.self, forKey: .cast_id)
    character = try values.decodeIfPresent(String.self, forKey: .character)
    credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
    gender = try values.decodeIfPresent(Int.self, forKey: .gender)
    id = try values.decodeIfPresent(Int.self, forKey: .id)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    order = try values.decodeIfPresent(Int.self, forKey: .order)
    profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
  }
}

struct Crew : Codable {
  let credit_id: String?
  let department: String?
  let gender: Int?
  let id: Int?
  let job: String?
  let name: String?
  let profile_path: String?
  
  enum CodingKeys: String, CodingKey {
    case credit_id = "credit_id"
    case department = "department"
    case gender = "gender"
    case id = "id"
    case job = "job"
    case name = "name"
    case profile_path = "profile_path"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
    department = try values.decodeIfPresent(String.self, forKey: .department)
    gender = try values.decodeIfPresent(Int.self, forKey: .gender)
    id = try values.decodeIfPresent(Int.self, forKey: .id)
    job = try values.decodeIfPresent(String.self, forKey: .job)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
  }
}

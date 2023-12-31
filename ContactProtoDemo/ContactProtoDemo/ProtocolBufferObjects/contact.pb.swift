// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: contact.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Contact {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var firstName: String = String()

  var lastName: String = String()

  var twitterName: String = String()

  var email: String = String()

  var githubLink: String = String()

  var type: Contact.ContactType = .speaker

  var imageName: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum ContactType: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case speaker // = 0
    case attendant // = 1
    case volunteer // = 2
    case UNRECOGNIZED(Int)

    init() {
      self = .speaker
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .speaker
      case 1: self = .attendant
      case 2: self = .volunteer
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .speaker: return 0
      case .attendant: return 1
      case .volunteer: return 2
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Contact.ContactType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Contact.ContactType] = [
    .speaker,
    .attendant,
    .volunteer,
  ]
}

#endif  // swift(>=4.2)

struct Speakers {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var contacts: [Contact] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Contact: @unchecked Sendable {}
extension Contact.ContactType: @unchecked Sendable {}
extension Speakers: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Contact: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Contact"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "first_name"),
    2: .standard(proto: "last_name"),
    3: .standard(proto: "twitter_name"),
    4: .same(proto: "email"),
    5: .standard(proto: "github_link"),
    6: .same(proto: "type"),
    7: .same(proto: "imageName"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.firstName) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.lastName) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.twitterName) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.email) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.githubLink) }()
      case 6: try { try decoder.decodeSingularEnumField(value: &self.type) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.imageName) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.firstName.isEmpty {
      try visitor.visitSingularStringField(value: self.firstName, fieldNumber: 1)
    }
    if !self.lastName.isEmpty {
      try visitor.visitSingularStringField(value: self.lastName, fieldNumber: 2)
    }
    if !self.twitterName.isEmpty {
      try visitor.visitSingularStringField(value: self.twitterName, fieldNumber: 3)
    }
    if !self.email.isEmpty {
      try visitor.visitSingularStringField(value: self.email, fieldNumber: 4)
    }
    if !self.githubLink.isEmpty {
      try visitor.visitSingularStringField(value: self.githubLink, fieldNumber: 5)
    }
    if self.type != .speaker {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 6)
    }
    if !self.imageName.isEmpty {
      try visitor.visitSingularStringField(value: self.imageName, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Contact, rhs: Contact) -> Bool {
    if lhs.firstName != rhs.firstName {return false}
    if lhs.lastName != rhs.lastName {return false}
    if lhs.twitterName != rhs.twitterName {return false}
    if lhs.email != rhs.email {return false}
    if lhs.githubLink != rhs.githubLink {return false}
    if lhs.type != rhs.type {return false}
    if lhs.imageName != rhs.imageName {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Contact.ContactType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SPEAKER"),
    1: .same(proto: "ATTENDANT"),
    2: .same(proto: "VOLUNTEER"),
  ]
}

extension Speakers: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Speakers"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "contacts"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.contacts) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.contacts.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.contacts, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Speakers, rhs: Speakers) -> Bool {
    if lhs.contacts != rhs.contacts {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

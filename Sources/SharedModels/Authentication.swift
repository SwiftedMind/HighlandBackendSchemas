// By Dennis Müller

import Foundation

public struct Authentication: Sendable, Codable, Hashable {
  public enum Kind: String, Sendable, Codable, Hashable {
    case trial
    case entitlement
  }

  public var kind: Kind
  public var token: String
  public var expiration: Date

  public init(kind: Kind, token: String, expiration: Date) {
    self.kind = kind
    self.token = token
    self.expiration = expiration
  }

  public var isValid: Bool {
    expiration >= .now
  }

  public var isExpired: Bool {
    expiration < .now
  }
}

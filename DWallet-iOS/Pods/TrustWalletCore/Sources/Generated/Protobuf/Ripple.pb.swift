// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: Ripple.proto
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

/// https://xrpl.org/currency-formats.html#token-amounts
public struct TW_Ripple_Proto_CurrencyAmount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Currency code
  /// https://xrpl.org/currency-formats.html#currency-codes
  public var currency: String = String()

  /// String number
  /// https://xrpl.org/currency-formats.html#string-numbers
  public var value: String = String()

  /// Account
  /// https://xrpl.org/accounts.html
  public var issuer: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// https://xrpl.org/trustset.html
public struct TW_Ripple_Proto_OperationTrustSet {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var limitAmount: TW_Ripple_Proto_CurrencyAmount {
    get {return _limitAmount ?? TW_Ripple_Proto_CurrencyAmount()}
    set {_limitAmount = newValue}
  }
  /// Returns true if `limitAmount` has been explicitly set.
  public var hasLimitAmount: Bool {return self._limitAmount != nil}
  /// Clears the value of `limitAmount`. Subsequent reads from it will return its default value.
  public mutating func clearLimitAmount() {self._limitAmount = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _limitAmount: TW_Ripple_Proto_CurrencyAmount? = nil
}

/// https://xrpl.org/payment.html
public struct TW_Ripple_Proto_OperationPayment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Transfer amount
  public var amountOneof: TW_Ripple_Proto_OperationPayment.OneOf_AmountOneof? = nil

  public var amount: Int64 {
    get {
      if case .amount(let v)? = amountOneof {return v}
      return 0
    }
    set {amountOneof = .amount(newValue)}
  }

  public var currencyAmount: TW_Ripple_Proto_CurrencyAmount {
    get {
      if case .currencyAmount(let v)? = amountOneof {return v}
      return TW_Ripple_Proto_CurrencyAmount()
    }
    set {amountOneof = .currencyAmount(newValue)}
  }

  /// Target account
  public var destination: String = String()

  /// A Destination Tag
  public var destinationTag: Int64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Transfer amount
  public enum OneOf_AmountOneof: Equatable {
    case amount(Int64)
    case currencyAmount(TW_Ripple_Proto_CurrencyAmount)

  #if !swift(>=4.1)
    public static func ==(lhs: TW_Ripple_Proto_OperationPayment.OneOf_AmountOneof, rhs: TW_Ripple_Proto_OperationPayment.OneOf_AmountOneof) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.amount, .amount): return {
        guard case .amount(let l) = lhs, case .amount(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.currencyAmount, .currencyAmount): return {
        guard case .currencyAmount(let l) = lhs, case .currencyAmount(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

/// https://xrpl.org/nftokenburn.html 
public struct TW_Ripple_Proto_OperationNFTokenBurn {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Hash256 NFTokenId
  public var nftokenID: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// https://xrpl.org/nftokencreateoffer.html 
public struct TW_Ripple_Proto_OperationNFTokenCreateOffer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Hash256 NFTokenId
  public var nftokenID: Data = Data()

  /// Destination account
  public var destination: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// https://xrpl.org/nftokenacceptoffer.html 
public struct TW_Ripple_Proto_OperationNFTokenAcceptOffer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Hash256 NFTokenOffer
  public var sellOffer: Data = Data()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// https://xrpl.org/nftokencanceloffer.html 
public struct TW_Ripple_Proto_OperationNFTokenCancelOffer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Vector256 NFTokenOffers
  public var tokenOffers: [Data] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Input data necessary to create a signed transaction.
public struct TW_Ripple_Proto_SigningInput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Transfer fee
  public var fee: Int64 = 0

  /// Account sequence number
  public var sequence: Int32 = 0

  /// Ledger sequence number
  public var lastLedgerSequence: Int32 = 0

  /// Source account
  public var account: String = String()

  /// Transaction flags, optional
  public var flags: Int64 = 0

  /// The secret private key used for signing (32 bytes).
  public var privateKey: Data = Data()

  public var operationOneof: TW_Ripple_Proto_SigningInput.OneOf_OperationOneof? = nil

  public var opTrustSet: TW_Ripple_Proto_OperationTrustSet {
    get {
      if case .opTrustSet(let v)? = operationOneof {return v}
      return TW_Ripple_Proto_OperationTrustSet()
    }
    set {operationOneof = .opTrustSet(newValue)}
  }

  public var opPayment: TW_Ripple_Proto_OperationPayment {
    get {
      if case .opPayment(let v)? = operationOneof {return v}
      return TW_Ripple_Proto_OperationPayment()
    }
    set {operationOneof = .opPayment(newValue)}
  }

  public var opNftokenBurn: TW_Ripple_Proto_OperationNFTokenBurn {
    get {
      if case .opNftokenBurn(let v)? = operationOneof {return v}
      return TW_Ripple_Proto_OperationNFTokenBurn()
    }
    set {operationOneof = .opNftokenBurn(newValue)}
  }

  public var opNftokenCreateOffer: TW_Ripple_Proto_OperationNFTokenCreateOffer {
    get {
      if case .opNftokenCreateOffer(let v)? = operationOneof {return v}
      return TW_Ripple_Proto_OperationNFTokenCreateOffer()
    }
    set {operationOneof = .opNftokenCreateOffer(newValue)}
  }

  public var opNftokenAcceptOffer: TW_Ripple_Proto_OperationNFTokenAcceptOffer {
    get {
      if case .opNftokenAcceptOffer(let v)? = operationOneof {return v}
      return TW_Ripple_Proto_OperationNFTokenAcceptOffer()
    }
    set {operationOneof = .opNftokenAcceptOffer(newValue)}
  }

  public var opNftokenCancelOffer: TW_Ripple_Proto_OperationNFTokenCancelOffer {
    get {
      if case .opNftokenCancelOffer(let v)? = operationOneof {return v}
      return TW_Ripple_Proto_OperationNFTokenCancelOffer()
    }
    set {operationOneof = .opNftokenCancelOffer(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_OperationOneof: Equatable {
    case opTrustSet(TW_Ripple_Proto_OperationTrustSet)
    case opPayment(TW_Ripple_Proto_OperationPayment)
    case opNftokenBurn(TW_Ripple_Proto_OperationNFTokenBurn)
    case opNftokenCreateOffer(TW_Ripple_Proto_OperationNFTokenCreateOffer)
    case opNftokenAcceptOffer(TW_Ripple_Proto_OperationNFTokenAcceptOffer)
    case opNftokenCancelOffer(TW_Ripple_Proto_OperationNFTokenCancelOffer)

  #if !swift(>=4.1)
    public static func ==(lhs: TW_Ripple_Proto_SigningInput.OneOf_OperationOneof, rhs: TW_Ripple_Proto_SigningInput.OneOf_OperationOneof) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.opTrustSet, .opTrustSet): return {
        guard case .opTrustSet(let l) = lhs, case .opTrustSet(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.opPayment, .opPayment): return {
        guard case .opPayment(let l) = lhs, case .opPayment(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.opNftokenBurn, .opNftokenBurn): return {
        guard case .opNftokenBurn(let l) = lhs, case .opNftokenBurn(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.opNftokenCreateOffer, .opNftokenCreateOffer): return {
        guard case .opNftokenCreateOffer(let l) = lhs, case .opNftokenCreateOffer(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.opNftokenAcceptOffer, .opNftokenAcceptOffer): return {
        guard case .opNftokenAcceptOffer(let l) = lhs, case .opNftokenAcceptOffer(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.opNftokenCancelOffer, .opNftokenCancelOffer): return {
        guard case .opNftokenCancelOffer(let l) = lhs, case .opNftokenCancelOffer(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

/// Result containing the signed and encoded transaction.
public struct TW_Ripple_Proto_SigningOutput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Encoded transaction
  public var encoded: Data = Data()

  /// Optional error
  public var error: TW_Common_Proto_SigningError = .ok

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "TW.Ripple.Proto"

extension TW_Ripple_Proto_CurrencyAmount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CurrencyAmount"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "currency"),
    2: .same(proto: "value"),
    3: .same(proto: "issuer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.currency) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.value) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.issuer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.currency.isEmpty {
      try visitor.visitSingularStringField(value: self.currency, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 2)
    }
    if !self.issuer.isEmpty {
      try visitor.visitSingularStringField(value: self.issuer, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_CurrencyAmount, rhs: TW_Ripple_Proto_CurrencyAmount) -> Bool {
    if lhs.currency != rhs.currency {return false}
    if lhs.value != rhs.value {return false}
    if lhs.issuer != rhs.issuer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_OperationTrustSet: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OperationTrustSet"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "limit_amount"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._limitAmount) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._limitAmount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_OperationTrustSet, rhs: TW_Ripple_Proto_OperationTrustSet) -> Bool {
    if lhs._limitAmount != rhs._limitAmount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_OperationPayment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OperationPayment"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .standard(proto: "currency_amount"),
    3: .same(proto: "destination"),
    4: .standard(proto: "destination_tag"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Int64?
        try decoder.decodeSingularInt64Field(value: &v)
        if let v = v {
          if self.amountOneof != nil {try decoder.handleConflictingOneOf()}
          self.amountOneof = .amount(v)
        }
      }()
      case 2: try {
        var v: TW_Ripple_Proto_CurrencyAmount?
        var hadOneofValue = false
        if let current = self.amountOneof {
          hadOneofValue = true
          if case .currencyAmount(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.amountOneof = .currencyAmount(v)
        }
      }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.destination) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.destinationTag) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    switch self.amountOneof {
    case .amount?: try {
      guard case .amount(let v)? = self.amountOneof else { preconditionFailure() }
      try visitor.visitSingularInt64Field(value: v, fieldNumber: 1)
    }()
    case .currencyAmount?: try {
      guard case .currencyAmount(let v)? = self.amountOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    if !self.destination.isEmpty {
      try visitor.visitSingularStringField(value: self.destination, fieldNumber: 3)
    }
    if self.destinationTag != 0 {
      try visitor.visitSingularInt64Field(value: self.destinationTag, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_OperationPayment, rhs: TW_Ripple_Proto_OperationPayment) -> Bool {
    if lhs.amountOneof != rhs.amountOneof {return false}
    if lhs.destination != rhs.destination {return false}
    if lhs.destinationTag != rhs.destinationTag {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_OperationNFTokenBurn: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OperationNFTokenBurn"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "nftoken_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.nftokenID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.nftokenID.isEmpty {
      try visitor.visitSingularBytesField(value: self.nftokenID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_OperationNFTokenBurn, rhs: TW_Ripple_Proto_OperationNFTokenBurn) -> Bool {
    if lhs.nftokenID != rhs.nftokenID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_OperationNFTokenCreateOffer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OperationNFTokenCreateOffer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "nftoken_id"),
    2: .same(proto: "destination"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.nftokenID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.destination) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.nftokenID.isEmpty {
      try visitor.visitSingularBytesField(value: self.nftokenID, fieldNumber: 1)
    }
    if !self.destination.isEmpty {
      try visitor.visitSingularStringField(value: self.destination, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_OperationNFTokenCreateOffer, rhs: TW_Ripple_Proto_OperationNFTokenCreateOffer) -> Bool {
    if lhs.nftokenID != rhs.nftokenID {return false}
    if lhs.destination != rhs.destination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_OperationNFTokenAcceptOffer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OperationNFTokenAcceptOffer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sell_offer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.sellOffer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sellOffer.isEmpty {
      try visitor.visitSingularBytesField(value: self.sellOffer, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_OperationNFTokenAcceptOffer, rhs: TW_Ripple_Proto_OperationNFTokenAcceptOffer) -> Bool {
    if lhs.sellOffer != rhs.sellOffer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_OperationNFTokenCancelOffer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OperationNFTokenCancelOffer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "token_offers"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedBytesField(value: &self.tokenOffers) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tokenOffers.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.tokenOffers, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_OperationNFTokenCancelOffer, rhs: TW_Ripple_Proto_OperationNFTokenCancelOffer) -> Bool {
    if lhs.tokenOffers != rhs.tokenOffers {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_SigningInput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningInput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "fee"),
    2: .same(proto: "sequence"),
    3: .standard(proto: "last_ledger_sequence"),
    4: .same(proto: "account"),
    5: .same(proto: "flags"),
    6: .standard(proto: "private_key"),
    7: .standard(proto: "op_trust_set"),
    8: .standard(proto: "op_payment"),
    9: .standard(proto: "op_nftoken_burn"),
    10: .standard(proto: "op_nftoken_create_offer"),
    11: .standard(proto: "op_nftoken_accept_offer"),
    12: .standard(proto: "op_nftoken_cancel_offer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.fee) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.sequence) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.lastLedgerSequence) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.account) }()
      case 5: try { try decoder.decodeSingularInt64Field(value: &self.flags) }()
      case 6: try { try decoder.decodeSingularBytesField(value: &self.privateKey) }()
      case 7: try {
        var v: TW_Ripple_Proto_OperationTrustSet?
        var hadOneofValue = false
        if let current = self.operationOneof {
          hadOneofValue = true
          if case .opTrustSet(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.operationOneof = .opTrustSet(v)
        }
      }()
      case 8: try {
        var v: TW_Ripple_Proto_OperationPayment?
        var hadOneofValue = false
        if let current = self.operationOneof {
          hadOneofValue = true
          if case .opPayment(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.operationOneof = .opPayment(v)
        }
      }()
      case 9: try {
        var v: TW_Ripple_Proto_OperationNFTokenBurn?
        var hadOneofValue = false
        if let current = self.operationOneof {
          hadOneofValue = true
          if case .opNftokenBurn(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.operationOneof = .opNftokenBurn(v)
        }
      }()
      case 10: try {
        var v: TW_Ripple_Proto_OperationNFTokenCreateOffer?
        var hadOneofValue = false
        if let current = self.operationOneof {
          hadOneofValue = true
          if case .opNftokenCreateOffer(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.operationOneof = .opNftokenCreateOffer(v)
        }
      }()
      case 11: try {
        var v: TW_Ripple_Proto_OperationNFTokenAcceptOffer?
        var hadOneofValue = false
        if let current = self.operationOneof {
          hadOneofValue = true
          if case .opNftokenAcceptOffer(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.operationOneof = .opNftokenAcceptOffer(v)
        }
      }()
      case 12: try {
        var v: TW_Ripple_Proto_OperationNFTokenCancelOffer?
        var hadOneofValue = false
        if let current = self.operationOneof {
          hadOneofValue = true
          if case .opNftokenCancelOffer(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.operationOneof = .opNftokenCancelOffer(v)
        }
      }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.fee != 0 {
      try visitor.visitSingularInt64Field(value: self.fee, fieldNumber: 1)
    }
    if self.sequence != 0 {
      try visitor.visitSingularInt32Field(value: self.sequence, fieldNumber: 2)
    }
    if self.lastLedgerSequence != 0 {
      try visitor.visitSingularInt32Field(value: self.lastLedgerSequence, fieldNumber: 3)
    }
    if !self.account.isEmpty {
      try visitor.visitSingularStringField(value: self.account, fieldNumber: 4)
    }
    if self.flags != 0 {
      try visitor.visitSingularInt64Field(value: self.flags, fieldNumber: 5)
    }
    if !self.privateKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.privateKey, fieldNumber: 6)
    }
    switch self.operationOneof {
    case .opTrustSet?: try {
      guard case .opTrustSet(let v)? = self.operationOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }()
    case .opPayment?: try {
      guard case .opPayment(let v)? = self.operationOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
    }()
    case .opNftokenBurn?: try {
      guard case .opNftokenBurn(let v)? = self.operationOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
    }()
    case .opNftokenCreateOffer?: try {
      guard case .opNftokenCreateOffer(let v)? = self.operationOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
    }()
    case .opNftokenAcceptOffer?: try {
      guard case .opNftokenAcceptOffer(let v)? = self.operationOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
    }()
    case .opNftokenCancelOffer?: try {
      guard case .opNftokenCancelOffer(let v)? = self.operationOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_SigningInput, rhs: TW_Ripple_Proto_SigningInput) -> Bool {
    if lhs.fee != rhs.fee {return false}
    if lhs.sequence != rhs.sequence {return false}
    if lhs.lastLedgerSequence != rhs.lastLedgerSequence {return false}
    if lhs.account != rhs.account {return false}
    if lhs.flags != rhs.flags {return false}
    if lhs.privateKey != rhs.privateKey {return false}
    if lhs.operationOneof != rhs.operationOneof {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Ripple_Proto_SigningOutput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningOutput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "encoded"),
    2: .same(proto: "error"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.encoded) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.error) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.encoded.isEmpty {
      try visitor.visitSingularBytesField(value: self.encoded, fieldNumber: 1)
    }
    if self.error != .ok {
      try visitor.visitSingularEnumField(value: self.error, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Ripple_Proto_SigningOutput, rhs: TW_Ripple_Proto_SigningOutput) -> Bool {
    if lhs.encoded != rhs.encoded {return false}
    if lhs.error != rhs.error {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

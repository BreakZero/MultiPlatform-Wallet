// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: THORChainSwap.proto
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

/// Supported blockchains
public enum TW_THORChainSwap_Proto_Chain: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case thor // = 0
  case btc // = 1
  case eth // = 2
  case bnb // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .thor
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .thor
    case 1: self = .btc
    case 2: self = .eth
    case 3: self = .bnb
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .thor: return 0
    case .btc: return 1
    case .eth: return 2
    case .bnb: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension TW_THORChainSwap_Proto_Chain: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [TW_THORChainSwap_Proto_Chain] = [
    .thor,
    .btc,
    .eth,
    .bnb,
  ]
}

#endif  // swift(>=4.2)

/// Predefined error codes
public enum TW_THORChainSwap_Proto_ErrorCode: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// OK
  case ok // = 0
  case errorGeneral // = 1
  case errorInputProtoDeserialization // = 2
  case errorUnsupportedFromChain // = 13
  case errorUnsupportedToChain // = 14
  case errorInvalidFromAddress // = 15
  case errorInvalidToAddress // = 16
  case errorInvalidVaultAddress // = 21
  case errorInvalidRouterAddress // = 22
  case UNRECOGNIZED(Int)

  public init() {
    self = .ok
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .ok
    case 1: self = .errorGeneral
    case 2: self = .errorInputProtoDeserialization
    case 13: self = .errorUnsupportedFromChain
    case 14: self = .errorUnsupportedToChain
    case 15: self = .errorInvalidFromAddress
    case 16: self = .errorInvalidToAddress
    case 21: self = .errorInvalidVaultAddress
    case 22: self = .errorInvalidRouterAddress
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .ok: return 0
    case .errorGeneral: return 1
    case .errorInputProtoDeserialization: return 2
    case .errorUnsupportedFromChain: return 13
    case .errorUnsupportedToChain: return 14
    case .errorInvalidFromAddress: return 15
    case .errorInvalidToAddress: return 16
    case .errorInvalidVaultAddress: return 21
    case .errorInvalidRouterAddress: return 22
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension TW_THORChainSwap_Proto_ErrorCode: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [TW_THORChainSwap_Proto_ErrorCode] = [
    .ok,
    .errorGeneral,
    .errorInputProtoDeserialization,
    .errorUnsupportedFromChain,
    .errorUnsupportedToChain,
    .errorInvalidFromAddress,
    .errorInvalidToAddress,
    .errorInvalidVaultAddress,
    .errorInvalidRouterAddress,
  ]
}

#endif  // swift(>=4.2)

/// An error code + a free text
public struct TW_THORChainSwap_Proto_Error {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// code of the error
  public var code: TW_THORChainSwap_Proto_ErrorCode = .ok

  /// optional error message
  public var message: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Represents an asset.  Examples: BNB.BNB, RUNE.RUNE, BNB.RUNE-67C
public struct TW_THORChainSwap_Proto_Asset {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Chain ID
  public var chain: TW_THORChainSwap_Proto_Chain = .thor

  /// Symbol
  public var symbol: String = String()

  /// The ID of the token (blockchain-specific format)
  public var tokenID: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Input for a swap between source and destination chains; for creating a TX on the source chain.
public struct TW_THORChainSwap_Proto_SwapInput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Source chain
  public var fromAsset: TW_THORChainSwap_Proto_Asset {
    get {return _fromAsset ?? TW_THORChainSwap_Proto_Asset()}
    set {_fromAsset = newValue}
  }
  /// Returns true if `fromAsset` has been explicitly set.
  public var hasFromAsset: Bool {return self._fromAsset != nil}
  /// Clears the value of `fromAsset`. Subsequent reads from it will return its default value.
  public mutating func clearFromAsset() {self._fromAsset = nil}

  /// Source address, on source chain
  public var fromAddress: String = String()

  /// Destination chain+asset, on destination chain
  public var toAsset: TW_THORChainSwap_Proto_Asset {
    get {return _toAsset ?? TW_THORChainSwap_Proto_Asset()}
    set {_toAsset = newValue}
  }
  /// Returns true if `toAsset` has been explicitly set.
  public var hasToAsset: Bool {return self._toAsset != nil}
  /// Clears the value of `toAsset`. Subsequent reads from it will return its default value.
  public mutating func clearToAsset() {self._toAsset = nil}

  /// Destination address, on destination chain
  public var toAddress: String = String()

  /// ThorChainSwap vault, on the source chain. Should be queried afresh, as it may change
  public var vaultAddress: String = String()

  /// ThorChain router, only in case of Ethereum source network
  public var routerAddress: String = String()

  /// The source amount, integer as string, in the smallest native unit of the chain
  public var fromAmount: String = String()

  /// The minimum accepted destination amount.  Actual destination amount will depend on current rates, limit amount can be used to prevent using very unfavorable rates.
  public var toAmountLimit: String = String()

  /// Optional affiliate fee destination address.  A Rune address.
  public var affiliateFeeAddress: String = String()

  /// Optional affiliate fee, percentage base points, e.g. 100 means 1%, 0 - 1000, as string. Empty means to ignore it.
  public var affiliateFeeRateBp: String = String()

  /// Optional extra custom memo, reserved for later use.
  public var extraMemo: String = String()

  /// Optional expirationTime, will be now() + 15 min if not set
  public var expirationTime: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _fromAsset: TW_THORChainSwap_Proto_Asset? = nil
  fileprivate var _toAsset: TW_THORChainSwap_Proto_Asset? = nil
}

/// Result of the swap, a SigningInput struct for the specific chain
public struct TW_THORChainSwap_Proto_SwapOutput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Source chain
  public var fromChain: TW_THORChainSwap_Proto_Chain {
    get {return _storage._fromChain}
    set {_uniqueStorage()._fromChain = newValue}
  }

  /// Destination chain
  public var toChain: TW_THORChainSwap_Proto_Chain {
    get {return _storage._toChain}
    set {_uniqueStorage()._toChain = newValue}
  }

  /// Error code, filled in case of error, OK/empty on success
  public var error: TW_THORChainSwap_Proto_Error {
    get {return _storage._error ?? TW_THORChainSwap_Proto_Error()}
    set {_uniqueStorage()._error = newValue}
  }
  /// Returns true if `error` has been explicitly set.
  public var hasError: Bool {return _storage._error != nil}
  /// Clears the value of `error`. Subsequent reads from it will return its default value.
  public mutating func clearError() {_uniqueStorage()._error = nil}

  /// Prepared unsigned transaction input, on the source chain, to THOR.  Some fields must be completed, and it has to be signed.
  public var signingInputOneof: OneOf_SigningInputOneof? {
    get {return _storage._signingInputOneof}
    set {_uniqueStorage()._signingInputOneof = newValue}
  }

  public var bitcoin: TW_Bitcoin_Proto_SigningInput {
    get {
      if case .bitcoin(let v)? = _storage._signingInputOneof {return v}
      return TW_Bitcoin_Proto_SigningInput()
    }
    set {_uniqueStorage()._signingInputOneof = .bitcoin(newValue)}
  }

  public var ethereum: TW_Ethereum_Proto_SigningInput {
    get {
      if case .ethereum(let v)? = _storage._signingInputOneof {return v}
      return TW_Ethereum_Proto_SigningInput()
    }
    set {_uniqueStorage()._signingInputOneof = .ethereum(newValue)}
  }

  public var binance: TW_Binance_Proto_SigningInput {
    get {
      if case .binance(let v)? = _storage._signingInputOneof {return v}
      return TW_Binance_Proto_SigningInput()
    }
    set {_uniqueStorage()._signingInputOneof = .binance(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Prepared unsigned transaction input, on the source chain, to THOR.  Some fields must be completed, and it has to be signed.
  public enum OneOf_SigningInputOneof: Equatable {
    case bitcoin(TW_Bitcoin_Proto_SigningInput)
    case ethereum(TW_Ethereum_Proto_SigningInput)
    case binance(TW_Binance_Proto_SigningInput)

  #if !swift(>=4.1)
    public static func ==(lhs: TW_THORChainSwap_Proto_SwapOutput.OneOf_SigningInputOneof, rhs: TW_THORChainSwap_Proto_SwapOutput.OneOf_SigningInputOneof) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.bitcoin, .bitcoin): return {
        guard case .bitcoin(let l) = lhs, case .bitcoin(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.ethereum, .ethereum): return {
        guard case .ethereum(let l) = lhs, case .ethereum(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.binance, .binance): return {
        guard case .binance(let l) = lhs, case .binance(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "TW.THORChainSwap.Proto"

extension TW_THORChainSwap_Proto_Chain: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "THOR"),
    1: .same(proto: "BTC"),
    2: .same(proto: "ETH"),
    3: .same(proto: "BNB"),
  ]
}

extension TW_THORChainSwap_Proto_ErrorCode: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "OK"),
    1: .same(proto: "Error_general"),
    2: .same(proto: "Error_Input_proto_deserialization"),
    13: .same(proto: "Error_Unsupported_from_chain"),
    14: .same(proto: "Error_Unsupported_to_chain"),
    15: .same(proto: "Error_Invalid_from_address"),
    16: .same(proto: "Error_Invalid_to_address"),
    21: .same(proto: "Error_Invalid_vault_address"),
    22: .same(proto: "Error_Invalid_router_address"),
  ]
}

extension TW_THORChainSwap_Proto_Error: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Error"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "code"),
    2: .same(proto: "message"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.code) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.message) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.code != .ok {
      try visitor.visitSingularEnumField(value: self.code, fieldNumber: 1)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_THORChainSwap_Proto_Error, rhs: TW_THORChainSwap_Proto_Error) -> Bool {
    if lhs.code != rhs.code {return false}
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_THORChainSwap_Proto_Asset: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Asset"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "chain"),
    2: .same(proto: "symbol"),
    3: .standard(proto: "token_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.chain) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.symbol) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.tokenID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.chain != .thor {
      try visitor.visitSingularEnumField(value: self.chain, fieldNumber: 1)
    }
    if !self.symbol.isEmpty {
      try visitor.visitSingularStringField(value: self.symbol, fieldNumber: 2)
    }
    if !self.tokenID.isEmpty {
      try visitor.visitSingularStringField(value: self.tokenID, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_THORChainSwap_Proto_Asset, rhs: TW_THORChainSwap_Proto_Asset) -> Bool {
    if lhs.chain != rhs.chain {return false}
    if lhs.symbol != rhs.symbol {return false}
    if lhs.tokenID != rhs.tokenID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_THORChainSwap_Proto_SwapInput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SwapInput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "from_asset"),
    2: .standard(proto: "from_address"),
    3: .standard(proto: "to_asset"),
    4: .standard(proto: "to_address"),
    5: .standard(proto: "vault_address"),
    6: .standard(proto: "router_address"),
    7: .standard(proto: "from_amount"),
    8: .standard(proto: "to_amount_limit"),
    9: .standard(proto: "affiliate_fee_address"),
    10: .standard(proto: "affiliate_fee_rate_bp"),
    11: .standard(proto: "extra_memo"),
    12: .standard(proto: "expiration_time"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._fromAsset) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.fromAddress) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._toAsset) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.toAddress) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.vaultAddress) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.routerAddress) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.fromAmount) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.toAmountLimit) }()
      case 9: try { try decoder.decodeSingularStringField(value: &self.affiliateFeeAddress) }()
      case 10: try { try decoder.decodeSingularStringField(value: &self.affiliateFeeRateBp) }()
      case 11: try { try decoder.decodeSingularStringField(value: &self.extraMemo) }()
      case 12: try { try decoder.decodeSingularUInt64Field(value: &self.expirationTime) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._fromAsset {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.fromAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.fromAddress, fieldNumber: 2)
    }
    try { if let v = self._toAsset {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    if !self.toAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.toAddress, fieldNumber: 4)
    }
    if !self.vaultAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.vaultAddress, fieldNumber: 5)
    }
    if !self.routerAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.routerAddress, fieldNumber: 6)
    }
    if !self.fromAmount.isEmpty {
      try visitor.visitSingularStringField(value: self.fromAmount, fieldNumber: 7)
    }
    if !self.toAmountLimit.isEmpty {
      try visitor.visitSingularStringField(value: self.toAmountLimit, fieldNumber: 8)
    }
    if !self.affiliateFeeAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.affiliateFeeAddress, fieldNumber: 9)
    }
    if !self.affiliateFeeRateBp.isEmpty {
      try visitor.visitSingularStringField(value: self.affiliateFeeRateBp, fieldNumber: 10)
    }
    if !self.extraMemo.isEmpty {
      try visitor.visitSingularStringField(value: self.extraMemo, fieldNumber: 11)
    }
    if self.expirationTime != 0 {
      try visitor.visitSingularUInt64Field(value: self.expirationTime, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_THORChainSwap_Proto_SwapInput, rhs: TW_THORChainSwap_Proto_SwapInput) -> Bool {
    if lhs._fromAsset != rhs._fromAsset {return false}
    if lhs.fromAddress != rhs.fromAddress {return false}
    if lhs._toAsset != rhs._toAsset {return false}
    if lhs.toAddress != rhs.toAddress {return false}
    if lhs.vaultAddress != rhs.vaultAddress {return false}
    if lhs.routerAddress != rhs.routerAddress {return false}
    if lhs.fromAmount != rhs.fromAmount {return false}
    if lhs.toAmountLimit != rhs.toAmountLimit {return false}
    if lhs.affiliateFeeAddress != rhs.affiliateFeeAddress {return false}
    if lhs.affiliateFeeRateBp != rhs.affiliateFeeRateBp {return false}
    if lhs.extraMemo != rhs.extraMemo {return false}
    if lhs.expirationTime != rhs.expirationTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_THORChainSwap_Proto_SwapOutput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SwapOutput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "from_chain"),
    2: .standard(proto: "to_chain"),
    3: .same(proto: "error"),
    4: .same(proto: "bitcoin"),
    5: .same(proto: "ethereum"),
    6: .same(proto: "binance"),
  ]

  fileprivate class _StorageClass {
    var _fromChain: TW_THORChainSwap_Proto_Chain = .thor
    var _toChain: TW_THORChainSwap_Proto_Chain = .thor
    var _error: TW_THORChainSwap_Proto_Error? = nil
    var _signingInputOneof: TW_THORChainSwap_Proto_SwapOutput.OneOf_SigningInputOneof?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _fromChain = source._fromChain
      _toChain = source._toChain
      _error = source._error
      _signingInputOneof = source._signingInputOneof
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularEnumField(value: &_storage._fromChain) }()
        case 2: try { try decoder.decodeSingularEnumField(value: &_storage._toChain) }()
        case 3: try { try decoder.decodeSingularMessageField(value: &_storage._error) }()
        case 4: try {
          var v: TW_Bitcoin_Proto_SigningInput?
          var hadOneofValue = false
          if let current = _storage._signingInputOneof {
            hadOneofValue = true
            if case .bitcoin(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {
            if hadOneofValue {try decoder.handleConflictingOneOf()}
            _storage._signingInputOneof = .bitcoin(v)
          }
        }()
        case 5: try {
          var v: TW_Ethereum_Proto_SigningInput?
          var hadOneofValue = false
          if let current = _storage._signingInputOneof {
            hadOneofValue = true
            if case .ethereum(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {
            if hadOneofValue {try decoder.handleConflictingOneOf()}
            _storage._signingInputOneof = .ethereum(v)
          }
        }()
        case 6: try {
          var v: TW_Binance_Proto_SigningInput?
          var hadOneofValue = false
          if let current = _storage._signingInputOneof {
            hadOneofValue = true
            if case .binance(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {
            if hadOneofValue {try decoder.handleConflictingOneOf()}
            _storage._signingInputOneof = .binance(v)
          }
        }()
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      if _storage._fromChain != .thor {
        try visitor.visitSingularEnumField(value: _storage._fromChain, fieldNumber: 1)
      }
      if _storage._toChain != .thor {
        try visitor.visitSingularEnumField(value: _storage._toChain, fieldNumber: 2)
      }
      try { if let v = _storage._error {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      } }()
      switch _storage._signingInputOneof {
      case .bitcoin?: try {
        guard case .bitcoin(let v)? = _storage._signingInputOneof else { preconditionFailure() }
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }()
      case .ethereum?: try {
        guard case .ethereum(let v)? = _storage._signingInputOneof else { preconditionFailure() }
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }()
      case .binance?: try {
        guard case .binance(let v)? = _storage._signingInputOneof else { preconditionFailure() }
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }()
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_THORChainSwap_Proto_SwapOutput, rhs: TW_THORChainSwap_Proto_SwapOutput) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._fromChain != rhs_storage._fromChain {return false}
        if _storage._toChain != rhs_storage._toChain {return false}
        if _storage._error != rhs_storage._error {return false}
        if _storage._signingInputOneof != rhs_storage._signingInputOneof {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

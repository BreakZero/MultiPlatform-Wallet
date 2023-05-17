// Copyright © 2017-2022 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

///  Registered human-readable parts for BIP-0173
///
/// - SeeAlso: https://github.com/satoshilabs/slips/blob/master/slip-0173.md
public enum HRP: UInt32, CaseIterable, CustomStringConvertible  {
    case unknown = 0
    case bitcoin = 1
    case litecoin = 2
    case viacoin = 3
    case groestlcoin = 4
    case digiByte = 5
    case monacoin = 6
    case cosmos = 7
    case bitcoinCash = 8
    case bitcoinGold = 9
    case ioTeX = 10
    case nervos = 11
    case zilliqa = 12
    case terra = 13
    case cryptoOrg = 14
    case kava = 15
    case oasis = 16
    case bluzelle = 17
    case bandChain = 18
    case multiversX = 19
    case secret = 20
    case agoric = 21
    case binance = 22
    case ecash = 23
    case thorchain = 24
    case harmony = 25
    case cardano = 26
    case qtum = 27
    case nativeInjective = 28
    case osmosis = 29
    case terraV2 = 30
    case nativeEvmos = 31

    public var description: String {
        switch self {
        case .unknown: return ""
        case .bitcoin: return "bc"
        case .litecoin: return "ltc"
        case .viacoin: return "via"
        case .groestlcoin: return "grs"
        case .digiByte: return "dgb"
        case .monacoin: return "mona"
        case .cosmos: return "cosmos"
        case .bitcoinCash: return "bitcoincash"
        case .bitcoinGold: return "btg"
        case .ioTeX: return "io"
        case .nervos: return "ckb"
        case .zilliqa: return "zil"
        case .terra: return "terra"
        case .cryptoOrg: return "cro"
        case .kava: return "kava"
        case .oasis: return "oasis"
        case .bluzelle: return "bluzelle"
        case .bandChain: return "band"
        case .multiversX: return "erd"
        case .secret: return "secret"
        case .agoric: return "agoric"
        case .binance: return "bnb"
        case .ecash: return "ecash"
        case .thorchain: return "thor"
        case .harmony: return "one"
        case .cardano: return "addr"
        case .qtum: return "qc"
        case .nativeInjective: return "inj"
        case .osmosis: return "osmo"
        case .terraV2: return "terra"
        case .nativeEvmos: return "evmos"
        }
    }
}

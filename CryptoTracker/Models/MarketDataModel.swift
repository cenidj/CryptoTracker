//
//  MarketDataModel.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 3/5/26.
//
// https://api.coingecko.com/api/v3/global


/*
 {
 "data": {
 "active_cryptocurrencies": 18490,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 1477,
 "total_market_cap": {63 items},
 "total_volume": {
 "btc": 1689384.7583202962,
 "eth": 57620571.78376584,
 "ltc": 2157689021.941341,
 "bch": 260008097.50651842,
 "bnb": 184584659.58492795,
 "eos": 1519193211452.3208,
 "xrp": 85186918030.0029,
 "xlm": 761181763557.1982,
 "link": 12988973922.206308,
 "dot": 78365123221.9616,
 "yfi": 45636558.39773716,
 "sol": 1347343575.8634708,
 "usd": 119647980134.1661,
 "aed": 439407207042.725,
 "ars": 168401630575320.53,
 "aud": 170297841676.48178,
 "bdt": 14631387880395.547,
 "bhd": 45144499032.40235,
 "bmd": 119647980134.1661,
 "brl": 629994474598.4381,
 "cad": 163421791906.15146,
 "chf": 93381060815.41194,
 "clp": 108421410158177.28,
 "cny": 824554055094.6056,
 "czk": 2511530750996.28,
 "dkk": 769630128405.9374,
 "eur": 103019782447.04024,
 "gbp": 89516790001.0188,
 "gel": 323647786262.9192,
 "hkd": 935856588614.4137,
 "huf": 39892882010374.15,
 "idr": 2025028449625341.2,
 "ils": 368547485527.9671,
 "inr": 10966635696331.172,
 "jpy": 18839202624020.15,
 "krw": 176588843812782.88,
 "kwd": 36800847137.74626,
 "lkr": 37195537108693.66,
 "mmk": 251238025165523.2,
 "mxn": 2115549419399.3093,
 "myr": 472310401579.6207,
 "ngn": 165748346879860.3,
 "nok": 1156612974712.9768,
 "nzd": 202425238710.18747,
 "php": 7034104752087.624,
 "pkr": 33432680999094.027,
 "pln": 439996951936.80634,
 "rub": 9412093760200.602,
 "sar": 449071533342.102,
 "sek": 1103037121816.48,
 "sgd": 153016964257.72412,
 "thb": 3798823369259.774,
 "try": 5272874519714.687,
 "twd": 3813288929705.9746,
 "uah": 5242005580136.033,
 "vef": 11980352250.834051,
 "vnd": 3136617033332532.5,
 "zar": 1986488254076.0679,
 "xdr": 83946219341.93228,
 "xag": 1456599296.0725436,
 "xau": 23555097.849013273,
 "bits": 1689384758320.2961,
 "sats": 168938475832029.62
 },
 "market_cap_percentage": {
 "btc": 57.050428913498294,
 "eth": 10.08253557293353,
 "usdt": 7.402355108067196,
 "bnb": 3.5543067177318752,
 "xrp": 3.4570159261991193,
 "usdc": 3.103806995437731,
 "sol": 2.036711796470302,
 "trx": 1.0878670071619232,
 "steth": 0.7714115287213216,
 "figr_heloc": 0.6493181580554851
 },
 "market_cap_change_percentage_24h_usd": -1.6604951722231582,
 "volume_change_percentage_24h_usd": -30.697243713440365,
 "updated_at": 1772759694
 }
 }
 
 
 */

import Foundation


struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" } ) {
            return "$" + item.value.formattedWithAbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}

//struct TotalMarketCap: Codable {
//    let btc, eth, ltc, bch: Double?
//    let bnb, eos, xrp, xlm: Double?
//    let link, dot, yfi, sol: Double?
//    let usd, aed: Double?
//    let ars: Int?
//    let aud, bdt, bhd, bmd: Double?
//    let brl, cad, chf, clp: Double?
//    let cny, czk, dkk, eur: Double?
//    let gbp, gel, hkd, huf: Double?
//    let idr: String?
//    let ils, inr, jpy: Double?
//    let krw: Int?
//    let kwd, lkr: Double?
//    let mmk: Int?
//    let mxn, myr, ngn, nok: Double?
//    let nzd, php, pkr, pln: Double?
//    let rub, sar, sek, sgd: Double?
//    let thb, totalMarketCapTry, twd, uah: Double?
//    let vef: Double?
//    let vnd: String?
//    let zar, xdr, xag, xau: Double?
//    let bits, sats: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case btc, eth, ltc, bch, bnb, eos, xrp, xlm, link, dot, yfi, sol, usd, aed, ars, aud, bdt, bhd, bmd, brl, cad, chf, clp, cny, czk, dkk, eur, gbp, gel, hkd, huf, idr, ils, inr, jpy, krw, kwd, lkr, mmk, mxn, myr, ngn, nok, nzd, php, pkr, pln, rub, sar, sek, sgd, thb
//        case totalMarketCapTry = "try"
//        case twd, uah, vef, vnd, zar, xdr, xag, xau, bits, sats
//    }
//}

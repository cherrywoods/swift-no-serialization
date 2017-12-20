//
//  NoSerialization.swift
//  SwiftNoSerialization
//
//  Created by cherrywoods on 16.12.17.
//

import Foundation
import MetaSerialization

/**
 This serialization class converts swift objects to Metas using another translator.
 One can say, that this serialization class will just wrap or unwrap the swift object and not encode or decode it.
 */
public class ToMetaSerialization: Serialization {
    
    public typealias Raw = Meta
    
    private let noTranslator: NoTranslator
    
    public func provideNewEncoder() -> MetaEncoder {
        
        return MetaEncoder(translator: noTranslator)
        
    }
    
    public func provideNewDecoder(raw: Meta) -> MetaDecoder {
        
        return try! MetaDecoder(translator: noTranslator, raw: raw)
        
    }
    
    public init(translator: Translator) {
        self.noTranslator = NoTranslator(wrapping: translator)
    }
    
}

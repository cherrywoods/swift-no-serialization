//
//  NoTranslator.swift
//  SwiftNoSerialization
//
//  Created by cherrywoods on 16.12.17.
//

import Foundation
import MetaSerialization

/**
 This translator encodes/decodes to/from Metas.
 It wrappes another translator to wrap and unwrap swift objects,
 but will not perform any encoding or decoding process,
 it will jsut return the constructed Meta.
 
 Therefor you may use this translator to construct
 only the meta representation for an arbitrary other translator.
 */
public class NoTranslator: Translator {
    
    public let wrappedTranslator: Translator
    
    public init(wrapping translator: Translator) {
        
        self.wrappedTranslator = translator
        
    }
    
    // MARK: wrapingMeta and unwrap
    
    public func wrappingMeta<T>(for value: T) -> Meta? {
        
        return wrappedTranslator.wrappingMeta(for: value)
        
    }
    
    public func unwrap<T>(meta: Meta) throws -> T? {
        
        return try wrappedTranslator.unwrap(meta: meta)
        
    }
    
    // MARK: encode and decode
    
    public func encode<Raw>(_ meta: Meta) throws -> Raw {
        precondition(Raw.self == Meta.self, "Incorrect translation type")
        return meta as! Raw
    }
    
    public func decode<Raw>(_ raw: Raw) throws -> Meta {
        precondition(Raw.self == Meta.self, "Incorrect translation type")
        return raw as! Meta
    }
    
}

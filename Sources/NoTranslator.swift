//
//  NoTranslator.swift
//  SwiftNoSerialization
//
//  Created by cherrywoods on 16.12.17.
//

import Foundation
import MetaSerialization

/// This translator does nothing. It translates to and from Metas.
public class NoTranslator: Translator {
    
    public init() {}
    
    public func wrapingMeta<T>(for value: T) -> Meta? {
        
        if T.self == GenericNil.self {
            return NilMeta.nil
        }
        
        return SimpleGenericMeta<T>() as Meta?
        
    }
    
    public func unwrap<T>(meta: Meta) -> T {
        
        // meta will be initalized (get() will not return nil)
        // and the value should be of type T.
        return meta.get() as! T
        
    }
    
    public func encode<Raw>(_ meta: Meta) throws -> Raw {
        precondition(Raw.self == Meta.self, "Incorrect translation type")
        return meta as! Raw
    }
    
    public func decode<Raw>(_ raw: Raw) throws -> Meta {
        precondition(Raw.self == Meta.self, "Incorrect translation type")
        return raw as! Meta
    }
    
}

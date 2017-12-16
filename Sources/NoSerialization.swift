//
//  NoSerialization.swift
//  SwiftNoSerialization
//
//  Created by cherrywoods on 16.12.17.
//

import Foundation
import MetaSerialization

public class ToMetaSerialization: Serialization {
    
    public typealias Raw = Meta
    
    private let translator: Translator
    
    public func provideNewEncoder() -> MetaEncoder {
        
        return MetaEncoder(translator: translator)
        
    }
    
    public func provideNewDecoder(raw: Meta) -> MetaDecoder {
        
        return try! MetaDecoder(translator: translator, raw: raw)
        
    }
    
    public init(translator: Translator = NoTranslator()) {
        
        self.translator = translator
        
    }
    
}

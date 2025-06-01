//
//  DataGroup7.swift
//
//  Created by Andy Qua on 01/02/2021.
//

import Foundation

@available(iOS 13, macOS 10.15, *)
public class DataGroup7 : DataGroup {
    
    public private(set) var imageData : [UInt8] = []

    public override var datagroupType: DataGroupId { .DG7 }

    required init( _ data : [UInt8] ) throws {
        try super.init(data)
    }

    func getImageData() -> Data? {
        if imageData.count == 0 {
            return nil
        }

        return Data(imageData)
    }
    
    override func parse(_ data: [UInt8]) throws {
        var tag = try getNextTag()
        try verifyTag(tag, equals: 0x02)
        _ = try getNextValue()
        
        tag = try getNextTag()
        try verifyTag(tag, equals: 0x5F43)
        
        imageData = try getNextValue()
    }
}

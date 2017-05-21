//
//  NetworkReachability.swift
//  Network
//
//  Created by ShoIto on 2016/03/09.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import SystemConfiguration

struct NetworkReachability {
    
    static func isOnline() -> Bool {
        var zeroAddress = sockaddr_in()
        bzero(&zeroAddress, MemoryLayout.size(ofValue: sockaddr_in()))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let reachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { SCNetworkReachabilityCreateWithAddress(nil, $0) }
        }) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        
        if !SCNetworkReachabilityGetFlags(reachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let isNeedsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !isNeedsConnection)
    }
}

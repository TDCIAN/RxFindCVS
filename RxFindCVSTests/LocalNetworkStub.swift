//
//  LocalNetworkStub.swift
//  RxFindCVSTests
//
//  Created by JeongminKim on 2022/04/06.
//

import Foundation
import RxSwift
import Stubber

@testable import RxFindCVS

class LocalNetworkStub: LocalNetwork {
    override func getLocation(by mapPoint: MTMapPoint) -> Single<Result<LocationData, URLError>> {
        return Stubber.invoke(getLocation, args: mapPoint)
    }
}

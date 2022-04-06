//
//  RxFindCVSTests.swift
//  RxFindCVSTests
//
//  Created by JeongminKim on 2022/04/06.
//

import XCTest
import Nimble

@testable import RxFindCVS

class LocationInformationModelTests: XCTestCase {
    let stubNetwork = LocalNetworkStub()
    
    var doc: [KLDocument]!
    var model: LocationInformationModel!

    override func setUp() {
        self.model = LocationInformationModel(localNetwork: stubNetwork)
        self.doc = cvsList
    }
    
    func testDocumentsToCellData() {
        let cellData = model.documentsToCellData(doc) // 실제 모델의 값
        let placeName = doc.map { $0.placeName }
        let address0 = cellData[2].address
        let roadAddressName = doc[2].roadAddressName
        
        expect(cellData.map { $0.placeName }).to(
            equal(placeName),
            description: "DetailListCellData의 placeName은 document의 placeName이다."
        )
        
        expect(address0).to(
            equal(roadAddressName),
            description: "KLDocument의 RoadAddressName이 빈 값이 아닐 경우 roadAddress가 cellData에 전달된다."
        )
    }

}

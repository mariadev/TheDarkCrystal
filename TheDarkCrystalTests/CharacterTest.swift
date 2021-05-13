//
//  CharacterTest.swift
//  TheDarkCrystalTests
//
//  Created by Maria on 16/11/2020.
//

import XCTest
@testable import TheDarkCrystal

class CharacterTest: XCTestCase {
    
    var gelfings: Race!
    var podlings: Race!
    var deet: Character!
    var rian: Character!
    
    override func setUpWithError() throws {
        
        gelfings = Race(name: OF_RACE.gelfings,
                        description: DESCRIPTION_GELFLING )
        podlings = Race(name: OF_RACE.podlings,
                        description: DESCRIPTION_PODLINGS)
        _  = Race(name: OF_RACE.skeksis,
                            description: DESCRIPTION_SKEKSIS)
        _ = Race(name: OF_RACE.aughra,
                          description: DESCRIPTION_AUGHRA)
        _ = Race(name: OF_RACE.mystics,
                           description: DESCRIPTION_MYSTICS)

        rian = Character(name: RIAN_DATA.name,
                         race: gelfings,
                         image: UIImage(named: RIAN_DATA.image)!,
                         description: RIAN_DATA.description,
                         appearOn: RIAN_DATA.appearOn,
                         aphorism: RIAN_DATA.aphorism)

        deet = Character(name: DEET_DATA.name,
                         race: gelfings,
                         image: UIImage(named: DEET_DATA.image)!,
                         description: DEET_DATA.description,
                         appearOn: DEET_DATA.appearOn,
                         aphorism: DEET_DATA.aphorism)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCharacterExistence() {
        XCTAssertNotNil(rian)
    }
    
    func testCharacter() {
        XCTAssertEqual(rian, rian)
        
        let rian2 = Character(name: RIAN_DATA.name,
                              race: gelfings,
                              image: UIImage(named: RIAN_DATA.image)!,
                              description: RIAN_DATA.description,
                              appearOn: RIAN_DATA.appearOn,
                              aphorism: RIAN_DATA.aphorism)
        
        XCTAssertEqual(rian, rian2)
        
        XCTAssertNotEqual(rian, deet)
        
    }
    
}

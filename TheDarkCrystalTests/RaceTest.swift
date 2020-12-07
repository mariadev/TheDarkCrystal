//
//  RaceTest.swift
//  TheDarkCrystalTests
//
//  Created by Maria on 16/11/2020.
//

import XCTest
@testable import TheDarkCrystal

class RaceTest: XCTestCase {
    
    var gelfings: Race!
    var podlings: Race!
    var deet: Character!
    var rian: Character!
    
    override func setUpWithError() throws {
        gelfings = Race(name: OF_RACE.gelfings,
                        description: DESCRIPTION_GELFLING )
        podlings = Race(name: OF_RACE.podlings,
                        description: DESCRIPTION_PODLINGS)
        let skeksis  = Race(name: OF_RACE.skeksis,
                            description: DESCRIPTION_SKEKSIS)
        let aughra = Race(name: OF_RACE.aughra,
                          description: DESCRIPTION_AUGHRA)
        let mystics = Race(name: OF_RACE.mystics,
                           description: DESCRIPTION_MYSTICS)
        
        
        rian = Character(name: RIAN_DATA.name,
                         race: gelfings,
                         image: UIImage(named:RIAN_DATA.image)!,
                         description: RIAN_DATA.description,
                         appearOn: RIAN_DATA.appearOn,
                         aphorism: RIAN_DATA.aphorism)
        
        let motherAughra = Character(name: AUGHRA_DATA.name,
                                     race: aughra,
                                     image: UIImage(named: AUGHRA_DATA.image)!,
                                     description: AUGHRA_DATA.description,
                                     appearOn: AUGHRA_DATA.appearOn,
                                     aphorism: AUGHRA_DATA.aphorism)
        
        let skekso = Character(name: SKEKSO_DATA.name,
                               race: skeksis,
                               image: UIImage(named: SKEKSO_DATA.image)!,
                               description: SKEKSO_DATA.description,
                               appearOn: SKEKSO_DATA.appearOn,
                               aphorism: SKEKSO_DATA.aphorism)
        
        let hop = Character(name: HOP_DATA.name,
                            race: podlings,
                            image: UIImage(named: HOP_DATA.image)!,
                            description: HOP_DATA.description,
                            appearOn: HOP_DATA.appearOn,
                            aphorism: HOP_DATA.aphorism)
        
        let urgoh = Character(name: URGOH_DATA.name,
                              race: mystics,
                              image: UIImage(named: URGOH_DATA.image)!,
                              description: URGOH_DATA.description,
                              appearOn: URGOH_DATA.appearOn,
                              aphorism: URGOH_DATA.aphorism)
        
        deet = Character(name: DEET_DATA.name,
                         race: gelfings,
                         image: UIImage(named: DEET_DATA.image)!,
                         description: DEET_DATA.description,
                         appearOn: DEET_DATA.appearOn,
                         aphorism: DEET_DATA.aphorism)
        
        
        //        let arrayCharacters = [rian, motherAughra, skekso, urgoh, hop, deet]
        
        //        gelfings.add(character: deet)
        //        gelfings.add(character: rian)
        aughra.add(character: motherAughra)
        skeksis.add(character: skekso)
        mystics.add(character: urgoh)
        podlings.add(character: hop)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRaceExistence() {
        XCTAssertNotNil(gelfings)
    }
    
    func testraceAddMembers() {
        
        XCTAssertEqual(gelfings._characters.count, 0)
        gelfings.add(character: deet)
        XCTAssertEqual(gelfings._characters.count, 1)
        gelfings.add(character: deet)
        XCTAssertEqual(gelfings._characters.count, 1)
        gelfings.add(character: rian)
        XCTAssertEqual(gelfings._characters.count, 2)
        
    }
    
    func testRaceAddChracterAtOnce() {
        gelfings.add(characters: rian, deet)
        XCTAssertEqual(gelfings._characters.count, 2)
    }
    
    func testRaceEquality() {
        
        XCTAssertEqual(gelfings, gelfings)
        
        XCTAssertNotEqual( gelfings, podlings)
        
    }
    
}

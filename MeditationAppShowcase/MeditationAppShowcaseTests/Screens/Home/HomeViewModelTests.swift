import XCTest
@testable import MeditationAppShowcase

class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    var greetingSpy: String?
    var backgroundRipImageSpy: UIImage?
    var ripImageSpy: UIImage?
    var relaxationPercentageSpy: String?
    var stressSpy: String?
    var mediateSpy: String?
    var focusSpy: String?

    override func setUp() {
        super.setUp()
        sut = HomeViewModel()
        sut.greeting = { [weak self] in self?.greetingSpy = $0 }
        sut.backgroundRipImage = { [weak self] in self?.backgroundRipImageSpy = $0 }
        sut.ripImage = { [weak self] in self?.ripImageSpy = $0 }
        sut.relaxationPercentage = { [weak self] in self?.relaxationPercentageSpy = $0 }
        sut.stress = { [weak self] in self?.stressSpy = $0 }
        sut.meditate = { [weak self] in self?.mediateSpy = $0 }
        sut.focus = { [weak self] in self?.focusSpy = $0 }
        sut.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGreeting() {
        XCTAssert(greetingSpy == "Hello Ela!")
    }

    func testBackgroundRipImage() {
        XCTAssert(backgroundRipImageSpy == UIImage(named: "rip_background"))
    }

    func testRipImage() {
        XCTAssert(ripImageSpy == UIImage(named: "rip"))
    }

    func testRelaxationPercentage() {
        XCTAssert(relaxationPercentageSpy == "15%")
    }

    func testStress() {
        XCTAssert(stressSpy == "89%")
    }

    func testMeditate() {
        XCTAssert(mediateSpy == "5 min")
    }

    func testFocus() {
        XCTAssert(focusSpy == "25%")
    }

}

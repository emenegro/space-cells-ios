
import XCTest

class CollectionableTests: XCTestCase {
    
    func test_Given_EmptyItems_Then_ZeroSectionsReturned() {
        
        let emptyCollectionable = mockAnyCollectionable(empty: true)
        
        XCTAssertEqual(emptyCollectionable.numberOfSections(), 0)
    }
    
    func test_Given_EmptyItems_And_QueryingForRows_Then_ZeroRowsReturned() {
        
        let emptyCollectionable = mockAnyCollectionable(empty: true)
        
        XCTAssertEqual(emptyCollectionable.numberOfRows(inSection: 0), 0)
    }
    
    func test_Given_EmptyItems_And_QueryingForViewModel_Then_NilReturned() {
        
        let emptyCollectionable = mockAnyCollectionable(empty: true)
        
        XCTAssertNil(emptyCollectionable.viewModelForRowAtIndexPath(indexPath: IndexPath(row: 0, section: 0)))
    }
    
    func test_Given_Items_Then_TwoSectionsReturned() {
        
        let filledCollectionable = mockAnyCollectionable(empty: false)
        
        XCTAssertEqual(filledCollectionable.numberOfSections(), 2)
    }
    
    func test_Given_Items_And_QueryingForRows_Then_ThreeRowsReturned() {
        
        let filledCollectionable = mockAnyCollectionable(empty: false)
        
        XCTAssertEqual(filledCollectionable.numberOfRows(inSection: 0), 3)
    }
    
    func test_Given_Items_And_QueryingForViewModel_Then_CorrectViewModelReturned() {
        
        let filledCollectionable = mockAnyCollectionable(empty: false)
        
        let viewModel: MockCollectionableViewModel? = filledCollectionable.viewModelForRowAtIndexPath(indexPath: IndexPath(row: 2, section: 1))
        
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel?.text, "1.2")
    }
    
    func test_When_RowSelected_Then_CorrectViewModelReturned() {
        
        let filledCollectionable = mockAnyCollectionable(empty: false)
        let indexPath = IndexPath(row: 2, section: 1)
        
        filledCollectionable.rowSelectedAtIndexPath(indexPath: indexPath)
        
        let viewModel: MockCollectionableViewModel? = filledCollectionable.viewModelForRowAtIndexPath(indexPath: indexPath)
        XCTAssertTrue(viewModel!.onRowSelectedCalled)
    }
}

extension CollectionableTests {
    
    func mockAnyCollectionable(empty: Bool) -> AnyCollectionable<MockCollectionableViewModel> {
        let collectionable = MockCollectionable(empty: empty)
        return AnyCollectionable(collectionable)
    }
}

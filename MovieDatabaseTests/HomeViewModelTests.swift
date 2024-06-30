//
//  MovieDatabaseTests.swift
//  MovieDatabaseTests
//
//  Created by Sourav on 30/06/24.
//

import XCTest
@testable import MovieDatabase


final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockDataFetcher: MockDataFetcher!
       
       override func setUp() {
           super.setUp()
           mockDataFetcher = MockDataFetcher()
           viewModel = HomeViewModel()
           viewModel.dataFetcher = mockDataFetcher
       }
       
       override func tearDown() {
           viewModel = nil
           mockDataFetcher = nil
           super.tearDown()
       }
       
       func testGetData() {
           viewModel.getData()
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.categories.count, 5)
               XCTAssertEqual(self.viewModel.movies.count, 3)
           }
       }
       
       func testSearchResultsWhenEmpty() {
           viewModel.getData()
           viewModel.searchText = ""
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.searchResults.count, 3)
           }
       }
       
       func testSearchResultsWhenNotEmpty() {
           viewModel.getData()
           viewModel.searchText = "Movie 1"
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.searchResults.count, 1)
               XCTAssertEqual(self.viewModel.searchResults.first?.title, "Movie 1")
           }
       }
       
       func testSearchResultsByGenre() {
           viewModel.getData()
           viewModel.searchText = "Drama"
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.searchResults.count, 1)
               XCTAssertEqual(self.viewModel.searchResults.first?.genre, "Drama")
           }
       }
       
       func testSearchResultsByYear() {
           viewModel.getData()
           viewModel.searchText = "2021"
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.searchResults.count, 1)
               XCTAssertEqual(self.viewModel.searchResults.first?.year, "2021")
           }
       }
       
       func testSearchResultsByActor() {
           viewModel.getData()
           viewModel.searchText = "Actor 1"
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.searchResults.count, 1)
               XCTAssertEqual(self.viewModel.searchResults.first?.actors, "Actor 1")
           }
       }
       
       func testSearchResultsByDirector() {
           viewModel.getData()
           viewModel.searchText = "Director 2"
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.searchResults.count, 1)
               XCTAssertEqual(self.viewModel.searchResults.first?.director, "Director 2")
           }
       }
    
    func testSearchResultsNotAvailable() {
           viewModel.getData()
           viewModel.searchText = "NonExistentMovie"
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               XCTAssertEqual(self.viewModel.searchResults.count, 0)
           }
       }
   }

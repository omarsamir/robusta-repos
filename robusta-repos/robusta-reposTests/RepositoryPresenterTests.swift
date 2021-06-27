//
//  RepositoryPresenterTests.swift
//  robusta-reposTests
//
//  Created by omar on 26/06/2021.
//

import XCTest
@testable import robusta_repos

class RepositoryPresenterTests: XCTestCase {

    private var sut: RepositoryPresenter!
    private var view = MockRepositoryViewControllerDelegate()
    override func setUpWithError() throws {
        sut = RepositoryPresenter(view: view)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        MockRepositoryViewControllerDelegate.reloadRepositoriesTableViewCallCount = 0
        MockRepositoryViewControllerDelegate.presentErrorCallCount = 0
        MockRepositoryViewControllerDelegate.startLoadingCallCount = 0
        MockRepositoryViewControllerDelegate.finishLoadingCallCount = 0
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRepositoryPresenter_WhenInitPresenter_reloadRepositoriesTableViewShouldCalledOnce(){
        //When
        ////// Initilization implemened in setUpWithError
        
        //Then
        XCTAssertEqual(MockRepositoryViewControllerDelegate.reloadRepositoriesTableViewCallCount, 1)
    }
    
    func testRepositoryPresenter_WhenInitPresenter_presentErrorShouldNotCalled(){
        //When
        ////// Initilization implemened in setUpWithError
        
        //Then
        XCTAssertEqual(MockRepositoryViewControllerDelegate.reloadRepositoriesTableViewCallCount, 0)
    }

    func testRepositoryPresenter_WhenInitPresenter_startLoadingShouldCalledOnce(){
        //When
        ////// Initilization implemened in setUpWithError
        
        //Then
        XCTAssertEqual(MockRepositoryViewControllerDelegate.startLoadingCallCount, 1)
    }

    func testRepositoryPresenter_WhenInitPresenter_finishLoadingShouldNotCalledOnce(){
        //When
        ////// Initilization implemened in setUpWithError
        
        //Then
        XCTAssertEqual(MockRepositoryViewControllerDelegate.finishLoadingCallCount, 1)
    }


}

class MockRepositoryViewControllerDelegate: RepositoryViewControllerDelegate {
    static var reloadRepositoriesTableViewCallCount = 0
    static var presentErrorCallCount = 0
    static var startLoadingCallCount = 0
    static var finishLoadingCallCount = 0
    
    func reloadRepositoriesTableView(repos: [Repository]?) {
        MockRepositoryViewControllerDelegate.reloadRepositoriesTableViewCallCount+=1
    }
    
    func presentError() {
        MockRepositoryViewControllerDelegate.presentErrorCallCount+=1
    }
    
    func startLoading() {
        MockRepositoryViewControllerDelegate.startLoadingCallCount+=1
    }
    
    func finishLoading() {
        MockRepositoryViewControllerDelegate.finishLoadingCallCount+=1
    }
    
    
}



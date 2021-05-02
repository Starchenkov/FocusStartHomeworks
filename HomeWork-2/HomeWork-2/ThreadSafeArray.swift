//
//  ThreadSafeArray.swift
//  HomeTask-2
//
//  Created by Sergey Starchenkov on 22.04.2021.
//
import Foundation

class ThreadSafeArray<T>
{
    private var array = [T]()
    
    private let isolationQueue = DispatchQueue(label: "safeArrayQueue",
                                               attributes: .concurrent)
    var count: Int {
        isolationQueue.sync {
            return self.array.count
        }
    }
    
    var isEmpty: Bool {
        isolationQueue.sync {
            return self.array.isEmpty
        }
    }
    
    func append(_ item: T) {
        isolationQueue.async(flags: .barrier) { [weak self] in
            self?.array.append(item)
            print("Добавлен элемент \(item)")
        }
    }
    
    func remove(at index: Int){
        isolationQueue.async(flags: .barrier) { [weak self] in
            self?.array.remove(at: index)
        }
    }
    
    subscript(index: Int) -> T {
        isolationQueue.sync {
            return self.array[index]
        }
    }
}

extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        isolationQueue.sync {
            return (self.array.firstIndex(of: element) != nil) ? true : false
        }
    }
}

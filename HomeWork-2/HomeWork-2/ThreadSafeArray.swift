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
    private var count: Int = 0
    
    var isEmpty: Bool {
        self.isolationQueue.sync {
            return self.array.isEmpty
        }
    }
    
    func showCount() -> Int {
        self.isolationQueue.sync {
            return count
        }
    }
    
    func append(_ item: T) {
        self.isolationQueue.async(flags: .barrier) {
            self.array.append(item)
            print("Добавлен элемент \(item)")
            self.count += 1
        }
    }
    
    func remove(at index: Int){
        self.isolationQueue.async(flags: .barrier) {
            self.array.remove(at: index)
        }
    }
    
    func `subscript`(index: Int) -> T {
        self.isolationQueue.sync {
            return self.array[index]
        }
    }
}

extension ThreadSafeArray where T: Equatable {
    func contains(_ element: T) -> Bool {
        let result = (self.array.firstIndex(of: element) != nil) ? true : false
        return result
    }
}

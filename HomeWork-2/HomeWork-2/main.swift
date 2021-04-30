//
//  main.swift
//  HomeTask-2
//
//  Created by Sergey Starchenkov on 22.04.2021.
//
import Foundation

var threadSafeArray = ThreadSafeArray<String>()

let userQueue = DispatchQueue(label: "userQueue",
                              attributes: .concurrent)

print("Добавляем две задачи асинхронно в одну параллельную очередь")
let groupQueue = DispatchGroup.init()

userQueue.async(group: groupQueue) {
    for i in 0...1000 {
        threadSafeArray.append("AAA \(i)")
    }
}

userQueue.async(group: groupQueue) {
    for i in 0...1000 {
        threadSafeArray.append("BBB \(i)")
    }
}

groupQueue.notify(queue: .main) {
    print("Массив пустой? \(threadSafeArray.isEmpty)")
    print("Количество добавленных элементов: \(threadSafeArray.count)")
    print("Массив содержит элемент 'CCC 100' - \(threadSafeArray.contains("CCC 100"))")
    exit(EXIT_SUCCESS)
}

dispatchMain()

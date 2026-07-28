/**
 * File: PrintUtil.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

import java.util.*

class Trunk(var prev: Trunk?, var str: String)

/* In ma trận (Array) */
fun <T> printMatrix(matrix: Array<Array<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* In ma trận (List) */
fun <T> printMatrix(matrix: MutableList<MutableList<T>>) {
    println("[")
    for (row in matrix) {
        println("  $row,")
    }
    println("]")
}

/* In danh sách liên kết */
fun printLinkedList(h: ListNode?) {
    var head = h
    val list = mutableListOf<String>()
    while (head != null) {
        list.add(head._val.toString())
        head = head.next
    }
    println(list.joinToString(separator = " -> "))
}

/* In cây nhị phân */
fun printTree(root: TreeNode?) {
    printTree(root, null, false)
}

/**
 * In cây nhị phân
 * Bộ in cây này được mượn từ TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
fun printTree(root: TreeNode?, prev: Trunk?, isRight: Boolean) {
    if (root == null) {
        return
    }

    var prevStr = "    "
    val trunk = Trunk(prev, prevStr)

    printTree(root.right, trunk, true)

    if (prev == null) {
        trunk.str = "———"
    } else if (isRight) {
        trunk.str = "/———"
        prevStr = "   |"
    } else {
        trunk.str = "\\———"
        prev.str = prevStr
    }

    showTrunks(trunk)
    println(" ${root._val}")

    if (prev != null) {
        prev.str = prevStr
    }
    trunk.str = "   |"

    printTree(root.left, trunk, false)
}

fun showTrunks(p: Trunk?) {
    if (p == null) {
        return
    }
    showTrunks(p.prev)
    print(p.str)
}

/* In bảng băm */
fun <K, V> printHashMap(map: Map<K, V>) {
    for ((key, value) in map) {
        println("${key.toString()} -> $value")
    }
}

/* In đống (heap) */
fun printHeap(queue: Queue<Int>?) {
    val list = mutableListOf<Int?>()
    queue?.let { list.addAll(it) }
    print("Heap array representation:")
    println(list)
    println("Heap tree representation:")
    val root = TreeNode.listToTree(list)
    printTree(root)
}
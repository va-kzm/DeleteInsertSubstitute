# This is a test task

Write an application that accepts two strings on the input and outputs the minimal list of operations that have to be applied to the first string in order to convert it into the second.

The available operations are: 
  - Delete => designated with the symbol "d"
  - Insert => designated with the symbol "i"
  - Substitute => designated with the symbol "s"

The result => a list of operations of type String, where one character corresponds to the symbol of one operation.

Example 1:
String 1: "abc"  
String 2: "def"  
Result: "sss"  
Explanation: Since all letters are different, you need to make 3 substitutions to convert String 1 to String 2.

Example 2:
String 1: "sitting"  
String 2: "kitten"  
Result: "ssd"  
Explanation: It is necessary to make a replacement ("s") of the 1st and 5th characters and delete ("d") the last one.

Example 3:
String 1: "Sunday"  
String 2: "Saturday"  
Result: "iis"  
Explanation: First, we need to insert ("i") the characters "a" and "t" after the "S" symbol. Then we should replace ("s") the symbol "n" with "r".

// Different data types
let myString:String = "Hello"
print(myString)
let myInteger:Int = 3
print(myInteger)
let myFloat:Float = 4.2
print(myFloat)
let myBoolean:Bool = false
print(myBoolean)

// String concatination
let stringA:String = "hello"
let stringB:String = "world"
let integerA:Int = 4
let finalString:String = stringA + " " + stringB
let finalString2:String = stringA + " " + String(integerA)
print(finalString)
print(finalString2)

// Math
let integer1:Int = 34
let integer2:Int = 74
let integer3:Int = 51
let float1:Float = 5.7
let float2:Float = 91.8
let float3:Float = 38.6
let addition:Float = Float(integer1) + float1
let subtraction:Float = Float(integer3) - float3
let multiplacation:Float = float2 * float3
let division:Float = Float(integer1) / Float(integer2)
print("\(integer1) + \(float1) = \(addition)")
print("\(integer3) - \(float3) = \(subtraction)")
print("\(float2) x \(float3) = \(multiplacation)")
print("\(integer1) / \(integer2) = \(division)")

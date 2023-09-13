/*:
 # 01: Text Art
 
 @Drew Brown
 9/12/23
 
 ---
 
 
 **Assignment**
 + create playground that produces text art
 + demonstrate use of variables, for-loops, and functions
 + store the playground in your classwork repo and update
 
 **My Project**
 + uses 2D arrays of pixels to create text images
 + `emojiDict` is a dictionary used to translate the text to images
 + pixels have 4 options: `dk` `md` `lt` or `sp`
 + `renderPic` runs through the array and prints line by line
 */

var emojiDict: [String: String] = ["dk":"▓▓", "md":"▒▒", "lt":"░░", "sp":"  "]

var smiley: [[String]] = [
    ["sp","lt","lt","lt","lt","lt","lt","lt","sp"],
    ["lt","lt","lt","lt","lt","lt","lt","lt","lt"],
    ["lt","lt","dk","lt","lt","lt","dk","lt","lt"],
    ["lt","lt","dk","lt","lt","lt","dk","lt","lt"],
    ["lt","lt","lt","lt","lt","lt","lt","lt","lt"],
    ["lt","lt","lt","lt","lt","lt","lt","lt","lt"],
    ["lt","lt","dk","lt","lt","lt","dk","lt","lt"],
    ["lt","lt","lt","dk","dk","dk","lt","lt","lt"],
    ["sp","lt","lt","lt","lt","lt","lt","lt","sp"],
]

var pattern: [[String]] = [
    ["dk","md","lt","dk","lt","md","dk"],
    ["lt","dk","md","lt","md","dk","lt"],
    ["dk","md","lt","dk","lt","md","dk"],
    ["lt","dk","md","lt","md","dk","lt"],
    ["dk","md","lt","dk","lt","md","dk"],
    ["lt","dk","md","lt","md","dk","lt"],
    ["dk","md","lt","dk","lt","md","dk"],
]

func renderPic(picture: [[String]]) {
    for row in picture {
        var curRow = ""
        for cell in row{
            if let pix = emojiDict[cell]{
                curRow += pix
            } else {
                print("ERROR")
            }
        }
        print(curRow)
    }
}

print("Smiley Face!\nConsists of \(smiley.count * smiley[0].count) cells")
renderPic(picture: smiley)
print("\n\nFun Pattern!\nConsists of \(pattern.count * pattern[0].count) cells")
renderPic(picture: pattern)





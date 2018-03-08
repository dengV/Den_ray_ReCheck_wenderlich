//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func highlightMatches(pattern: String, inString string: String) -> NSAttributedString{
    
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    
    let range = NSRange(location: 0, length: string.count)
    
    let matches = regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range) as! [NSTextCheckingResult]
    
    
    let attributedText = NSMutableAttributedString(string: string)
    
    for match in matches{
        attributedText.addAttributes([NSAttributedStringKey.backgroundColor: UIColor.yellow], range: match.range)
        
    }
    return attributedText
}


func listMatches(pattern: String, inString string: String) -> [String]{
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    
    let range = NSRange(location: 0, length: string.count)
    
    let matches = regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range) as! [NSTextCheckingResult]
    
    return matches.map{
        let range = $0.range
        return (string as NSString).substring(with: range)
    }
    
}


func listGroups(pattern: String, inString string: String) -> [String]{
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    let range = NSRange(location: 0, length: string.count)
    let matches = regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range) as! [NSTextCheckingResult]
    
    var groupMatches = [String]()
    
    for match in matches{
        let rangeCount = match.numberOfRanges
        for group in 0..<rangeCount{
            groupMatches.append((string as NSString ).substring(with: match.range(at: group)))
            
            
        }
    }
    return groupMatches
}



func containsMatch(pattern: String, inString string: String) -> Bool{
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    let range = NSRange(location: 0, length: string.count)
    //return regex.firstMatchInString(s)
    return regex.firstMatch(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range) != nil
    
}


func replaceMatches(pattern: String, inString string: String, withString replacementString: String ) -> String?{
    
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    
    let range = NSRange(location: 0, length: string.count)
    
    
    return regex.stringByReplacingMatches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range, withTemplate: replacementString)
}


let quickFox = "The quick brown fox jumps over the lazy dog."


listMatches(pattern: "jump", inString: quickFox)


//:   ?       This next example uses some special characters that are available in regular expressions. The parenthesis create a group, and the question mark says "match the previous element (the group in this case) 0 or 1 times". It matches either 'jump' or 'jumps':


listMatches(pattern: "jump(s)?", inString: quickFox)



//: This one matches an HTML or XML tag:

let htmlString = "<p>This is an example <strong>html</strong> string.</p>"



listMatches(pattern: "<([a-z][a-z0-9]*)\\b[^>]*>(.*?)", inString: htmlString)



//: Wow, looks complicated, eh? :] Hopefully things will become a bit more clear as you look through the rest of the examples here!

//: ## Cheat Sheet
//:
//: **.** matches any character. `p.p` matches pop, pup, pmp, p@p, and so on.


let anyExample = "pip, pop, p%p, paap, piip, puup, pippin, pp"

listMatches(pattern: "p.p", inString: anyExample)



//:  **\w** matches any 'word-like' character which includes the set of numbers, letters, and underscore, but does not match punctuation or other symbols. `hello\w` will match "hello_9" and "helloo" but not "hello!"


let wordExample = "hello helloooooo hello_1114 hello, hello!"

listMatches(pattern: "hello\\w+" , inString: wordExample)


//: **\d** matches a numeric digit, which in most cases means `[0-9]`. `\d\d?:\d\d` will match strings in time format, such as "9:30" and "12:45".


let digitExample = "9:30 12:45 df:24 ag:gh"

listMatches(pattern: "\\d?\\d:\\d\\d", inString: digitExample)


//: **\b** matches word boundary characters such as spaces and punctuation. `to\b` will match the "to" in "to the moon" and "to!", but it will not match "tomorrow". `\b` is handy for "whole word" type matching.


let boundaryExample = "to the moon! when to go? tomorrow?"

listMatches(pattern: "to\\b", inString: boundaryExample)



//: **\s** matches whitespace characters such as spaces, tabs, and newlines. `hello\s` will match "hello " in "Well, hello there!".

let whitespaceExample = "Well, hello there!"

listMatches(pattern: "hello\\s", inString: whitespaceExample)



//: **^** matches at the beginning of a line. Note that this particular ^ is different from ^ inside of the square brackets! For example, `^Hello` will match against the string "Hello there", but not "He said Hello".

let beginningExample = "Hello there! He said hello."

highlightMatches(pattern: "^hello", inString: beginningExample)



//: **$** matches at the end of a line. For example, `the end$` will match against "It was the end" but not "the end was near"


let endExample = "The end was near. It was the end"

highlightMatches(pattern: "end$", inString: endExample)



//: **\*** matches the previous element 0 or more times. `12*3` will match 13, 123, 1223, 122223, and 1222222223.



let zeroOrMoreExample = "13, 123, 1223, 122223, 1222222223, 143222343"

highlightMatches(pattern: "12*3", inString: zeroOrMoreExample)

//: **+** matches the previous element 1 or more times. `12+3` will match 123, 1223, 122223, 1222222223, but not 13.

let oneOrMoreExample = "13, 123, 1223, 122223, 1222222223, 143222343"

highlightMatches(pattern: "12+3", inString: oneOrMoreExample)


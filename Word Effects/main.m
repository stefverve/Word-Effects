//
//  main.m
//  Word Effects
//
//  Created by Stefan Verveniotis on 2016-10-31.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    char choice;
    char inputChars[255];
    
    NSLog(@"\n\nPlease input a string:");
    
    NSString *inputNSString = [NSString stringWithUTF8String:fgets(inputChars, 255, stdin)];
    
    while (choice != '7'){
    
        NSLog(@"\n\nWhich operation would you like?\n1. Uppercase\n2. Lowercase\n3. Numberize\n4. Canadianize\n5. Respond\n6. De-Space-It\n7. Get out of here!");
        
        fgets(&choice, 255, stdin);
        
        switch(choice) {
            case '1':                     // Uppercase
                NSLog(@"%@", inputNSString.uppercaseString);
                break;
            case '2':                     // Lowercase
                NSLog(@"%@", inputNSString.lowercaseString);
                break;
            case '3':                     // Numberize
                if (inputNSString.integerValue != 0 || [inputNSString isEqual: @"0"]) {
                    NSLog(@"%ld", (long)inputNSString.integerValue);
                } else {
                    NSLog(@"\nNot an integer.");
                }
                break;
            case '4':                     // Canadianize
                NSLog(@"%@, eh.", [inputNSString substringToIndex:inputNSString.length-1]);
                break;
            case '5':                     // Respond
                switch([inputNSString characterAtIndex:inputNSString.length-2]) {
                    case 33:                // UTF-16 ascii for "!"
                        NSLog(@"\nWoah, calm down!");
                        break;
                    case 63:                // UTF-16 ascii for "?"
                        NSLog(@"\nI don't know!");
                        break;
                }
                break;
            case '6':                     // De-Space-It
                NSLog(@"%@", [inputNSString stringByReplacingOccurrencesOfString:(@" ") withString:(@"-")]);
                break;
            case '7':                     // Break without message
                break;
            default:
                NSLog(@"\nNot a valid choice");
        }
        
    }
    
    
    return 0;
}

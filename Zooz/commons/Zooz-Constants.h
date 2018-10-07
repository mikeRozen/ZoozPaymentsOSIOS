//
//  Zooz-Constants.h
//  Zooz
//
//  Created by Michael Rozenblat on 22/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#ifndef Zooz_Constants_h
#define Zooz_Constants_h

static inline BOOL isEmpty(id thing){
    return thing == nil || (thing == [NSNull null])
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}


#endif /* Zooz_Constants_h */

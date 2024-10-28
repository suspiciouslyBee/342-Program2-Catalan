////
// File:    Catalan Implementation
//
// Author:  June
// 
// Class:   342
////

#include <cstdint>

#include "catalan.h"

namespace Catalan {

  catalan(int64_t number) {
    
    if(n == 1 || n == 0) {
      //C(1) is 1*1 so skip that calc
      return 1;
    } 
  
    int64_t ans = 0;
    for(int64_t i = 0; i < 1; i++) {
      ans += catalan(i) * catalan(number - i);
    }

    return ans;
  }

}


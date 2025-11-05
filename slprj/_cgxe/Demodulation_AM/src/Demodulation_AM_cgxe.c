/* Include files */

#include "Demodulation_AM_cgxe.h"
#include "m_r3psW9MFbcAMCVOt28VyAG.h"

unsigned int cgxe_Demodulation_AM_method_dispatcher(SimStruct* S, int_T method,
  void* data)
{
  if (ssGetChecksum0(S) == 3118640408 &&
      ssGetChecksum1(S) == 4100648222 &&
      ssGetChecksum2(S) == 819571437 &&
      ssGetChecksum3(S) == 3215332530) {
    method_dispatcher_r3psW9MFbcAMCVOt28VyAG(S, method, data);
    return 1;
  }

  return 0;
}

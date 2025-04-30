#!/usr/bin/env python

if __name__=="__main__":
  import numpy as np
  
  img = np.random.randn(100,100)
  print(f"Mean of the random image, {np.mean(img)}")

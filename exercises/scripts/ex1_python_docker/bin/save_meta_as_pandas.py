import os
import pandas as pd
from skimage.io import imread
import numpy as np
import re

def list_of_str(arg):
    l = [str(f) for f in arg.split(",")]
    char_to_remove = [" ","[", "]"]
    for c in char_to_remove:
        l = [x.replace(c, "") for x in l]
    return l

def save_meta(tp, channels, file_paths):
    
    a, b = [ imread(file_paths[0]), imread(file_paths[1]) ]
    
    chs = []
    for f in file_paths:
        fname = os.path.basename(f)
        for c in channels:
            if c in fname:
                chs.append(c)
    
    df = pd.DataFrame(
            {
            "tp" : int(re.findall(r"\d{4}", tp)[0]),
            "channel" : chs,
            "file_name" : file_paths,
            "shape0" : [a.shape[0], b.shape[0]],
            "shape1" : [a.shape[1], b.shape[1]],
            "shape2" : [a.shape[2], b.shape[2]],
            "mean" : [np.mean(a), np.mean(b)]
        }
    )

    df.to_csv(f"meta_{tp}.csv", index=None)
    
    return    

if __name__=="__main__":

    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--tp",
                        type=str)
    parser.add_argument("--file_paths",
                        type=list_of_str)
    parser.add_argument("--channels",
                        type=list_of_str)

    args = parser.parse_args()

    tp = args.tp
    file_paths = args.file_paths
    channels = args.channels
    # print(file_paths)

    save_meta(tp, channels, file_paths)


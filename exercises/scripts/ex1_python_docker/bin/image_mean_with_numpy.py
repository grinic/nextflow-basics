import os
from skimage.io import imread
import numpy as np

def list_of_str(arg):
    l = [str(f) for f in arg.split(",")]
    char_to_remove = [" ","[", "]"]
    for c in char_to_remove:
        l = [x.replace(c, "") for x in l]
    return l

def compute_image_mean(file_path):
    
    file_name = os.path.basename(file_path)
    img = imread(file_path)
    img_mean = np.mean(img)
    print(f"Mean of {file_name}: {img_mean}" )
    
    return file_name, img_mean

if __name__=="__main__":
    
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--file_paths",
                        type=list_of_str)

    args = parser.parse_args()

    file_paths = args.file_paths
    # print(file_paths)

    for file_path in file_paths:
        file_name, img_mean = compute_image_mean(file_path)

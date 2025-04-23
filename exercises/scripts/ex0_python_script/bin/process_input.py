import tqdm
import os, glob


def create_file_id(file_path):
    # print(file_paths)
    
    _file = os.path.basename(file_path)
    filename, _ = os.path.splitext(_file)
    
    open(filename+".txt", "a").close()
    

if __name__=="__main__":
    
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--file_path")

    args = parser.parse_args()

    file_path = args.file_path

    create_file_id(file_path)

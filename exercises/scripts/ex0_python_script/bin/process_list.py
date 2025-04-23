import tqdm
import os, glob

def list_of_str(arg):
    arg = arg[1:-1]
    l = [str(f) for f in arg.split(",")]
    # print("---",l)
    return l


def create_file_id(file_path):
    # print(file_paths)
    
    # print(file_path)
    
    for file_path in file_paths:
    
        _file = os.path.basename(file_path)
        filename, _ = os.path.splitext(_file)
        
        open(filename+".txt", "a").close()
    
    return
    

if __name__=="__main__":
    
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--file_paths",
                        type=list_of_str)

    args = parser.parse_args()

    file_paths = args.file_paths
    # print(file_paths)

    create_file_id(file_paths)

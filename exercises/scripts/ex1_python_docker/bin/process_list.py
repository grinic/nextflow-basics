import os



def list_of_str(arg):
    l = [str(f) for f in arg.split(",")]
    char_to_remove = [" ","[", "]"]
    for c in char_to_remove:
        l = [x.replace(c, "") for x in l]
    return l


def create_file_id(file_path):
    
    for file_path in file_paths:
        
        print(file_path)
    
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

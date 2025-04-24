import pandas as pd

def list_of_str(arg):
    l = [str(f) for f in arg.split(",")]
    char_to_remove = [" ","[", "]"]
    for c in char_to_remove:
        l = [x.replace(c, "") for x in l]
    return l

def combine_meta(file_names):
    
    df = pd.DataFrame({})
    
    for f in file_names:
        df1 = pd.read_csv(f, index_col=False)
        df = pd.concat([df, df1], sort=False)
        
    df = df.sort_values(by=["tp","channel"])
    df = df.reset_index(drop=True)
        
    df.to_csv(f"meta_all.csv")
    
    return    

if __name__=="__main__":

    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--file_paths",
                        type=list_of_str)

    args = parser.parse_args()

    file_paths = args.file_paths
    # print(file_paths)

    combine_meta(file_paths)


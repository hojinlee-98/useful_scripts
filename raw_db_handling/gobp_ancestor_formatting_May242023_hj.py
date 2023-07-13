import json
import glob
file_list = glob.glob("/Volumes/hjdrive/db/gobp/go_ancestor/msigdb_ancestor_json/*.json")
msigdb_hash = dict
msigdb_lines = []
for afile in file_list : 
    with open(afile, 'r') as f:
        json_data = json.load(f)
    results = json_data["results"]
    key = results[0]["id"] # string
    val = results[0].get("ancestors", "start term") # string or list
    # get method is for keyerror with ancestors.
    # if there is no key, called descendants, keyerror is returned
    # and the reason why the key is missed is most likely that the term is positioned in end of tree. 
    if not isinstance(val, list) :
        val_temp = []
        val_temp = val
        val = []
        val.append(val_temp)
    val.insert(0, key)
    msigdb_aline = "\t".join(val) # make a line for msigdb ancestors
    msigdb_aline = msigdb_aline + "\n"
    msigdb_lines.append(msigdb_aline) # append aline to msigdb list

    
with open("/Volumes/hjdrive/db/gobp/go_ancestor/20230524_msigdb_ancestor_goid_hj.txt", "w") as f : 
    for msigdb_aline in msigdb_lines : 
        f.write(msigdb_aline)

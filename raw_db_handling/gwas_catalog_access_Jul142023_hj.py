import json
import os

### usage ###
# python gwas_catalog_access_Jul142023_hj.py [ID]

if len(sys.argv) != 2:
    print("please, check the arguments")
else:
    ID = str(sys.argv[1])

command = ["curl 'https://www.ebi.ac.uk/gwas/rest/api/efoTraits/",ID," -H Accept: application/json\x27 -o ",ID,"_access.json"]
command_string = ''.join(command)

my_file = ID + "_access.json"
with open(my_file, "r") as f:
    json_data = json.load(f)

my_link  = json_data["_links"]["associations"].get("href")
command = ["wget ", my_link, " -O ", ID, "_associations.json"]
command_string = ' '.join(command)
print(os.system(command_string))

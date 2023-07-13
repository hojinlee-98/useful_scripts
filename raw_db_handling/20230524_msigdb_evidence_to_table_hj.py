import json
import glob
import pandas as pd

gene_symbol = pd.read_table("/Volumes/hjdrive/db/gobp/20230524_hgnc_gene_symbols_hj.txt")
gene_symbol = gene_symbol["Approved symbol"].to_list()

file_list = glob.glob("/Volumes/hjdrive/db/gobp/go_evidence/msigdb_evidence_json/*.json")
evidence_list = []
gene_symbol_list = []
goid = []

for afile in file_list :
    with open(afile, 'r') as f:
        json_data = json.load(f)
        results = json_data["results"]
    
        for anno in results :
            anno_symbol = anno["symbol"]
            if anno_symbol in gene_symbol :
                evidence_list.append(anno["goEvidence"])
                gene_symbol_list.append(anno["symbol"])
                goid.append(anno["goId"])
            else : 
                pass
        
d = {'goid': goid, 'evidence': evidence_list, 'gene_symbol' : gene_symbol_list}
df = pd.DataFrame(data = d)

df.to_csv("/Volumes/hjdrive/db/gobp/20230524_msigdb_GO_evidence_hj.txt", sep = "\t", mode = "w", index = False)

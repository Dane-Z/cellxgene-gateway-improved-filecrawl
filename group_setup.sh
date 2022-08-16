## Bash script to setup groups with randomized names to obscure research data from other researchers
#!/bin/bash
groupsfile="groups_url.txt"

echo "Please input group name for randomized directory name and data directory name"

read groupname

tmp_dir=$(mktemp -d -t ${groupname}_XXXXXXXXXXXX --tmpdir=/home/Public_Data/cellxgene_data)
echo $tmp_dir
chmod 777 $tmp_dir
mkdir -m777 $tmp_dir/$groupname

IFS="/"
read -a strarr <<< "$tmp_dir"

echo "http://<ServerIP>:5006/filecrawl/${strarr[4]}"

echo -e "$groupname" >> "$groupsfile"
echo "http://<ServerIP>:5006/filecrawl/${strarr[4]}" >> "$groupsfile" 

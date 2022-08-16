## Bash script to list all groups in data directory, includes the URL and SCP location for all groups for easy copy/paste

search_dir=/home/Public_Data/cellxgene_data/
for entry in cellxgene_data/*;
        do
                if [ -d $entry ];
                        IFS="/"
                        read -a strarr <<< "$entry"
                        IFS="_"
                        read -a strarr2 <<< "${strarr[1]}"
                        then echo -e "#############################"
                        echo -e "\e[1m${strarr[ 1 ]}\e[0m"
                        echo -e ""
                        echo -e "\e[1mCopy/Paste\e[0m link: http://<ServerIP>:5006/filecrawl/${strarr[1]}"
                        echo -e ""
                        echo -e "\e[1mscp to\e[0m : scp -r FILENAME USERID@<ServerIP>:/home/Public_Data/cellxgene_data/${strarr[1]}/${strarr2[0]}/"
                        echo -e ""
                fi
done

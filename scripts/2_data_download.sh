# Download samples sequencing raw data from the IGFL

wget -r -nH --user='igfl-UE_NGS_2021' --password='UE_NGS_2021'  ftp://sharegate-igfl.ens-lyon.fr/ -P data/
# wget = download the data from an internet URL
# -P data = put these data into the "data" directory
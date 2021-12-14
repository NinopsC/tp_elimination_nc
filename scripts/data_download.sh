# Download the data from the IGFL

wget -r -nH --user='igfl-UE_NGS_2021' --password='UE_NGS_2021'  ftp://sharegate-igfl.ens-lyon.fr/ -P data/
# wget: recuperer les donnees depuis un URL internet
# -P data: mettre les donnees recup dans le fichier data


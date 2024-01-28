cars="1411387394,1411394979,1411402133,1737056920,1411394979,2103827595,1411402194,2331284205,2331284105,2883380705"
tracks="950422832"

items="${cars},${tracks}"

docker build . -t "rf2-linux-server-fuji-endu" --build-arg workshopitemList=$items

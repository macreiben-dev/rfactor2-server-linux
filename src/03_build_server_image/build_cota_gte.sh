cars="1411387394,1411394979,1411402133,1737056920,1411394979,2103827595,1411402194,2331284205,2331284105,2883380705"
track="3047323668"

items="${cars},${track}"

docker build . -t "rf2-cota-gt3" --build-arg workshopitemList=$items
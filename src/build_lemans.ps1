$items = "1737056865,2331284105,1737056920,1411394979,1411402194,2103827595"

docker build . -t "rf2-linux-server-lemans" --build-arg workshopitemList=$items --progress plain --no-cache
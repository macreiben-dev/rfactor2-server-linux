items="1737056865,2331284105,1737056920,1411394979,1411402194,2103827595"
vncPassword="yourpassword"
docker build . -t "rf2-linux-server-lemans-endu" --no-cache --build-arg workshopitemList=$items

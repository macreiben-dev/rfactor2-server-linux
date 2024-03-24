gte_ferrari="2103827595"
track_nurb="1737056846"

items="${gte_ferrari},${track_nurb}"

docker build . -t "rf2-nurb-hotlap-gte-ferrari" --build-arg workshopitemList=$items

$cars = "2811419416"
$tracks = "1737056846"

$items = "$cars,$tracks"

docker build . -t "rf2-linux-server-nurb-dtm-alfa" --build-arg workshopitemList=$items
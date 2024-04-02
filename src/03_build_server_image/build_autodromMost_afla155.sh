cars="2811419416"
tracks="3170601760"

items="${cars},${tracks}"

docker build . -t "rf2-autodrom-most-dtm-alfa" --build-arg workshopitemList=$items

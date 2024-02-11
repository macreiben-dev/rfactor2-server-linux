#     Merco,     McLaren    Bentley    C7         911        McLaren720S,BMW M6    Audi R8    ASVantage  Ferrari Evo
cars="1097232656,1097229192,1097230662,1097232188,1596822183,1596821875,1596822133,1596822230,1596822282,2103827617"

# s397 indianapolis
tracks="917386941"

items="${cars},${tracks}"

docker build . -t "rf2-linux-server-indianapolis-endu" --build-arg workshopitemList=$items

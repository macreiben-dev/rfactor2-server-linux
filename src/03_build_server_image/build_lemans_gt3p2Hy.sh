gt3_bentley="1097230662"
gt3_c7r="1097232188"
gt3_mercedes="1097232656"
gt3_porsche911="1596822183"
gt3_mclaren_720s="1596821875"
gt3_bmwm6="1596822133"
gt3_audilms="1596822230"
gt3_astonmartin="1596822282"
gt3_ferrari488="2103827617"
gt3_bmwm4="2741380074"

lmp2_oreca="1411402194"

hy_f499p="3088947577"
hy_porsche963="3088949297"

track_lemans="1737056865"

items="${gt3_bentley},${gt3_c7r},${gt3_mercedes},${gt3_porsche911},${gt3_mclaren_720s},${gt3_bmwm6},${gt3_audilms},${gt3_astonmartin},${gt3_ferrari488},${gt3_bmwm4},${lmp2_oreca},${hy_f499p},${hy_porsche963},${track_lemans}"

podman build . -t "rf2-linux-server-lemans-gt3p2hy" --build-arg workshopitemList=$items

DOCKER build with osrm 4.6.1 made to extract & prepare pbf files for osrm usage

USAGE

suppose we have pbf file "test.pbf" in "/home/tst/pbfs" direcotry
to generate osrm files execute

docker run -t -v /home/tst/pbfs:/srv/data -v /tmp:/tmp iliax/osrm_4_6_1 /osrm/project-osrm/build/osrm-extract /srv/data/test.pbf
docker run -t -v /home/tst/pbfs:/srv/data -v /tmp:/tmp iliax/osrm_4_6_1 /osrm/project-osrm/build/osrm-prepare /srv/data/test.osrm

after that you will get multiple *.osrm files in "/home/tst/pbfs" directory for futher osrm server usage

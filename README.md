# Sprawozdanie Lab5

# Komendy do uruchomienia 
docker build --build-arg VERSION=1.0.0 -t lab5 .
docker run -d -p 9005:80 --name strona_lab5 lab5

Wspisnaie 'docker ps bedzie' sprawdzi działanie kontenera a funcjonalność poleceniem 'curl http://localhost:9005/'


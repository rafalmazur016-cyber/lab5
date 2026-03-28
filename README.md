# Sprawozdanie Lab5

# Komendy do uruchomienia 
docker build --build-arg VERSION=1.0.0 -t lab5 .
docker run -d -p 9005:80  lab5

po wpisanaiu komend można zobaczyc efekt strony komenda curl http://localhost:9005/ 

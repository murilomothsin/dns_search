# README

DNS API

# Docker configuration

1. Install docker (https://docs.docker.com/install/)
2. run `docker-compose build`
3. run `docker volume create --name=postgres_database`
4. run `docker-compose up`
5. run `docker-compose run web rake db:create`
6. run `docker-compose run web rake db:migrate`
7. run `docker-compose run web rake db:seed`


# cUrl requests

##GET

```
curl -XGET -d 'included[]=ipsum.com&included[]=dolor.com&excluded[]=sit.com&page=1' 'http://localhost:3000/dns_records'
```

##POST
```
curl -XPOST -H "Content-type: application/json" -d '{"dns_records": 
 {
   "ip_address":"5.5.5.5",
   "hostnames_attributes": [{
     "hostname": "sit.com"
   }]
 }
}' 'http://localhost:3000/dns_records'
```
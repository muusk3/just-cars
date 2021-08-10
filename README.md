# JUST-CARS API

<br>

### **Config**

<br>
<span style="color:red; font-weight:bold;">
  Normally not included in this file!!!
</span>
<hr>

_**config/credentials/development.key**_
<br>
`fd56f791474c3e26d152378238c297be`

_**config/credentials/test.key**_
<br>
`a0b896270bb8cba250c83abf7fab1843`

_**config/master.key**_
<br>
`89c4466ebeb0260180a3a34394260219`

**Request header authorization token for the development purposes:**  `ihiyvBJ0wW2oK8-HO6bC-Ag`

<hr>
<br>

### **Run**

<br>

**env:**

Requirements: Ruby: 2.7.1, PostgreSQL 12+, Elasticsearch 6+

```bash
1. bundler
2. rails db:setup
3. rails s -p 3000 -b lvh.me
```

<br>

**docker:**

```
1. docker-compose up --build
2. Run commands rake tasks:
      - docker exec api bundle exec rails db:setup
      - docker exec api bundle exec rails db:seed
      - docker exec api rake searchkick:reindex:all
```

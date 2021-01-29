---

---
# nodeNet
An experimental project to interface websockets in R (RStudio) with nodeRED services in a network of Docker containers.

This project lives at [https://github.com/ShokinawGrove/nodeNet]().

### Running with Docker
Go to a desired directory in terminal and run the command:  
```{bash}
git clone https://github.com/ShokinawGrove/nodeNet
```
Change directories and run the `docker-compose` build script.
```
cd nodeNet \
bash ./start.sh build
```
Or, more simply:
```
docker-compose up -d
```
Downloading the images, particularly the Rocker (RStudio) image, may take some time.

For stopping and broadly managing  containers , `dockill.sh` is provided, but beware: **Option 4 will delete ALL of your images.**  For fine-grained control, please refer to the Docker CLI.

When the containers are up, the User Interfaces to RStudio and NodeRED can be found on `localhost` (or `127.0.0.1`) at ports `8787` and `1880` respectively:

* **[RStudio](http://127.0.0.1:8787):** [http//127.0.0.1:8787]()
* **[NodeRed](http://127.0.0.1:1880):** [http//127.0.0.1:1880]()



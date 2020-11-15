# dev-docker

The `docker-compose` files for my development machines

This requires `docker`, `docker-compose`, and a `.env` file.  The `.env` is not committed to the repo.  It looks something like this

```bash
SA_PASSWORD=MySecureP@ssw0rd
```

## Updating the Images

Run the following commands to update the images

```ps1
docker-compose up --force-recreate --build -d
docker image prune -f
```

***Note***: The `prune -f` option will delete the old images and free up space

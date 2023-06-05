# dev-docker

The `docker-compose` files for my development machines

This requires `docker`, `docker-compose`, and a `.env` file.  The `.env` is not committed to the repo.  It looks something like this

```bash
SA_PASSWORD=MySecureP@ssw0rd
DATABASE_FOLDER=C:\MyPath\To\My\SQL\Data # Case sensitive on the Mac
```

For Windows

```yaml
    - c:\Databases\Data:/var/opt/mssql/data
    - c:\Databases\logs:/var/opt/mssql/logs
```

For Mac

```yaml
    ## (Case sensitive)
    - /Users/username/sql/data:/var/opt/mssql/data
    - /var/folders/sql/logs:/var/opt/mssql/logs
```

On a Mac, you may need to update the permissions on the folders

```bash
 chown -R 10001:0 <DATA_FOLDER>
 ```

## Running for the First Time

Run the following command to build and start the containers

```bash
docker-compose up
```

## Updating the Images

Run the following commands to update the images

```ps1
docker-compose up --force-recreate --build -d
docker image prune -f
```

***Note***: The `prune -f` option will delete the old images and free up space

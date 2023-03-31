# tripodvideoninja

[![Netlify Status](https://api.netlify.com/api/v1/badges/3ef632d9-b4a7-4279-9325-93a01ab6bd6d/deploy-status)](https://app.netlify.com/sites/dazzling-keller-ced861/deploys)

Personal videography site created using Jekyll, built and hosted by [Netlify](https://www.netlify.com), indexed by [Algolia](https://www.algolia.com), and provided via [Hover](https://www.hover.com).

<img src="_assets/images/logo.png" width=150px />

## Running Locally via Docker

1. Ensure [Docker Desktop](https://www.docker.com/products/docker-desktop) is installed and running in the background.
2. Create a new file `.env.dev` with the Algolia Admin API Key. This file is automatically excluded from being committed. Example: `echo ALGOLIA_API_KEY=my_api_key > .env.dev`
3. Run `docker-compose up -d` and visit <http://localhost:4000> after the container starts up. It may still be building for 2-5 minutes in the background before the site is up. View the logs in Docker Desktop for more detail.


**Notes**

* Any edits to pages will automatically refresh.
* To regenerate Algolia indexes, simply restart the container or run `algolia-dev.sh` manually from the Docker terminal. Algolia indexes are used for searching posts and populating the homepage. Note: Algolia is setup to have separate dev and production indexes, so running the script locally will not change the production site.
* Changes to the `Dockerfile` (like upgrading the base OS image) should be followed by manually deleting the image from Docker Desktop. Otherwise `docker-compose` will reuse the old image when it spins up the container.
* If `docker-compose up` throws the error `.env.dev: no such file or directory` please create an `.env.dev` file according to the instructions above.


## CI/CD

Commits to the `master` branch will trigger a build and deploy via Github-Netlify integration.

* Build command: `jekyll build && jekyll algolia`
* Environment variables: `ALGOLIA_API_KEY=` and `JEKYLL_ENV=production`
* Publish directory: `_site`

## References

* <https://www.kunalnagar.in/blog/setup-docker-jekyll-dev-environment/>
* <https://githubplus.com/jekyll/jekyll-admin/issues/460>

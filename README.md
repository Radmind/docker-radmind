# Radmind Server Docker Image

It's almost 2022 and we are using radmind again...

This is a work in progress.

## Slack

If you have questions or want to discuss this please do it on the radmind channel on the [MacAdmins Slack](https://www.macadmins.org/).

## Install

Download and install docker-compose and [docker](https://www.docker.com/get-started).

```
git clone github.com/radmind/radmind_docker.git
cd radmind_docker
```

## Running the radmind server

```
docker-compose up -d
```

## Connecting to the server

- Install radmind tools.
- On the same machine open another terminal window.
- Make sure you can write to /var/radmind/client (try `touch /var/radmind/client/command.K`)
- `ktcheck -c sha1 -h localhost -p 6222`

If it all worked you should have a new file at /var/radmind/client/command.K and it's contents will be "# hi from radmind".

## Next steps

Inside the radmind folder you'll see a "config" file. Edit it to add computers. There's also the command folder and everything else. Oh the memories. It's a good thing I kept all of my old files.

## License

MIT License
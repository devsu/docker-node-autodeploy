# docker-node-pm2-autodeploy
A docker with node, pm2 and simple-auto-deploy

**Intended to be used only for development purposes.**

Usage:

```bash
docker run --name test \
  -p 3000:3000 \
  -v ${PWD}:/var/sources \
  -t \
  devsu/node-pm2-autodeploy
```

## License and Credits

MIT License. Copyright 2017

Built by the [Docker experts](https://devsu.com) at Devsu.

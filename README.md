## Start

Start your own build by running:

```
docker build -t my_build:my_tag -f Dockerfile .
```

It takes about 15-20 minutes. Be patient.

After that, run:

```
docker run -t -i my_build:my_tag /bin/bash
```

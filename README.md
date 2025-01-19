# SUMMARY
This example demonstrates usage of ARG as an environment variable during Docker build.

# Building the image

Build the container using this command:

`docker build --build-arg FLAVOR=honey --tag test:arg .`

You can use a different flavor if you prefer. 
This executes the commands in the `Dockerfile`. The most important commands in the file are

```
ARG FLAVOR
RUN python init.py
```

We do not pass `FLAVOR` to the Python sript directly. Instead, the script accesses it as an environment variable via `os.environ["FLAVOR"]`. This proves that `ARG` command creates a true environment variable that can be accessed from child processes running at build time.

`init.py` script creates a file name `go.sh` with the command to echo the flavor, hard coded, e.g.

`echo honey`

# Running the Container

Once the image is built, run it as follows:

`docker run -i test:arg`

This will print

`honey`

or whatever other flavor you had passed to the build.

# Conclusion

This proves that the ARG command creates a true environment variable, which is accessible from the processes invoked from the Dockerfile.

See also: https://ikriv.com/blog/?p=5186
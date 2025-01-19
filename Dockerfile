FROM python:3.12-alpine
ARG FLAVOR
COPY init.py .
RUN python init.py
RUN chmod 755 go.sh
CMD sh -c ./go.sh



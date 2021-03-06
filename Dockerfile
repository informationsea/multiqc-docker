FROM python:3-alpine AS build
RUN apk add gcc g++ freetype-dev libpng-dev
RUN pip3 install cython && pip3 install matplotlib==2.2.5 && pip3 install multiqc==1.8

FROM python:3-alpine
RUN apk add --no-cache freetype libpng libstdc++ bash
COPY --from=build /usr/local /usr/local/
CMD ["/bin/sh"]

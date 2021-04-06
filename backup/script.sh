#!/bin/bash
DATE=$(date +"%Y%m%d")
FN=$DATE'.tar.gz'
tar -czvf ~/$FN /srv/docker/downloads/config/
docker run --rm -it -v ~/.aws:/root/.aws -v ~/:/aws amazon/aws-cli s3 cp ./$FN s3://javydekoning/homelab/
rm ~/$FN
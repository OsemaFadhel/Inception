FROM debian:bullseye

RUN apt -get update && sudo apt-get install php \
		php \
		php-cgi \
		php-mysql \
		php-cli \
		wget \
		curl \
		bash

EXPOSE 9000

ENTRYPOINT ["tools/entrypoint.sh"]

CMD ["bash"]


build:
	docker build -t achievemore-ruby .

shell:
	docker run --rm -w /app -it achievemore-ruby /bin/sh

run:
	docker run -p 3000:3000 --rm -w /app -it achievemore-ruby
	open http://0.0.0.0:3000/

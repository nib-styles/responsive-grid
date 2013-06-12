build:
	@sass index.scss > build/build.css --load-path components

.PHONY: build
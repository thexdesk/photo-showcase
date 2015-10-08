# Photo Showcase
[![Build Status](https://travis-ci.org/hinshun/photo-showcase.svg)](https://travis-ci.org/hinshun/photo-showcase)
[![Code Climate](https://codeclimate.com/github/hinshun/photo-showcase/badges/gpa.svg)](https://codeclimate.com/github/hinshun/photo-showcase)
[![Test Coverage](https://codeclimate.com/github/hinshun/photo-showcase/badges/coverage.svg)](https://codeclimate.com/github/hinshun/photo-showcase/coverage)

Created with ❤ by Edgar Lee

# Summary
This was a fun project using 500px's API to fetch the top 100 popular posts. Many third party libraries were used to make my life easier. Please try to take a look on mobile (or by resizing), and try to disable javascript. It should still work fairly well.

Since this rails project mostly involved calling a few API endpoints, the backend is simple. The service object pattern was not necessary, but I am hoping that it demonstrates my breadth more clearly.

If I had more cycles I would do the following:
- Add cucumber tests
- Add more meta data to photo containers (links, fav counts, photographer, etc)
- Animate appending items to packery grid
- Add loading gif as default background of photo containers, so that it will be seen until the image is loaded
- Add cool animated backgrounds to header with dynamic data with pixi.js

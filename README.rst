pypi-nginx-cache
================

Usage::

    docker run -p 80:8080 ossobv/pypi-nginx-cache

    pip install -i http://127.0.0.1/simple/ somepackage

Does not work with search (yields a 405 for now).

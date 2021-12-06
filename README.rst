pypi-nginx-cache
================

Usage::

    docker run -p 80:8080 ossobv/pypi-nginx-cache

    pip install -i http://127.0.0.1/simple/ somepackage
    # or
    PIP_INDEX_URL=http://127.0.0.1/simple/ PIP_TRUSTED_HOST=127.0.0.1 pip ...

Optional env::

    # Show X-Forwarded-For in logs
    LOG_X_FORWARDED_FOR=1

    # Skip various fields in logs
    LOG_SKIP_TIME=1
    LOG_SKIP_REFERER=1
    LOG_SKIP_USER_AGENT=1

Does not work with search (yields a 405 for now).

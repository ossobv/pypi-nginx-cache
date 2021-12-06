#!/bin/sh

# Default:
#
# log_format combined '$remote_addr - $remote_user [$time_local] '
#                     '"$request" $status $body_bytes_sent '
#                     '"$http_referer" "$http_user_agent"';

if test -n "${LOG_X_FORWARDED_FOR}"; then
    remote_addr='$http_x_forwarded_for'
    remote_addr2='$remote_addr'
else
    remote_addr='$remote_addr'
    remote_addr2='-'
fi

if test -n "${LOG_SKIP_TIME}"; then
    opt_time_field=''  # docker/k8s logs time too
else
    opt_time_field=' [$time_local]'
fi

if test -n "${LOG_SKIP_REFERER}"; then
    opt_referer=''
else
    opt_referer=' "$http_referer"'
fi

if test -n "${LOG_SKIP_USER_AGENT}"; then
    opt_user_agent=''  # pip user agent is kind of verbose
else
    opt_user_agent=' "$http_user_agent"'
fi

cat >/etc/nginx/logging.conf <<EOF
    log_format custom_log_format '[CACHE \$upstream_cache_status] $remote_addr $remote_addr2 \$remote_user$opt_time_field '
                    '"\$request" \$status \$body_bytes_sent$opt_referer$opt_user_agent';
    access_log /dev/stdout custom_log_format;
EOF

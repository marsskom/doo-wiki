vcl 4.1;

backend default {
    .host = "webserver";
    .port = "8080";
    .first_byte_timeout = 600s;
}

vcl 4.1;

backend default {
    .host = "webserver";
    .port = "8080";
    .first_byte_timeout = 600s;
}

sub vcl_recv {
    # Command to clear complete cache for all URLs and all sub-domains
    # curl -X XCGFULLBAN http://example.com
    if (req.method == "XCGFULLBAN") {
        ban("req.http.host ~ .*");
        return (synth(200, "Full cache cleared"));
    }
}

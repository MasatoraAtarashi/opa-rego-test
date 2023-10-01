package handler

import "net/http"

func handler() {
	_, _ = http.Get("http://example.com/")
}

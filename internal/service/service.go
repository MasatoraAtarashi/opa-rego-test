package service

import "net/http"

func service() {
	_, _ = http.Get("http://example.com/")
}

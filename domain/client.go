package domain

import (
	"bytes"
	"crypto/hmac"
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"github.com/gorilla/websocket"
	"io/ioutil"
	"net/http"
	"strconv"
	"time"
)

type Client struct {
	Key             string
	Secret          string
	WebsocketClient *websocket.Conn
}

func (cl *Client) Request(method, baseUrl, endpoint string, query map[string]string, body []byte, methodResponse interface{}) error {
	url := baseUrl + endpoint
	req, err := http.NewRequest(method, url, bytes.NewBuffer(body))
	if err != nil {
		return err
	}

	q := req.URL.Query()
	for key, val := range query {
		q.Set(key, val)
	}
	req.URL.RawQuery = q.Encode()

	for key, val := range getHeader(*cl, method, makeEndpointWithRawQuery(endpoint, req.URL.RawQuery), body) {
		req.Header.Add(key, val)
	}

	if method == http.MethodPost {
		req.Header.Set("Content-Type", "application/json")
	}

	httpClient := new(http.Client)
	resp, err := httpClient.Do(req)
	if err != nil {
		return err
	}
	respBytes, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return err
	}

	if err := json.Unmarshal(respBytes, &methodResponse); err != nil {
		return err
	}
	return nil
}

func getHeader(cl Client, method, endpoint string, body []byte) map[string]string {
	timestamp := strconv.FormatInt(time.Now().Unix(), 10)
	msg := timestamp + method + endpoint + string(body)
	sign := makeAccessSign(msg, cl.Secret)
	return map[string]string{
		"ACCESS-KEY":       cl.Key,
		"ACCESS-TIMESTAMP": timestamp,
		"ACCESS-SIGN":      sign,
	}
}

func makeAccessSign(msg, secret string) string {
	mac := hmac.New(sha256.New, []byte(secret))
	mac.Write([]byte(msg))
	return hex.EncodeToString(mac.Sum(nil))
}

func makeEndpointWithRawQuery(endpoint, raw string) string {
	str := ""
	if raw != "" {
		str = fmt.Sprintf("%s?%s", endpoint, raw)

	} else {
		str = fmt.Sprintf("%s", endpoint)
	}
	return str
}

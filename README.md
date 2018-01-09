# squid-offline-cache
Offline web proxy cache by using Squid
### Quick-start
- docker-compose up -d
- docker-compose stop Squid
- (For upgrading) docker-compose restart Squid
### Features
- Serve the recently cached content for a web page; if the web server is offline.
- Only for HTTP communication
### Limitations
- Used as a proxy directly in the web browser; only adapted for web page content through web browsers.
## WIP (paused at 2018-01-02)
Is it possible to achieve this?
Will stale content be removed after some arbitrary time?
Is it possible to add a prepended message for served stale web content, that shall be visible to the user?
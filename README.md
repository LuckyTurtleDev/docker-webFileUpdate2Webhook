# webFileUpdate2Webhook
webFileUpdate2Webhook will send a webhook if a web file is updated.  

A optional grep instruction can be used during the comparison.

The enviroment variable ```INTERVAL``` sets the intervall of the requests. (time in seconds, default 3600)

## config file
a line is structured in the following way:  
```
[web file] [webhook] [grep instruction(optional)]
```  

```config.txt```example:
  ```
  https://example1.com/download/afile https://example2.com/webhook
  https://example3.com/rss https://example4.com/webhook '/^<!/d'
  ```

## example docker-compose:
```
version: '3.3'
services:
    avorion-docker:
        image: lukas1818/webfileupdate2webhook
        environment:
          - INTERVAL=1800
        volumes:
            - './config.txt:/home/user/list.txt:ro'
            - './cache:/home/user/downloads'
        restart: unless-stopped
```

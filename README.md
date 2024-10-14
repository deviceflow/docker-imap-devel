# Dockerized IMAP server#

IMAP server for debugging.

**IMPORTANT**: This image is **ONLY** for developing/debugging proposes

This docker image is based on https://github.com/tomav/docker-mailserver
If you look for a docker image for production environment, then go here:
https://hub.docker.com/r/tvial/docker-mailserver/

This image is even simpler than `tvial` docker image. Includes only
Postfix (SMTP) and Dovecot (IMAP) servers with one catchall mailbox
`debug@example.org` for all emails. So, it's very useful for debugging. Optionally, you can define another normal mailbox.

Every email received via SMTP will be delivered locally to `debug@example.org`, so it's safe for testing a web application sending emails with a production list of emails.

Using your favorite email client you can connect via IMAP protocol to see emails like original recipient would received them


## Run container with docker compose

```
cp docker-compose.yml.dist docker-compose.yml
```

Edit ```docker-compose.yml``` for set these environment variables:

- MAILNAME: Mail domain (by default, `localdomain.test`)
- MAIL_CATCH_ALL: Optionally, set this to an email address that will receive all emails that don't go to any existing mailbox.

```
docker-compose up
```

You can set the list of email accounts to create by binding to the file `/mailboxes.txt`.
This should be a new-line separated list of email addresses.

All accounts from this file, as well as the catch all, will have the password "test".

Configure your email client with these parameters and test it sending
any email to any email address

### Catch all debug mailbox


- **IMAP server:** `imap`
- **IMAP encryption:** `SSL`
- **IMAP port:** `993`
- **IMAP username:** `debug@example.org` (change `example.org` by your `MAILNAME`)
- **IMAP password:** `debug`

- **SMTP server:** `imap`
- **SMTP encryption:** `No`
- **SMTP port:** `25`
- **SMTP authentication:** `none`


### Normal user mailbox (Optional)


- **IMAP server:** `imap`
- **IMAP encryption:** `SSL`
- **IMAP port:** `993`
- **IMAP username:** `address@example.org` (change `address@example.org` by your `MAIL_ADDRESS`)
- **IMAP password:** `pass` (change `pass` by your `MAIL_PASS`)

- **SMTP server:** `imap`
- **SMTP encryption:** `No`
- **SMTP port:** `25`
- **SMTP authentication:** `none`

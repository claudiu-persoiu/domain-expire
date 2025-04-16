# Domain certificate expiration checker

As https://letsencrypt.org/ is dropping notifications for domain expiration notifications, I decided to build a small tool to achieve a similar functionality.

## Usage

    $ go run main.go google.com

The return value is in days.
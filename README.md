# Welcome to Ghost-Backup 👋
![Version](https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/JMousqueton/Ghost-Backup/blob/master/LICENSE)
[![Twitter: JMousqueton](https://img.shields.io/twitter/follow/JMousqueton.svg?style=social)](https://twitter.com/JMousqueton)

> Script to backup your self hosted Ghost blog

## Install

```sh
curl https://github.com/JMousqueton/Ghost-Backup/blob/master/ghost-backup.sh -o ghost-backup.sh
chmod u+x ghost-backup.sh
```

## 🛠️ Configuration

Edit these variables :
| Variable  | Description  |
|---|---|
| ghostUser | Your ghost admin login  |
| ghostPassword | Your ghost admin password  |
| ghostDatabase | Your ghost database name |
| ghostDatabaseUser | Your ghost database user   |
| ghostDatabasePassword | Your ghost database password  |
| ghostDomain | Your blog domain (ie https://www.example.com) |
| ghostFolder | Your blog path |
| backupName | Your backup file name  |
| backupRetention | Backup retention in days |

Your can find some information runing these commands (replace ```<ghost user>``` with your ghost user):

| Variable | Command |
|---|---|
| ghostDatabase | ```runuser -l <ghost user> -c 'cd /var/www/ghost;ghost config get database.connection.database'```|
| ghostDatabaseUser | ```runuser -l <ghost user> -c 'cd /var/www/ghost;ghost config get database.connection.user'``` |
| ghostDatabasePassword | ```runuser -l <ghost user> -c 'cd /var/www/ghost;ghost config get database.connection.password'``` |
| ghostDomain | ```runuser -l <ghost user> -c 'cd /var/www/ghost;ghost config get url'```|

## Usage

```sh
./backup-ghost.sh
```

## Author

👤 **Julien Mousqueton**

* Website: [https://www.julienmousqueton.fr](https://www.julienmousqueton.fr)
* Twitter: [@JMousqueton](https://twitter.com/JMousqueton)
* Github: [@JMousqueton](https://github.com/JMousqueton)
* LinkedIn: [@julienmousqueton](https://linkedin.com/in/julienmousqueton)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page](https://github.com/JMousqueton/Ghost-Backup/issues). You can also take a look at the [contributing guide](https://github.com/JMousqueton/Ghost-Backup/blob/master/CONTRIBUTING.md).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2020 [Julien Mousqueton](https://github.com/JMousqueton).

This project is [MIT](https://github.com/JMousqueton/Ghost-Backup/blob/master/LICENSE) licensed.

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
![](https://stats.mousqueton.io/matomo.php?idsite=6&amp;rec=1)

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://git.haresign.dev/miller/TraefikStack">
    <img src="https://i.imgur.com/3cxZ0gr.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Traefik Stack</h3>

  <p align="center">
    My Repo for Traefik!
    <br />
    <a href="https://git.haresign.dev/miller/TraefikStack"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://git.haresign.dev/miller/TraefikStack">View Demo</a>
    ·
    <a href="https://git.haresign.dev/miller/TraefikStack/issues">Report Bug</a>
    ·
    <a href="https://git.haresign.dev/miller/TraefikStack/issues">Request Feature</a>
  </p>
</p>


<!-- ABOUT THE PROJECT -->
## About The Project
This is a simple stack that depolys Traefik V2 with a few other containers

Containers:
* <a href="https://doc.traefik.io/traefik/providers/docker/">Traefik V2</a>

<p align="center">
  <img src="https://i.imgur.com/s3yh36y.png" width="400" />

</p>

* <a href="https://github.com/clems4ever/authelia">Authelia</a>

Here is what Authelia's portal looks like

<p align="center">
  <img src="https://github.com/authelia/authelia/raw/master/docs/images/1FA.png" width="400" />
  <img src="https://github.com/authelia/authelia/raw/master/docs/images/2FA-METHODS.png" width="400" />
</p>

* <a href="https://github.com/amir20/dozzle">Dozzle</a>

   <img src="https://github.com/amir20/dozzle/raw/master/.github/demo.gif?raw=true">
* Portainer
* <a href="https://github.com/pyouroboros/ouroboros">Ouroborus</a>
Auto updates docker containers - with notifcation support to TELEGRAM API

   <img src="https://www.danielmartingonzalez.com/assets/posts/en/automatically-update-containers/telegram-notification.png">


<!-- INSTALL -->
## Install

Coming soon....

<!-- SECURITY -->
## Security

UFW RULES

Because everything works through Traefik for port exposer there is no need to expose other ports to your server other than 80/433 for a web stack, for harderedn securty I also use WireGuard VPN but that is not in this scope

* Deny All Incoming
* Accept All Outgoing


```
Logging: on (low)
Default: deny (incoming), allow (outgoing), deny (routed)
New profiles: skip

To                         Action      From
--                         ------      ----                 
80                         ALLOW IN    Anywhere                  
443                        ALLOW IN    Anywhere  
22                         ALLOW IN    Anywhere  
                                                                        
```


<!-- LICENSE -->
## License
If you break it dont blame me



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/milleruk/TraefikStack.svg?style=for-the-badge
[contributors-url]: https://git.haresign.dev/miller/TraefikStack/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/milleruk/TraefikStack.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/milleruk/django_bootcamp.svg?style=for-the-badge
[stars-url]: https://git.haresign.dev/miller/TraefikStack/stargazers
[issues-shield]: https://img.shields.io/github/issues/milleruk/TraefikStack.svg?style=for-the-badge
[issues-url]: https://git.haresign.dev/miller/TraefikStack/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://#
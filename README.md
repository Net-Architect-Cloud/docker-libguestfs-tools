<div id="top"></div>
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GPL-3.0 License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Net-Architect-Cloud/docker-libguestfs-tools">
    <img src="images/logo.svg" alt="Logo" width="250">
  </a>

<h3 align="center">LibGuestFS Container</h3>

  <p align="center">
    Docker container with libguestfs, qemu and image manipulation tools
    <br />
    <a href="https://github.com/Net-Architect-Cloud/docker-libguestfs-tools"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Net-Architect-Cloud/docker-libguestfs-tools/issues">Report Bug</a>
    ·
    <a href="https://github.com/Net-Architect-Cloud/docker-libguestfs-tools/issues">Request Feature</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

This project provides a Docker image containing libguestfs, qemu, and other essential tools for virtual machine image manipulation. Based on Rocky Linux 9 minimal, this container is optimized for size and performance while offering the full functionality of libguestfs and associated tools.

Key features:
- Ready-to-use libguestfs configuration with direct backend
- Support for multiple filesystem formats (ext4, XFS, BTRFS, NTFS, FAT)
- Comprehensive tools for converting, manipulating, and analyzing virtual images
- Lightweight container image with aggressive cleanup of unnecessary dependencies

This container is ideal for CI/CD pipelines requiring VM image manipulation, development environments, and automation tools for virtualized infrastructure management.

<p align="right">(<a href="#top">back to top</a>)</p>

### How to use this image

1. Pull the image from GitHub Container Registry
   ```sh
   docker pull ghcr.io/Net-Architect-Cloud/docker-libguestfs-tools:latest
   ```

2. Mount a volume to share images with the container
   ```sh
   docker run -v /local/path/images:/workspace/images ghcr.io/Net-Architect-Cloud/docker-libguestfs-tools
   ```

3. Use libguestfs tools in the container
   ```sh
   docker run -v /local/path/images:/workspace/images ghcr.io/Net-Architect-Cloud/docker-libguestfs-tools \
     virt-customize -a /workspace/images/my-vm.qcow2 --install nginx
   ```

#### Example usage with virt-v2v

Converting a VMware image to qcow2 for KVM/OpenStack:
```sh
docker run -v /local/path/images:/workspace/images ghcr.io/Net-Architect-Cloud/docker-libguestfs-tools \
  virt-v2v -i ova /workspace/images/source-vm.ova -o local -os /workspace/images -of qcow2
```

<p align="right">(<a href="#top">back to top</a>)</p>

### Environment Variables

The container is configured with the following environment variables for libguestfs:

| Variable | Default Value | Description |
|----------|----------|-------------|
| LIBGUESTFS_BACKEND | direct | Uses direct backend (no nested VM) |
| LIBGUESTFS_DEBUG | 0 | Disabled to reduce noise |
| LIBGUESTFS_TRACE | 0 | Disabled to reduce noise |
| LIBGUESTFS_PROGRESS | 1 | Enabled to show progress |
| LIBGUESTFS_VERBOSE | 0 | Disabled for minimal output |

You can override these values when running the container:

```sh
docker run -e LIBGUESTFS_VERBOSE=1 -v /local/path:/workspace/images ghcr.io/Net-Architect-Cloud/docker-libguestfs-tools
```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the GPL-3.0 License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Kevin Allioli - [@netarchitect](https://twitter.com/netarchitect) - kevin@netarchitect.cloud

Project Link: [https://github.com/Net-Architect-Cloud/docker-libguestfs-tools](https://github.com/Net-Architect-Cloud/docker-libguestfs-tools)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Net-Architect-Cloud/docker-libguestfs-tools.svg?style=for-the-badge
[contributors-url]: https://github.com/Net-Architect-Cloud/docker-libguestfs-tools/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Net-Architect-Cloud/docker-libguestfs-tools.svg?style=for-the-badge
[forks-url]: https://github.com/Net-Architect-Cloud/docker-libguestfs-tools/network/members
[stars-shield]: https://img.shields.io/github/stars/Net-Architect-Cloud/docker-libguestfs-tools.svg?style=for-the-badge
[stars-url]: https://github.com/Net-Architect-Cloud/docker-libguestfs-tools/stargazers
[issues-shield]: https://img.shields.io/github/issues/Net-Architect-Cloud/docker-libguestfs-tools.svg?style=for-the-badge
[issues-url]: https://github.com/Net-Architect-Cloud/docker-libguestfs-tools/issues
[license-shield]: https://img.shields.io/github/license/Net-Architect-Cloud/docker-libguestfs-tools.svg?style=for-the-badge
[license-url]: https://github.com/Net-Architect-Cloud/docker-libguestfs-tools/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/kevinallioli

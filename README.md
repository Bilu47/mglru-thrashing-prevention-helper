
# Enable or disable MGLRU thrashing prevention

A simple shell script and a oneshot systemd service to modify, enable or disable MGLRU thrashing prevention at boot time or on the fly.

## Usage

Run `mglru-thrashing-prevention_value M` [M = a number of your choice] in your terminal to modify it on the fly (manually).

Example output for the value 2000:
```
$ mglru-thrashing-prevention_value 2000
#!/bin/sh -v
echo $1 | sudo tee /sys/kernel/mm/lru_gen/min_ttl_ms
2000
```

Or enable/disable MGLRU thrashing prevention during system boot (automatically):
```bash
$ sudo systemctl enable mglru-thrashing-prevention.service
```
By default it sets `/sys/kernel/mm/lru_gen/min_ttl_ms` to 1000.

Edit the unit file using systemctl (to change `min_ttl_ms` value):
```bash
$ sudo systemctl edit mglru-thrashing-prevention.service --full
```

## Installation

Install
```bash
$ git clone https://github.com/Bilu47/mglru-thrashing-prevention-helper.git
$ cd mglru-thrashing-prevention-helper
$ sudo make install
```

Uninstall
```bash
$ sudo make uninstall
```

## Kernels with mg-LRU

- https://github.com/xanmod/linux (https://xanmod.org)
- https://github.com/zen-kernel/zen-kernel (https://liquorix.net)
- https://gitlab.com/post-factum/pf-kernel/-/wikis/README

## Resources

mg-lru-helper:
- https://github.com/hakavlad/mg-lru-helper

Multigenerational LRU Framework at LKML:
- v1: https://lore.kernel.org/lkml/20210313075747.3781593-1-yuzhao@google.com/
- v2: https://lore.kernel.org/lkml/20210413065633.2782273-1-yuzhao@google.com/
- v3: https://lore.kernel.org/lkml/20210520065355.2736558-1-yuzhao@google.com/
- v4: https://lore.kernel.org/lkml/20210818063107.2696454-1-yuzhao@google.com/
- v5: https://lore.kernel.org/lkml/20211111041510.402534-1-yuzhao@google.com/
- v6: https://lore.kernel.org/lkml/20220104202227.2903605-1-yuzhao@google.com/
- v7: https://lore.kernel.org/lkml/20220208081902.3550911-1-yuzhao@google.com/
- v8: https://lore.kernel.org/lkml/20220308234723.3834941-1-yuzhao@google.com/
- v9: https://lore.kernel.org/lkml/20220309021230.721028-1-yuzhao@google.com/
- v10: https://lore.kernel.org/lkml/20220407031525.2368067-1-yuzhao@google.com/
- v11: https://lore.kernel.org/lkml/20220518014632.922072-1-yuzhao@google.com/
- v12: https://lore.kernel.org/lkml/20220614071650.206064-1-yuzhao@google.com/
- v13: https://lore.kernel.org/lkml/20220706220022.968789-1-yuzhao@google.com/

Multigenerational LRU Framework at LWN.net:
- https://lwn.net/Articles/851184/
- https://lwn.net/Articles/856931/
- https://lwn.net/Articles/881675/
- https://lwn.net/Articles/894859/

Multigenerational LRU Framework at phoronix:
- https://www.phoronix.com/scan.php?page=news_item&px=Linux-Multigen-LRU
- https://www.phoronix.com/scan.php?page=news_item&px=Multigenerational-LRU-v2
- https://www.phoronix.com/scan.php?page=news_item&px=Multigen-LRU-Framework-V3
- https://www.phoronix.com/scan.php?page=news_item&px=Multigen-LRU-v5
- https://www.phoronix.com/scan.php?page=news_item&px=Linux-MGLRU-v6-Linux
- https://www.phoronix.com/scan.php?page=news_item&px=MGLRU-Not-For-5.18
- https://www.phoronix.com/scan.php?page=news_item&px=Linux-MGLRU-v9-Promising
- https://www.phoronix.com/scan.php?page=news_item&px=MGLRU-v10
- https://www.phoronix.com/scan.php?page=news_item&px=MGLRU-v11-Linux-Perf
- https://www.phoronix.com/scan.php?page=news_item&px=MGLRU-v12-For-Linux-5.19-rc
- https://www.phoronix.com/scan.php?page=news_item&px=MGLRU-July-2022-Performance
- https://www.phoronix.com/scan.php?page=news_item&px=MGLRU-v13-More-Benchmarks

Multigenerational LRU Framework at linux.org.ru:
- https://www.linux.org.ru/forum/general/16321096


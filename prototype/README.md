# util-make-ssh-config / prototype


## 操作步驟


### 維護「hosts」設定

請先維護「hosts」這個資料夾底下的設定

參考結構

```
hosts/
├── h01.com
│   ├── com.conf
│   └── home.conf
├── h02.com
│   ├── com.conf
│   └── home.conf
└── h03.net
    ├── com.conf
    └── home.conf

3 directories, 6 files

```

* hosts/主機X/home.conf <-- 家裡的設定
* hosts/主機X/com.conf <-- 公司的設定


第一層是資料夾「hosts」。

第二層也是資料夾，代表的意思，連線某個主機的設定，資料夾可以任意命名，只要維護上好分辨確認就好。

第三層有兩個檔案「home.conf」和「com.conf」。「home.conf」指的是「家裡的設定」，「com.conf」指的是「公司的設定」。


### 產生「var/home/config」

「home」指的是，要給放在家裡的開發機使用

執行下面指令，產生「var/home/config」

``` sh
$ make home
```

也就是會將下面三個檔案

* hosts/h1.com/home.conf
* hosts/h2.com/home.conf
* hosts/h3.net/home.conf

合併成「var/home/config」這個檔。

### 複製「var/home/config」到「~/.ssh/config」

執行下面指令，複製「var/home/config」到「~/.ssh/config」

``` sh
$ make home-set
```

### 產生「var/com/config」

「com」指的是，要給放在公司的開發機使用

執行下面指令，產生「var/com/config」

``` sh
$ make com
```

也就是會將下面三個檔案

* hosts/h1.com/com.conf
* hosts/h2.com/com.conf
* hosts/h3.net/com.conf

合併成「var/com/config」這個檔。

### 複製「var/com/config」到「~/.ssh/config」

執行下面指令，複製「var/com/config」到「~/.ssh/config」

``` sh
$ make com-set
```

這裡預設的實做，是複製「var/com/config」到「~/.ssh/config」

你也可以修改「bin/com-set.sh」，利用「scp」，將「var/com/config」複製到遠端機器的「~/.ssh/config」

請執行「$ man [scp](http://manpages.ubuntu.com/manpages/xenial/en/man1/scp.1.html)」，來了解「scp」的用法。

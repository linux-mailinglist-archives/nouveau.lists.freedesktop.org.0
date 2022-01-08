Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9704B489BC3
	for <lists+nouveau@lfdr.de>; Mon, 10 Jan 2022 16:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7B610E73C;
	Mon, 10 Jan 2022 15:04:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95D710F722
 for <nouveau@lists.freedesktop.org>; Sat,  8 Jan 2022 00:22:40 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id k15so27963322edk.13
 for <nouveau@lists.freedesktop.org>; Fri, 07 Jan 2022 16:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:content-language:cc
 :subject:content-transfer-encoding;
 bh=ryAq/56Mc4XAZf5wpS9mph4++CHUWaS4XfqlQ7knIh4=;
 b=HGTsZbKccFu+364PuiRhe5PbeKejIaVbqakJ77LCVeDvAHxQI60Np9lG4ScK6VafEl
 FTTYuA3B9hRmEAd1iBLW5xjsif1EidjfxccmbtqXEJde5IYW6UClzAofgZyvlZwLonTE
 CiIKW6D6C6eKwe0PkEA/ryUzeGWfKSgh9q9kIc83o+5OFXIsU28eaiQq5CLRNFiQIyh/
 xR6J3sANAmRm25WcxBA12kpPMA8txwwU8fSlpw+uvGMWbQcaQhSrjcq+DSrY69MTnMjR
 YugE9Azx7ub1QEpjii46gWkK2ioIkHpc+cqKuZA8MvZZbAkpp11tHscIfwNT7Nyam+fe
 l09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :content-language:cc:subject:content-transfer-encoding;
 bh=ryAq/56Mc4XAZf5wpS9mph4++CHUWaS4XfqlQ7knIh4=;
 b=HIny4K97EWSfsU2bx1LbQN8+3/w558waVP0Ur8uf2CdV1KoJApd7IlasjfFKha6xxO
 qiUX8M8a0r70WkpJ9OwJuCBBwmffjfM2yz2y4FHtNKaDaaZoV/qEpzoQ7eTh6LSuXlZn
 OFjlG/DyKqwjbwSf0+YtqytNwxXw/olXaosL5KDSCSQCLgXekCyfGNETPhQBkHXv23yj
 y8e/di49O1cg8+n9L2WrrjFft++GHELUJcRVSOc4NLrZZRRDORlOcLoaJ5AXUZ3fuEqO
 6lgulyAp6alFahrhEZk/mqnuDzVWuvUCxZxQlgrrKCVRz6CUdg5DNyhjWQy8UgelcjSM
 aB1Q==
X-Gm-Message-State: AOAM5308PFyBBcqcmeh7fcRWXJJ/IDYvbZnVQG6jQgg/x+HTUxfpMMLz
 HklvbBonTLs5S+ATX3OGvVYHFrYg8yeyWw==
X-Google-Smtp-Source: ABdhPJy4IbxPGcOtJTTfhoS+TLpXJBSqNJmo6Hv6CMPJMuz/wFIW3mXse6wd6DIdokA+p3EQOCeB2Q==
X-Received: by 2002:a17:907:7f28:: with SMTP id
 qf40mr50987231ejc.565.1641601359407; 
 Fri, 07 Jan 2022 16:22:39 -0800 (PST)
Received: from [10.243.119.136] ([85.20.164.153])
 by smtp.googlemail.com with ESMTPSA id ds7sm47366ejc.50.2022.01.07.16.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 16:22:39 -0800 (PST)
Message-ID: <712f2647-3df4-87da-3f92-bfe15426553d@gmail.com>
Date: Sat, 8 Jan 2022 01:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Ilario Gelmetti <iochesonome@gmail.com>
To: nouveau@lists.freedesktop.org
Content-Language: es-ES
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jan 2022 15:04:53 +0000
Subject: [Nouveau] Piglit results for NV46 and glitches using GeForce 7500LE
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Dear all,
thanks for your work on Nouveau!!!
I have been a user, but I never touched the Nouveau code or testing
suite before.

I am building a desktop PC with some rather old hardware and a nVidia
GeForce 7500LE 64MB TC V/D/VO PN 88-1N01-0C-PB (NV46, G72) graphic card
(see lshw output here [1]).

I observed frequent glitches with some common user experiences:
* Ubuntu 21.10
* Ubuntu 18.04
* Debian 11 stable with GDM3+Gnome
* Debian 10 oldstable with GDM3+Gnome with errors in dmesg like this [2]
and glitches like these [3]
* Debian 10 oldstable with GDM3+XFCE with usually no errors in dmesg [4]
and glitches like these [5]. But sometimes runs smoothly

The situation improved replacing GDM3 by LightDM (why??), so now I have
these two setups where under normal operation I see no glitches (but
glitches appear after running piglit):
* Arch without DM and with XFCE
* Debian oldstable with LightDM and Gnome

So I run piglit with various combinations of software versions and
distros, and X crashed with some of these (the only responsive thing was
the moving-but-not-shapeshifting mouse arrow, like this [6]).

Here I detail the piglit tests and the results:

* Debian 10 oldstable (kernel 4.19) + LightDM + Gnome + piglit compiled
from source + libdrm2 (2.4.97) + libdrm-nouveau (2.4.97) +
xserver-xorg-core 1.20.4 + xserver-xorg-video-nouveau (1.0.16)

no glitches observed during normal operation
both piglit from Debian oldstable repository and piglit compiled from
source run to completion but at the end there are some glitches
at the screen, like this [7], or sometimes just a black screen or all
the windows as black rectangles.
Here you can find the result of the tests in these conditions: [8]

* Arch Linux + kernel (tested both 5.15.12 and 5.16.0-rc8 from linux-git
package) + nouveau (tested both 1.0.17 and 1.0.17.r2 from
xf86-video-nouveau-git package) + libdrm (tested both 2.4.109 and
2.4.109.r7 from libdrm-git package) + mesa (tested both 21.3.3 and
22.0.0_devel from mesa-git package) + XFCE

no glitches observed during normal operation
piglit-git (r11511.6c4da153b) makes X crash (or something similar, the
kernel seems not panicked as magic-sysrq work). This happens
reproducibly always after the getteximage-depth test (which itself
succeeds but the next one, any next one, gets stuck in the "running"
status) and very often also when the other "*getteximage*" or "*vertex*"
or "generatemipmap-base-change" or "arb_get_texture_sub_image" or
"texture with glblitframebuffer" or "fbo-finish-deleted" or
"ext_image_dma_buf_import_sample_argb8888" or
"depthstencil-render-mpilevels" or "readpixels-24_8" (I noticed that
when it does not make X crash it just results in dmesg-fail output,
maybe this happens also to the others, I didn't check) or "texsubimage"
or "draw-pixels".
The glitches caused by running piglit look like these [9].
When I manage to get out of the crashed X (using Alt+SysRq+R,E) I can
get some error messages from dmesg, like these [10].
And here are also some coredumps obtained via "coredumpctl dump" command
[11].
After many reboots and adding many exclusions to the tests list I gave
up trying to reach the end of the tests list, so here you have a couple
of incomplete lists with the results that got to actually run: [12]

Let me know if I can help.
Thanks for your help and for your precious work! :)
Ilario Gelmetti

[1]: https://uz.sns.it/~ilario/nouveau-nv46/lshw

[2]:
https://uz.sns.it/~ilario/nouveau-nv46/debian/dmesg/20220107-nouveau-gdm3-gnome

[3]:
https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220108_002132.jpg
https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220108_002140.jpg

[4]:
https://uz.sns.it/~ilario/nouveau-nv46/debian/dmesg/20220107-nouveau-gdm3-xfce

[5]:
https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220108_001511.jpg

[6]:
https://uz.sns.it/~ilario/nouveau-nv46/arch/glitches/IMG_20220104_130045.jpg

[7]:
https://uz.sns.it/~ilario/nouveau-nv46/debian/glitches/IMG_20220104_231136.jpg

[8]:
https://uz.sns.it/~ilario/nouveau-nv46/nv46-2022-01-05_1020-ilario.json.bz2

[9]: https://uz.sns.it/~ilario/nouveau-nv46/arch/glitches/

[10]: https://uz.sns.it/~ilario/nouveau-nv46/arch/dmesg/

[11]: https://uz.sns.it/~ilario/nouveau-nv46/arch/coredumps/

[12]:
https://uz.sns.it/~ilario/nouveau-nv46/arch/nv46-2022-01-06_1321-ilario-incomplete.tar.xz
https://uz.sns.it/~ilario/nouveau-nv46/arch/nv46-2022-01-07_2210-ilario-incomplete.tar.xz



-- 
Ilario
iochesonome@gmail.com
ilario@sindominio.net



Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7441B834C
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00466E125;
	Sat, 25 Apr 2020 02:51:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sun, 05 Apr 2020 10:53:36 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD6B6E1DE
 for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2020 10:53:35 +0000 (UTC)
Received: from oxbaltgw13.schlund.de ([172.19.246.19]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.99]) with ESMTPSA (Nemesis) id
 1N79Ey-1jFQep057s-017YQ9 for <nouveau@lists.freedesktop.org>; Sun, 05 Apr
 2020 12:48:31 +0200
Date: Sun, 5 Apr 2020 11:48:30 +0100 (BST)
From: Geoffrey Allott <geoffrey@allott.email>
To: nouveau@lists.freedesktop.org
Message-ID: <123831959.52748.1586083710760@email.ionos.co.uk>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev29
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:fl57HYfTq+QUeUGQfKpT7YzE22s58YZp5NMiMRhcTUV+PwE+d0H
 nXY5L/DYfCISL7s5jIWZ/Zxcp9bkpZmzmHthshr6aYXszuQ0xfJDFYd5kXkF8qwBT2/lfcc
 eiqB3r7bIw5rj7ppT9wzAnOgY7hRQtbOFtl5BvF87vrtQvaj57ov/NEQwmSDZAz0dGWmjWT
 +QWcazsb/lZ9PgF51LP5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ugZ/JCDhyw8=:E9hGRERfOUaWnJ8UFV9apJ
 5/x16c1q9I6hZs38JouPBpOz6shKgxV+okQtpsCVGs0vsYtohwvP5ch8gxJrUvWtR1Rey+ll+
 fMTqs2+GcFiS3IkBSmEJuPYDauGWahhwZnbFkv7SskGLqoSGulxdUaS3P0rjI/HiVNCX1edlL
 ayK7I2Ah3w1w1Bs9kIcAvYZzAWyrZwhNvmgASbPGjZn2UTINhzycFEkgk/bDShCAlV1LO7cb5
 srkMVke/0BeOMlXlsVFWcBxjUP+ovgFpHA9BEW4kvDD6LJMDfv/0Q0/E1tVXsqQZIpZkqWWp0
 8mMLEocotvoyt5B/oRnUvND8cWHn4/4DmjA0NsP3tdYbL8grmAJvAlHdam58U2VlivMzKPgSa
 aIbPIATtXx7+A0btlLxl6+ouEw2m6cofNaBHHkL3B24AuR2pFDyP1T81Y9S5mAeqIQ/RBtK7J
 CVqWb2hn1djzyoZ3YfX3csf0hvzWgljwx0Fs/OB2DBpCsisTrdS4b9k/rR6naeGCnS2LHPiho
 y1PFtJ/g1ZATukiLS28m6Lvk9gBQHwCi3yzYjdXrfJeZuTUIDgocF1Pn1YqMtkanGmEx8S9Cb
 0meW47jqh9kwE/ai9mi4+96hdX9hjWIEzd2BHoct2dcDU+xdRiVBnq2Z+1YoHAY6ApUfwJC+A
 zYL8ZbYzfNuZcdVywTXY+kdUXV408RONWAcfQfvWomwFnbgj8ClwBrfddlFg+ZOeUsQpNadcT
 0gllMxwe2EpvX2Wl71yJ8STZ0zhtdR8hApvvYrbP0uKe86U6RGWVRl3+BffK60Y5jG0DgeHbE
 bZk1Ty0N++820Tg5jtW3FFb5aXZa3/s5kpVbfhMxkDQnT8zWqyUhR0o406ATp4GPwIH3+vd
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:59 +0000
Subject: [Nouveau] Reproducable Crashes in Nouveau with GM204 [GeForce GTX
 980]
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
Reply-To: Geoffrey Allott <geoffrey@allott.email>
Content-Type: multipart/mixed; boundary="===============1871102133=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1871102133==
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div>
   Greetings, I hope this bug report is in the right place; the documentation at&nbsp;
   <a href="https://nouveau.freedesktop.org/wiki/Bugs/">https://nouveau.freedesktop.org/wiki/Bugs/</a>&nbsp;links to a defunct bugzilla page.
  </div>
  <div>
   <br>
  </div>
  <div>
   I'm running an NVIDIA Corporation GM204 &nbsp;[GeForce GTX 980] graphics card in an EVGA X99 classified motherboard, outputting over DisplayPort. I'm running Arch Linux with kernel&nbsp;5.5.13-arch2-1, and I'm using gnome under wayland (so no X server except for Xwayland).
  </div>
  <div>
   <br>
  </div>
  <div>
   When running OpenGL applications, the driver appears to crash very frequently. I've managed to reproduce the issue with the following script (epiphany is gnome web, based on webkit):
  </div>
  <div>
   <br>
  </div>
  <div>
   <div>
    #!/bin/sh
   </div>
   <br>
   <div>
    time=$(date +%F.%T)
   </div>
   <div>
    stdbuf -oL dmesg --color=always --follow &gt; dmesg.$time.log &amp; disown
   </div>
   <div>
    stdbuf -eL epiphany --private-instance https://webglsamples.org/aquarium/aquarium.html 2&gt;epiphany.$time.log &amp; disown
   </div>
   <br>
   <div>
    for i in $(seq 1 120); do
   </div>&nbsp; &nbsp; sleep 1
   <br>&nbsp; &nbsp; sync
   <div>
    done
   </div>
   <div>
    reboot
   </div>
   <div>
    <br>
   </div>
   <div>
    The visible effect of this is:
   </div>
   <div>
    * I see the web page open and fish swimming around the aquarium
   </div>
   <div>
    * After a couple of seconds one of a few things will happen:
   </div>
   <div>
    &nbsp; 1. The screen and mouse pointer completely freezes
   </div>
   <div>
    &nbsp; 2. The graphics will glitch out (partially, improperly rendered etc.)
   </div>
   <div>
    &nbsp; 3. Sometimes the web page will just go blank but I'll be able to move the mouse and close it
   </div>
   <div>
    * After this, there is about an 80% chance that my script will actually run the `reboot` command; the other 20% of the time I have to power off manually
    <br>
    <br>The errors I'm seeing in the dmesg log are various but here's a few of them:
    <br>*&nbsp;WARNING: CPU: 12 PID: 232 at drivers/gpu/drm/nouveau/nvif/vmm.c:68 nvif_vmm_put+0x6a/0x80 [nouveau]
    <br>*&nbsp;nouveau 0000:02:00.0: fifo: SCHED_ERROR 06 []
    <br>*&nbsp;nouveau 0000:02:00.0: fifo: runlist 0 update timeout
    <br>*&nbsp;nouveau 0000:02:00.0: gr: TRAP ch 3 [00fee57000 WebKitWebProces[1328]]
    <br>*&nbsp;nouveau 0000:02:00.0: gr: GPC0/PROP trap: 00000020 [RT_HEIGHT_OVERRUN] x = 336, y = 1176, format = 11, storage type = 0
    <br>
    <br>There is also an error that occurs /before/ I run my script at bootup which is
    <br>*&nbsp;nouveau 0000:02:00.0: bus: MMIO write of 80000136 FAULT at 10eb14 [ IBUS ]
    <br>
    <br>From epiphany I'm seeing errors like:
    <br>*&nbsp;Gdk-Message: 09:45:34.493: Error reading events from display: Connection reset by peer
    <br>*&nbsp;Gdk-Message: 09:53:08.281: Error flushing display: Broken pipe
    <br>*&nbsp;WebKitWebProcess: ../libdrm-2.4.100/nouveau/pushbuf.c:723: nouveau_pushbuf_data: Assertion `kref' failed.
    <br>*&nbsp;nouveau: kernel rejected pushbuf: Invalid argument
    <br>
    <br>I ran the script 10 times and I've uploaded the full logs here:&nbsp;
    <a href="https://easyupload.io/ieil63">https://easyupload.io/ieil63</a>
    <br>
    <br>Regards
    <br>Geoffrey Allott
   </div>
  </div> 
 </body>
</html>

--===============1871102133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1871102133==--

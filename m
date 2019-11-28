Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B510CFAE
	for <lists+nouveau@lfdr.de>; Thu, 28 Nov 2019 23:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785CA6E0E6;
	Thu, 28 Nov 2019 22:06:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Thu, 28 Nov 2019 22:06:38 UTC
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA26E0E6
 for <nouveau@lists.freedesktop.org>; Thu, 28 Nov 2019 22:06:38 +0000 (UTC)
Received: (wp-smtpd smtp.tlen.pl 19564 invoked from network);
 28 Nov 2019 22:59:55 +0100
Received: from 178235055163.warszawa.vectranet.pl (HELO alfa.kjonca)
 (kjonca@o2.pl@[178.235.55.163]) (envelope-sender <kjonca@o2.pl>)
 by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <nouveau@lists.freedesktop.org>; 28 Nov 2019 22:59:55 +0100
Received: from kjonca by alfa.kjonca with local (Exim 4.93-RC4)
 (envelope-from <kjonca@o2.pl>) id 1iaRpK-000uHZ-UQ
 for nouveau@lists.freedesktop.org; Thu, 28 Nov 2019 22:59:55 +0100
From: kjonca@o2.pl (Kamil =?iso-8859-2?Q?Jo=F1ca?=)
To: nouveau@lists.freedesktop.org
Date: Thu, 28 Nov 2019 22:59:54 +0100
Message-ID: <874kynr7ad.fsf@alfa.kjonca>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-WP-MailID: bceb934349f2989defb3cea9fbb29341
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000001 [UcIh]                               
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=o2.pl; s=1024a; 
 t=1574978395; bh=ZkUFK7wQzNTKPhvPFLrmEMuc7KsgwLmyLQy5vUUBDX8=;
 h=From:To:Subject;
 b=pJt2qUU3cOUQLgdMFQf51P9R283tGaNxfqMTVKdioNr0syoFzY/fYkrhy6H6L/Ldw
 rzxBymSrp/qrkGcX/ESnIkvJMKYYugog9AC+T5lBMZLwgKtQvJ6PB4cq+NhiJe2nRv
 Shwf/hednWD7tWXbVWvLITODYFjElPSpsQDK8PZE=
Subject: [Nouveau] [linux.debian.user] Bug - but where
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

--=-=-=
Content-Type: text/plain


(This is repost of message sent to debian-user list + some additional
data)

my hw:

--8<---------------cut here---------------start------------->8---
sudo inxi -GxxSM                                 
System:    Host: alfa Kernel: 5.3.11+1+kjonca x86_64 bits: 64 compiler: gcc v: 9.2.1 Desktop: FVWM 2.6.8 dm: XDM 
           Distro: Debian GNU/Linux bullseye/sid 
Machine:   Type: Desktop System: FUJITSU SIEMENS product: CELSIUS R640 v: N/A serial: YKTJ018045 Chassis: type: 6 
Graphics:  Device-1: NVIDIA G84 [GeForce 8600 GT] vendor: eVga.com. driver: nouveau v: kernel bus ID: 08:00.0 
           chip ID: 10de:0402 
           Display: server: X.org 1.20.4 driver: modesetting unloaded: fbdev,vesa tty: 315x76 
           Message: Advanced graphics data unavailable for root.
--8<---------------cut here---------------end--------------->8---
ebook-viewer is in calibre package.



--=-=-=
Content-Type: message/rfc822
Content-Disposition: inline

Path: news.kjonca!news.sunsite.dk!dotsrc.org!93.185.160.22.MISMATCH!news.uzoreto.com!aioe.org!bofh.it!news.nic.it!robomod
From: kjonca@poczta.onet.pl (Kamil =?iso-8859-2?Q?Jo=F1ca?=)
Newsgroups: linux.debian.user
Subject: Bug - but where
Date: Wed, 27 Nov 2019 19:40:01 +0100
Message-ID: <z7aoh-8v7-1@gated-at.bofh.it>
X-Mailbox-Line: From debian-user-request@lists.debian.org  Wed Nov 27 18:39:12 2019
Old-Return-Path: <kjonca@poczta.onet.pl>
X-Amavis-Spam-Status: No, score=-1.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
X-Policyd-Weight: NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .onet. - helo: .smtpo90.poczta.onet. - helo-domain: .onet.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.onet.pl;
	s=2011; t=1574878987;
	bh=YCcZbK2oXDIuLch5qbdxpaRIEXR7NQhQQSjC94jmjj0=;
	h=From:To:Subject:Date:From;
	b=g+/uh7F0yS4uIUyZVvsJszgCygQjKI9IvedVLVOSX6jya0O6gPJsCvrEgJgJiGvgt
	 30IOrfSOHtd1KgYsz2AyncVCyg3msyBikzmQhmUaKMGlvaDPzeSZiUTNJn8HSZsK2H
	 ZMfQJzLRH8+XH8ssgDhlV+tjlWAdnxEc+FdJXUJw=
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
X-Mailing-List: <debian-user@lists.debian.org> archive/latest/756658
List-ID: <debian-user.lists.debian.org>
List-URL: <https://lists.debian.org/debian-user/>
List-Archive: https://lists.debian.org/msgid-search/87eextuqk6.fsf@alfa.kjonca
Approved: robomod@news.nic.it
Lines: 45
Organization: linux.* mail to news gateway
Sender: robomod@news.nic.it
X-Original-Date: Wed, 27 Nov 2019 19:23:05 +0100
X-Original-Message-ID: <87eextuqk6.fsf@alfa.kjonca>
Xref: news.kjonca linux.debian.user:456104
MIME-Version: 1.0
Content-Type: text/plain


There is debian box with:
--8<---------------cut here---------------start------------->8---
08:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT] (rev a1)
--8<---------------cut here---------------end--------------->8---
in it.

I have feeling that graphic drivers have bug, but I am not sure:
My simple test:
ebook-viewer anthing.epub

after some page changes I got:
--8<---------------cut here---------------start------------->8---
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch10: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch10: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch10: buf 00000001 00000006 00000004 00000000 00000004
nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch10: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch10: buf 00000000 00000003 00000004 00000004 00000000
nouveau: ch10: buf 00000001 00000006 00000004 00000000 00000004
zsh: segmentation fault  ebook-viewer 
--8<---------------cut here---------------end--------------->8---

dmesg shows:
[245160.258576] nouveau 0000:08:00.0: Xorg[1264]: Unknown handle 0x0000001d
[245160.258596] nouveau 0000:08:00.0: Xorg[1264]: validate_init
[245160.258598] nouveau 0000:08:00.0: Xorg[1264]: validate: -2
[245162.486435] nouveau 0000:08:00.0: Xorg[1264]: Unknown handle 0x0000001d
[245162.486443] nouveau 0000:08:00.0: Xorg[1264]: validate_init
[245162.486446] nouveau 0000:08:00.0: Xorg[1264]: validate: -2
[245163.693374] Chrome_InProcGp[137021]: segfault at 8 ip 00007fe615c6bafc sp 00007fe5ceffc1e0 error 4 in libdrm_nouveau.so.2.0.0[7fe615c69000+4000]
[245163.693400] Code: b8 02 00 00 00 89 d1 41 56 41 55 49 89 fd 41 54 49 89 f4 55 89 d5 53 89 d3 48 83 ec 28 83 e5 01 4c 8b 37 4c 8b 7f 48 0f 45 e8 <8b> 7e 08 45 8b 46 18 89 e8 83 c8 04 f6 c2 02 0f 45 e8 c1 e9 09 83


The same actions on laptops wiht intel graphics are successful.

Any hints if this a bug in xserver-xorg-video-nouveau libdrm-nouveau2 or
kernel driver?
KJ

-- 
http://wolnelektury.pl/wesprzyj/teraz/
Hindsight is always 20:20.
		-- Billy Wilder

--=-=-=
Content-Type: text/plain



-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html

--=-=-=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--=-=-=--

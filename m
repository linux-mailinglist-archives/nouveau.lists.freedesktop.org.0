Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16929175168
	for <lists+nouveau@lfdr.de>; Mon,  2 Mar 2020 01:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6187E6E532;
	Mon,  2 Mar 2020 00:40:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74D6E239
 for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2020 00:40:33 +0000 (UTC)
Date: Mon, 02 Mar 2020 00:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1583109630;
 bh=4ovMht/+WpXL+2QHKrUZpvBjch4YOsqzPFgSbU6ZqcU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=iCznWGgQVC4wgiO7ZTbShOL4bvrcnHwK/xDvaTyoAnYCzq4mmUAUxpQHa29LnByVH
 EqXIQ6Q7/m4VC6FSTUTdTEbluRPS0ChcFpxKcRn64Muscgm5et1Pr23dGxW2JJav4P
 lVtvElTIKhZkwl1ijsE1m3V+aSKvg8OEMD3Htve4=
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Jasmin <jasmin.pm@protonmail.com>
Message-ID: <D-hdgPgWmiyZfEPUXCL_D132ZWmQVAopKtR2up1uwjNtaxsXUkRzrVNBTNLNM_tMLRaa_dv7s25AhRW5xRfSxhqJC39Ngw04rIbGoHnFRAI=@protonmail.com>
In-Reply-To: <CAKb7UviVqPZKuZ-Mj94FSDV=3+FDjEzk0RfENacMmU-3Nd2GqQ@mail.gmail.com>
References: <QoDOhTStpq2yEF5SaIbKoDh3i_nTSTVGy5rrV-8827WSM5NlVnXJ8pQ9HTvQnOL-XfnXry0duLHZgOyq2qD2Xg7RWqpswmIZ_O_wicapPrs=@protonmail.com>
 <CAKb7UviVqPZKuZ-Mj94FSDV=3+FDjEzk0RfENacMmU-3Nd2GqQ@mail.gmail.com>
Feedback-ID: eOnb-CJDef-r2IZSCQVb-awUggmxrRc24WBvUM783wmIQx3xZlGdOUrwWtJgVcTEa14_71KBhf8iFAJtuLOQDA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Subject: Re: [Nouveau] DP MST with GK107 and lenovo ultra dock
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
Reply-To: Jasmin <jasmin.pm@protonmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Ilia,

thanks for your reply.

> DP-MST support was first added to nouveau for precisely these kinds of
> setups. It does, generally, work, so that means there's something
> extra-special about your setup.

Yes... this is what it looks like.

Even the proprietary driver, which works after bootup, has its problems with the setup after multiple consecutive VT switches (e.g. after 8-12 times).
At some stage, the external displays do not switch on again. VT switches take > 30-60s in this case, and only the internal display (reverse PRIME) comes back/system is extremly slow then.
In this case, even a reboot does not help. The system needs to be powered off completely(!). Something "bad" stored in the video memory?
After turning it back on, everything is normal/stable again; even for several months uptime.

Perhaps this behavior of the dock in conjunction with the proprietary driver is somehow related to the displays not recognized at all when using nouveau...

> > Feb 28 23:07:11 laptop kernel: [ 13.746813] nouveau 0000:01:00.0: DRM: DCB conn 00: 01000046
>
> This is the DP connector.

The NVIDIA Doc mentions some bits for AUX I2C GPIO... which are not set here. But that is probably nothing unusual.

> I think it may be interesting to boot with
>
> drm.debug=0x1e nouveau.debug=i2c=trace,aux=trace,disp=trace

I have just made that trace:
https://pastebin.com/7GZLRY8F


Mar  1 21:30:59 laptop kernel: [   14.228427] nouveau 0000:01:00.0: disp: init running...
Mar  1 21:30:59 laptop kernel: [   14.228427] nouveau 0000:01:00.0: disp: one-time init running...
Mar  1 21:30:59 laptop kernel: [   14.228432] nouveau 0000:01:00.0: disp: outp 00:0006:0f48: type 06 loc 0 or 8 link 1 con 0 edid c bus 0 head f
Mar  1 21:30:59 laptop kernel: [   14.228435] nouveau 0000:01:00.0: disp: outp 00:0006:0f48: bios dp 40 13 00 00
Mar  1 21:30:59 laptop kernel: [   14.228437] nouveau 0000:01:00.0: disp: outp 01:0002:0f48: type 02 loc 0 or 8 link 1 con 0 edid 8 bus 0 head f
Mar  1 21:30:59 laptop kernel: [   14.228439] nouveau 0000:01:00.0: disp: conn ffffffff:00ff: type ff loc 0 hpd 00 dp 0 di 0 sr 0 lcdid 0
Mar  1 21:30:59 laptop kernel: [   14.228440] nouveau 0000:01:00.0: disp: conn ffffffff:00ff: type ff loc 0 hpd 00 dp 0 di 0 sr 0 lcdid 0
Mar  1 21:30:59 laptop kernel: [   14.228461] nouveau 0000:01:00.0: disp:   Head(s): 4 (0f)
Mar  1 21:30:59 laptop kernel: [   14.228462] nouveau 0000:01:00.0: disp: head-0: ctor
Mar  1 21:30:59 laptop kernel: [   14.228463] nouveau 0000:01:00.0: disp: head-1: ctor
Mar  1 21:30:59 laptop kernel: [   14.228463] nouveau 0000:01:00.0: disp: head-2: ctor
Mar  1 21:30:59 laptop kernel: [   14.228464] nouveau 0000:01:00.0: disp: head-3: ctor
Mar  1 21:30:59 laptop kernel: [   14.228468] nouveau 0000:01:00.0: disp:    DAC(s): 4 (02)
Mar  1 21:30:59 laptop kernel: [   14.228469] nouveau 0000:01:00.0: disp: DAC-1: ctor
Mar  1 21:30:59 laptop kernel: [   14.228473] nouveau 0000:01:00.0: disp:    SOR(s): 8 (0f)
Mar  1 21:30:59 laptop kernel: [   14.228473] nouveau 0000:01:00.0: disp: SOR-0: ctor
Mar  1 21:30:59 laptop kernel: [   14.228474] nouveau 0000:01:00.0: disp: SOR-1: ctor
Mar  1 21:30:59 laptop kernel: [   14.228474] nouveau 0000:01:00.0: disp: SOR-2: ctor
Mar  1 21:30:59 laptop kernel: [   14.228475] nouveau 0000:01:00.0: disp: SOR-3: ctor
Mar  1 21:30:59 laptop kernel: [   14.228522] nouveau 0000:01:00.0: disp: one-time init completed in 94us
Mar  1 21:30:59 laptop kernel: [   14.228526] nouveau 0000:01:00.0: disp: outp 00:0006:0f48: no heads (0 3 4)

"4 Heads" looks not-so-bad... but, at least when trying to configure it (e.g. with arandr/xrandr), there is only "one" display available on that port, which does not work.
I hope this is not a xorg.conf configuration-issue?
At least ddcutil shows "no display detected".

> Also, after everything boots up, can you look at what "grep .
> /sys/class/drm/-/status" produces?

Here is the output:

/sys/class/drm/card0-DP-1/status:disconnected
/sys/class/drm/card0-DP-2/status:disconnected
/sys/class/drm/card0-eDP-1/status:connected
/sys/class/drm/card0-HDMI-A-1/status:disconnected
/sys/class/drm/card0-HDMI-A-2/status:disconnected
/sys/class/drm/card0-VGA-1/status:disconnected
/sys/class/drm/card1-DVI-D-1/status:disconnected
/sys/class/drm/card1-eDP-2/status:connected

> I suspect figuring this out will require some amount of back and
> forth, and I'm not really the best person for display issues. Try
> #nouveau on irc.freenode.net on a week day.

OK... if the trace does not obviously (more or less ^^) show what the cause is, I will try that.

Best
Jasmin



_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

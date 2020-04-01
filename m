Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18419A2F8
	for <lists+nouveau@lfdr.de>; Wed,  1 Apr 2020 02:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364C26E8A8;
	Wed,  1 Apr 2020 00:37:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from eastern.birch.relay.mailchannels.net
 (eastern.birch.relay.mailchannels.net [23.83.209.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0076F6E8A8
 for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2020 00:37:11 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|joshua@azariah.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 15C0E3214CB
 for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2020 00:37:10 +0000 (UTC)
Received: from pdx1-sub0-mail-a14.g.dreamhost.com
 (100-96-7-10.trex.outbound.svc.cluster.local [100.96.7.10])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 469763211BC
 for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2020 00:37:09 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|joshua@azariah.com
Received: from pdx1-sub0-mail-a14.g.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.6); Wed, 01 Apr 2020 00:37:10 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|joshua@azariah.com
X-MailChannels-Auth-Id: dreamhost
X-Robust-Reign: 18564da74a73a525_1585701429732_2772820179
X-MC-Loop-Signature: 1585701429732:2582184137
X-MC-Ingress-Time: 1585701429732
Received: from pdx1-sub0-mail-a14.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a14.g.dreamhost.com (Postfix) with ESMTP id DCDF2A3B44
 for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2020 17:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=azariah.com; h=from:to
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:content-type; s=azariah.com; bh=C6YAx
 AiLtrTsFKVT+Tg5eXhXX2I=; b=fYOlskjii4dw31PnhWJu+g1dCEVkpelOUvIKu
 QH7GHOUqBPntEHJcLRuXpoZiefjMuMHZmJ3oBVjQaYhrpPaFi+pCipfbXZe5NDH+
 eFeKNjk6cEJwRiuihS9TUql8xEQGsTsJRsvhphIdWw0VQmTN5bYO6zT4UecEo3XA
 sLsBI8=
Received: from hosanna.localnet (216-67-98-32.static.acsalaska.net
 [216.67.98.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: joshua@azariah.com)
 by pdx1-sub0-mail-a14.g.dreamhost.com (Postfix) with ESMTPSA id 62667A3B42
 for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2020 17:37:08 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a14
From: "Joshua J. Kugler" <joshua@azariah.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 31 Mar 2020 16:37:07 -0800
Message-ID: <1867521.yYtKkQ1SVJ@hosanna>
Organization: Azariah Enterprises
X-Face: "i;
 .9?eoq[n1J]7NP093Nf-le\(f:apL[8Qcc^@FG*Lx!`q`1/iCg7oGU/gv&"yx=8K|o: 8e=hQB,0w,`~p}'#>'NF8L3xcI>;
 ?O-ABM#&^UN@Vh{4ktY],7O]OhEyW8tjIdHtN<G<q`
 Ha]]!@7D)vzKnV!!*{Y>`(&+f>TErbn'9J)'=2RU+3I_OdR)P_I/Bl+l@5)o5,KV}BKhi;
 DzH7ih^d}V6{2aa8qe&)\B}h; \Tje;
 [6E4K1Gu-M`>WM7-}cZ'&n(`nk.!coGBc<WTQO.# ?~JA)i#GH)W(jZRI<p]Il-NRMeEX+X/MTW8?T
In-Reply-To: <1724765.ZV22uHRcT5@hosanna>
References: <18822946.zTA3u1jjGg@hosanna> <1579051245.qf4Q62zFPI@hosanna>
 <1724765.ZV22uHRcT5@hosanna>
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 0
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtddtgdduieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkohgjfhgggfgtsehtufertddttddvnecuhfhrohhmpedflfhoshhhuhgrucflrdcumfhughhlvghrfdcuoehjohhshhhurgesrgiirghrihgrhhdrtghomheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpmhhithdrvgguuhdpfhhrvggvuggvshhkthhophdrohhrghenucfkphepvdduiedrieejrdelkedrfedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhppdhhvghlohephhhoshgrnhhnrgdrlhhotggrlhhnvghtpdhinhgvthepvdduiedrieejrdelkedrfedvpdhrvghtuhhrnhdqphgrthhhpedflfhoshhhuhgrucflrdcumfhughhlvghrfdcuoehjohhshhhurgesrgiirghrihgrhhdrtghomheqpdhmrghilhhfrhhomhepjhhoshhhuhgrsegriigrrhhirghhrdgtohhmpdhnrhgtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
Subject: Re: [Nouveau] Display broken after resume from suspend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Just curious if any of the recent fixes have addressed this. :)

j

On Tuesday, January 14, 2020 1:05:28 PM AKDT Joshua J. Kugler wrote:
> Another log, per Lyude on #nouveau.
> 
> j
> 
> On Tuesday, January 14, 2020 8:52:51 AM AKST Joshua J. Kugler wrote:
> > Here we go!
> > 
> > j
> > 
> > On Tuesday, January 14, 2020 7:08:20 AM AKST Ilia Mirkin wrote:
> > > Hi Joshua,
> > > 
> > > Not a fix for your issue, but Ben noticed this (and fixed it):
> > > 
> > > https://github.com/skeggsb/nouveau/commit/024bda7d2b0c3b0731433d60a494c7
> > > 8a
> > > b5 8cb216
> > > 
> > > which is what causes us to even try 540MB/s link training. However
> > > with this fix applied, it'll just give up faster. I'm told eDP is
> > > generally a single lane, and you're trying to get more than 270MB/s.
> > > So ... the question is ... why is it trying to do 10bpc. One likely
> > > reason is that the display_info.bpc == 0 for some reason (and we,
> > > rather questionably, default to 10bpc for bandwidth determination).
> > > There's no concrete theory as to what that reason might be, but it
> > > would explain what's going on.
> > > 
> > > After resuming into a bad state, can you grab the contents of
> > > /sys/class/drm/card0-eDP-1/edid (you'll have to cat it or something)?
> > > My hope is that it's somehow messed up.
> > > 
> > > Also, can you add "drm.debug=0x1e" to the boot cmd line, in addition
> > > to the bits you have already? Should provide some more info, perhaps
> > > some of it will even be relevant.
> > > 
> > > Thanks,
> > > 
> > >   -ilia
> > > 
> > > On Mon, Jan 13, 2020 at 6:48 PM Joshua J. Kugler <joshua@azariah.com>
> 
> wrote:
> > > > I've added debugging command-line parameters to the kernel command
> > > > line,
> > > > per skeggsb and imirkin on #nouveau.
> > > > 
> > > > root@joyful:~# cat /proc/cmdline
> > > > BOOT_IMAGE=/vmlinuz-5.3.0-26-generic root=/dev/mapper/vgubuntu-root ro
> > > > quiet splash log_buf_len=8M
> > > > nouveau.debug=disp=trace,bios=trace,i2c=trace
> > > > 3
> > > > 
> > > > On this particular run, closing the lid and then opening got me back
> > > > to
> > > > the
> > > > console, but then I tried running
> > > > 
> > > > echo mem > /sys/power/state
> > > > 
> > > > and it did not recover from that. That is, the laptop is awake, I can
> > > > ssh
> > > > in, screen back-light is on; black screen.
> > > > 
> > > > j
> > > > 
> > > > On Sunday, January 12, 2020 2:02:00 PM AKST Joshua J. Kugler wrote:
> > > > > Howdy! I've been doing a lot of troubleshooting, and haven't arrived
> > > > > at
> > > > > a
> > > > > solution yet.
> > > > > 
> > > > > Kernel log attached. VBIOS also attached.
> > > > > Ubuntu 19.10
> > > > > 
> > > > > $ uname -a
> > > > > Linux joyful 5.3.0-26-generic #28-Ubuntu SMP Wed Dec 18 05:37:46 UTC
> > > > > 2019
> > > > > x86_64 x86_64 x86_64 GNU/Linux
> > > > > $ dpkg -l|grep nouveau
> > > > > ii  libdrm-nouveau2:amd64                      2.4.99-1ubuntu1
> > > > > amd64        Userspace interface to nouveau-specific kernel DRM
> > > > > services
> > > > > --
> > > > > runtime
> > > > > ii  xserver-xorg-video-nouveau                 1:1.0.16-1
> > > > > amd64        X.Org X server -- Nouveau display driver
> > > > > $ lspci |grep VGA
> > > > > 01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS
> > > > > 3100M]
> > > > > (rev a2)
> > > > > 
> > > > > This is a Dell Latitude E6510, so not exactly bleeding edge. :)
> > > > > 
> > > > > The system boots just fine, and I can use the laptop without issue.
> > > > > Goes
> > > > > to
> > > > > sleep just fine. When I resume from sleep, the display is black, and
> > > > > will
> > > > > not come to life (the back light is on, though).  I can ssh in, and
> > > > > run
> > > > > all
> > > > > kinds of commands; restart the display manager does *not* bring it
> > > > > back
> > > > > to
> > > > > life.
> > > > > 
> > > > > Any tips would be greatly appreciated.
> > > > > 
> > > > > j
> > > > 
> > > > --
> > > > Joshua J. Kugler - Fairbanks, Alaska - joshua@azariah.com
> > > > Azariah Enterprises - Programming and Website Design
> > > > PGP Key: http://pgp.mit.edu/  ID
> > > > 0x68108cbb73b13b6a_______________________________________________
> > > > Nouveau
> > > > mailing list
> > > > Nouveau@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/nouveau


-- 
Joshua J. Kugler - Fairbanks, Alaska - joshua@azariah.com
Azariah Enterprises - Programming and Website Design
PGP Key: http://pgp.mit.edu/  ID 0x68108cbb73b13b6a


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

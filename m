Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFB1E92E9
	for <lists+nouveau@lfdr.de>; Sat, 30 May 2020 19:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C956E091;
	Sat, 30 May 2020 17:32:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A484E6E091
 for <nouveau@lists.freedesktop.org>; Sat, 30 May 2020 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590859954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1fUDRXVXbMWbtFQ+fM9X972f32lpNONh63/dks+4SvE=;
 b=V/FrxvCdZMDIrACFAGI9CFGzq2CeDu5DmHKkE+vAaMHfFol+LQfXHk7aDaD64xLhmNRaeN
 jciqsrlT3l6q938G3Rc8fC1gMrEvJCFtA7rHiRzpHd2zL5sXbadTsKchXngnixKeqXnWwZ
 sSxjruzsIZZU/zBzuO8ZoAvxsWAD5Uo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-tW13Y-vNMQ6A7tjYuUeIfw-1; Sat, 30 May 2020 13:32:28 -0400
X-MC-Unique: tW13Y-vNMQ6A7tjYuUeIfw-1
Received: by mail-qt1-f197.google.com with SMTP id 19so5956040qtp.8
 for <nouveau@lists.freedesktop.org>; Sat, 30 May 2020 10:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fUDRXVXbMWbtFQ+fM9X972f32lpNONh63/dks+4SvE=;
 b=TKDrTGljIRWoo7YM5DGDlUksj9A0y8wU6+ucC2eJ4rsZmL1g/pnLtIO5+zCfGAcW0A
 4XwzAhIHl36HggbdcGAWGul7LTEr7wFXkGMDDkHCQPVyR9CdBFJEPzNJkjESgALKnTVv
 kAf/LCMQKysnx3eUhXx57X7efRLsIOMENCXSJPW/Y6Y7YjPMMrQ9atQ/P47XOxMbDnng
 ceF5lfnXOpIKzds2T++Fc6VAgDjNPLpRFOnWvLn/RcBpsO8mJ+z/DFxB76uqKJ/oy4up
 rtX7OrS1ddbEppLHWECkuOQkBkhxwfrUPLJwucBMJ7sEE1ZPWsBS+CJVHuy7ANHXN8DE
 M1Bw==
X-Gm-Message-State: AOAM532K9xOSsWPjP9CWgfNB4mKX+hhpKQvrU0VMPRXvXSkzXfb0uBS3
 OVB8EzW1OQwhMMquz7fgz02r0fDoX14Wg21LYukEAKlrjAYFo+J6dCcOOZwAGSkZStnK+OAnvYr
 I9I9rbe6XUhHJNa36HUnUMSTmNcOxttRESVwLiEPi6A==
X-Received: by 2002:a37:a147:: with SMTP id k68mr13080088qke.62.1590859947799; 
 Sat, 30 May 2020 10:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrX50jzX6LdOVf7QKbCuZfjigYZSNDBuY8NIeHFPNdmgcXbjyHLQbc2Jh1wOqsUOdwm247ZIXCuPL5R/IMN7Q=
X-Received: by 2002:a37:a147:: with SMTP id k68mr13080064qke.62.1590859947439; 
 Sat, 30 May 2020 10:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200529180315.GA18804@merlins.org>
 <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
 <20200529194605.GB18804@merlins.org>
In-Reply-To: <20200529194605.GB18804@merlins.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 30 May 2020 19:32:16 +0200
Message-ID: <CACO55tsvY0t_z986VVoYCvxuBASdZ+rQcDtZ_dAtQR60NLmQQw@mail.gmail.com>
To: Marc MERLIN <marc_nouveau@merlins.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] 5.5 kernel: using nouveau or something else just long
 enough to turn off Quadro RTX 4000 Mobile for hybrid graphics?
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 9:48 PM Marc MERLIN <marc_nouveau@merlins.org> wrote:
>
> On Fri, May 29, 2020 at 02:53:51PM -0400, Ilia Mirkin wrote:
> > > moving to new window moves the mouse, but not windows get displayed.
> >
> > Do you see anything in dmesg after this is set up? I'd expect some
> > errors about timeouts or something else.
>
> Nothing other than what I pasted.
>
> > Which kernel are you using? There have been some turing-specific fixes recently.
>
> 5.5.11. I can put 5.6 if needed.
>

please do. 5.5 is EOL and 5.4 and 5.6 got the runpm fixes in recent releases.

> > Also note that TLP has a problem where it forces the audio
> > sub-function to always-on which prevents the GPU from suspending.
>
> Ah, thanks for that.
> I have
> #RUNTIME_PM_DRIVER_BLACKLIST="amdgpu mei_me nouveau nvidia pcieport radeon"
>
> sauron:~$ lspci |grep -i nvidia
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
> 01:00.1 Audio device: NVIDIA Corporation TU104 HD Audio Controller (rev a1)
> 01:00.2 USB controller: NVIDIA Corporation TU104 USB 3.1 Host Controller (rev a1)
> 01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU104 USB Type-C UCSI Controller (rev a1)
>
> So you're saying that I need to blacklist 01:00.1 and without that it hangs
> when suspending the powered off nvidia chip, which is what I'm experiencing
> as a hang when I unplug power?
>

no. It forces the audio device to be always on when on AC. there are
some sound power settings.

SOUND_POWER_SAVE_CONTROLLER=Y
SOUND_POWER_SAVE_ON_AC=1
SOUND_POWER_SAVE_ON_BAT=1

need to be set.

> Thanks,
> Marc
> --
> "A mouse is a device used to point at the xterm you want to type in" - A.S.R.
>
> Home page: http://marc.merlins.org/
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

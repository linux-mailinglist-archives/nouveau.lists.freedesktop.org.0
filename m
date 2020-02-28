Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95436173CDF
	for <lists+nouveau@lfdr.de>; Fri, 28 Feb 2020 17:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DDF6F47F;
	Fri, 28 Feb 2020 16:27:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35726F47E
 for <nouveau@lists.freedesktop.org>; Fri, 28 Feb 2020 16:27:32 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id w142so2284829vsw.9
 for <nouveau@lists.freedesktop.org>; Fri, 28 Feb 2020 08:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BylUTU3scqE7dMmVpBIk6mLmJIqQpeZbhNUyzAXCXBk=;
 b=Ccx1g9rg7irpn0FZEOOqfkPI8koMEYxZbTsFJKeOfe5uUftIj7HJvh6YRCYqNXMwdF
 Nx1HaU7y7oSfG9vl2gN61S156x1cLGawhxnC/m84p+XGiejfdlw5qqBfC8He9XN/Yjw5
 69HM8GdTMJuzAsdFgnC2kSAv/9LCZATeqYRoQUIKpTIcei0gXnTTqMiobPcucaIb0KFS
 OMQsPDIAMuhUoFiLco7DjjXK89Q66/SBUngdHp6VOba4/a+6xqmy/0H3UYL6hZ0NT7cE
 JEWXXjOV7c0NDK/UpSLJLMQqm7l63q7JHJ9eCtNzr3pgYz88Xlhd8FYGXbTFUlkF9kG9
 FgyQ==
X-Gm-Message-State: ANhLgQ0FxGebhhr7NBe1ohrhYCvsLlDGEYZIH2QfaCPYNB9qNWZUNs0K
 bP475jWh5HVMV44oTMzbA0GlpzKPUM/ZKGZjVaE=
X-Google-Smtp-Source: ADFU+vsaBinnQYFp+9u0+YpFDses/G/OfvrmwydxEtn+ACN9OcoO40vY2FOpvdSyUVfhJ+hj2Scj+wUAEViB+ZCinT4=
X-Received: by 2002:a67:f412:: with SMTP id p18mr3108186vsn.207.1582907251701; 
 Fri, 28 Feb 2020 08:27:31 -0800 (PST)
MIME-Version: 1.0
References: <105a5043-8cc0-43cd-42bf-a79cafbd2320@earthlink.net>
In-Reply-To: <105a5043-8cc0-43cd-42bf-a79cafbd2320@earthlink.net>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 28 Feb 2020 11:27:20 -0500
Message-ID: <CAKb7Uvg9RhCvRs+WU-0RdYc0SXMA-pXyppk5g7MF6b-MzPVUHg@mail.gmail.com>
To: Felix Miata <mrmazda@earthlink.net>
Subject: Re: [Nouveau] where to report modesetting DDX bug?
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

On Fri, Feb 28, 2020 at 11:06 AM Felix Miata <mrmazda@earthlink.net> wrote:
> Video and input drivers Subgroups and projects on gitlab does not list modesetting
> DDX, presumably because it's not packaged separately from the server. Where's the
> right place to report a modesetting DDX bug that manifests only on an NVidia GPU?
> Directly against the server https://gitlab.freedesktop.org/xorg/xserver?

I don't know if anyone (from nouveau) looks at gitlab, so mailing list
is probably best anyways.

>
> Here are some particulars:
> How can I tell whether this should be reported to kernel tracker or to freedesktop
> tracker as driver or server problem? HDMI output on GT218 10de:0a65 GPU is limited
> to 1920x1200. When connected to 2560x1440 display, vttys are supported at
> display's supported 1920x1080 mode, but X with modesetting DDX puts display in
> unsupported mode (functionally asleep) regardless of various attempts to force
> 1920x1080@60 or 1600x900@60, while with nouveau DDX, or 1920x1200 display, or
> 2560x1440 display with Dual-link DVI cable, display behavior is as expected.
>
> openSUSE 15.1/kernel 4.12.14    OK
> openSUSE 15.2/kernel 5.3.18     bad
> Tumbleweed/kernel 5.4.14        bad
> Debian Buster/kernel 4.19.x     OK
> Fedora 31/5.5.5 kernel          bad
>
> http://fm.no-ip.com/Tmp/Linux/Xorg/xorg.0.log-gt218-stw-modesetting-OOR-0x1e
> http://fm.no-ip.com/Tmp/Linux/Xorg/gt218-dmesg-stw.txt

Those HDMI mode clocks are too high against the nominal single-link
165MHz TMDS. You can set your own maximum with nouveau.hdmimhz=300
(for example) to allow it. I believe the connectors aren't rated for
that though. The commit which fixed this is

commit d1084184789d677df4e9c110f38cb3f3d709195d
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Wed May 29 09:58:18 2019 +1000

    drm/nouveau/kms: disallow dual-link harder if hdmi connection detected

and went into v5.3. I'm not sure where this got broken... I think it
would have been

commit 9340d77f5327ea673a7f95f58139123d7a278243
Author: Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Mon Sep 3 20:57:37 2018 -0400

    drm/nouveau/disp: take sink support into account for exposing 594mhz

which went into v4.20, but it could also have been

commit 1a0c96c075bb4517d4ce4fb6750ee0a3cf38714c
Author: Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Tue Nov 3 21:00:11 2015 -0500

    drm/nouveau/kms: allow 225/297MHz pixel clocks for HDMI on Fermi/Kepler

which went into v4.5 and lines up with your timeline better, but seems
like it shouldn't be handing out those high frequencies to HDMI
connectors on tesla...

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

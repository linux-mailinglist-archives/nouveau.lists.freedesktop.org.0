Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5FF289C91
	for <lists+nouveau@lfdr.de>; Sat, 10 Oct 2020 02:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D396EE59;
	Sat, 10 Oct 2020 00:03:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F936EE58
 for <nouveau@lists.freedesktop.org>; Sat, 10 Oct 2020 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602288177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LAHdT0YUcS3hlFVvV/a7Yb9xHClGFU2uZDMKfAvGGD8=;
 b=VBdTEi3t7V5RHDgUhEj7KAxABlsxC/2M0dWvAJ0J4YU1ZSIKncVWbKPAyphSXXMF82BsC/
 yAs5zRZZePP9a1AQ4cVNKMYKllRVfj2TtZU7r47DVRuEdEHk1zqQNeXyL9ZlSEhqYvwOMy
 N1ZiQ2tQeIebe5KYiqogFrCqlcFJD+M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-o2oIA1J1OhGv8IfrvtJH-g-1; Fri, 09 Oct 2020 20:02:53 -0400
X-MC-Unique: o2oIA1J1OhGv8IfrvtJH-g-1
Received: by mail-qv1-f71.google.com with SMTP id z12so7008343qvp.11
 for <nouveau@lists.freedesktop.org>; Fri, 09 Oct 2020 17:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LAHdT0YUcS3hlFVvV/a7Yb9xHClGFU2uZDMKfAvGGD8=;
 b=ReckOVGzYL6i0ct0OIpSkund1AzLJJnwL9C3FoClus8TSM7m3trAIPJVWti1+jn0gI
 1n7e9QT8/B1a+RJAzt3TzpS+ML87Lt0qhawhqhRDnWHEf3Nas4WRiMTlHxx3As80gY9I
 unokOoF+CvbVpD5TVOA1M4j8suzvS3gMadOSkbfmPVlA4KDySPvNL7262lq2Lc9Ah0rg
 S6htiLKqogPbAw9rp5oEoWjWpFi3rb2AVp6zBNzUp7RxVB1gcTuTcrIMkpxgSQ8wudn7
 khCrUHUZOvSWiudzqS0PRrzwg3clfzi0brSYDue/qfFM8NBjCu5QBfXMTYFkJAAG6IhM
 SsHw==
X-Gm-Message-State: AOAM533WT11haydWib99bxfNwWMFGGQAiVFTn6PE/JSM6zIWjHXe9OYV
 a//DYggW6hk5tacNX+7h+OGJUo/wWImiEFhLkOrkopkSbWUv5RUa/W4upz7kscfmCwMDDX1RH9a
 74ddzoCME6m9FOWZw0iQO+bcdF+PrYV1RcVaG209UtA==
X-Received: by 2002:ac8:544f:: with SMTP id d15mr550614qtq.378.1602288173371; 
 Fri, 09 Oct 2020 17:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTAsjduoXcqRRrUIMh+vSvUOH3iyoH4osH0nD+5G7WvhBO6AKdfe+6mxpDH02m/3KuNfgu9lpqZxcgAWuY2Ao=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr550593qtq.378.1602288173091; 
 Fri, 09 Oct 2020 17:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <202010092326.20482.linux@zary.sk>
 <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
 <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
In-Reply-To: <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 10 Oct 2020 02:02:42 +0200
Message-ID: <CACO55tuAxbcXbC9zrT5rs34s=5uBugkbcikORU5868ka9bHdkw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ondrej Zary <linux@zary.sk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Oct 10, 2020 at 12:23 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Fri, Oct 9, 2020 at 5:54 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
> > >
> > > Hello,
> > > I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> > > [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> > > ...
> > > [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> > > [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
> > >
> > > big-endian? WTF? The machine is x86.
> > >
> >
> > mhh, we reworked the endianess checks a bit and apparently that broke
> > something... I will give it some thoughts, but could you be so kind
> > and create an mmiotrace under 5.9 with nouveau? You won't need to
> > start X or anything while doing it. Just enable the trace and modprobe
> > nouveau and collect the trace.
>
> Looks like nvkm_device_endianness unconditionally reads out 0x4. I
> don't think that reg is there pre-NV11. At least NV4, NV5, NV10 and
> maybe NV15 (which is logically pre-NV11) don't support big-endian
> mode. Not sure about NV1A, which was the IGP of the series and IIRC
> logically pre-NV11 as well (but clearly could only be used with x86
> chips, since it was part of the motherboard).
>
> Aha, it's documented in rnndb:
>
> https://github.com/envytools/envytools/blob/master/rnndb/bus/pmc.xml
> <reg32 offset="0x004" name="ENDIAN" variants="NV1A-"/>
>

ohh, I should have checked there.. yeah, will write a fix for it then.
Before my patch we just always tried to switch it, but never threw an
error.

>   -ilia
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

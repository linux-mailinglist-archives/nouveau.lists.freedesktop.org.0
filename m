Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F9222E70
	for <lists+nouveau@lfdr.de>; Fri, 17 Jul 2020 00:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1324F6ED04;
	Thu, 16 Jul 2020 22:10:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822016ED04
 for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2020 22:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594937453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TEVgJ4JhQjZ31sqNGbZ6d8ZiBPexCKDIqhrWk+8SyBo=;
 b=PLq4+6J+DzIJulxUhDt+mIA57vFuwssZHbY7er8/Us9s0nnVf3G0l9nG8lXyjiUzMVvUmI
 9VdM2a2tLOHQM17vdzgU+KkADBHM5NtM/Q+VOfc33tLlmqhwwdA3a2gWX8VKt/Y9bl/RgZ
 PSU3/QvHI0bFyNRR8FgTjUfOqG/ckrA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-ySytuShsMPKfWq-zY-CdNw-1; Thu, 16 Jul 2020 18:10:51 -0400
X-MC-Unique: ySytuShsMPKfWq-zY-CdNw-1
Received: by mail-qv1-f71.google.com with SMTP id k3so4331745qvm.11
 for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2020 15:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TEVgJ4JhQjZ31sqNGbZ6d8ZiBPexCKDIqhrWk+8SyBo=;
 b=nRrU4/5m3z9Oi3PyhIw77B+Ju/lZe2TXgRv0W6CCe/V95KngGJ0cePiND7Z9uG3sxg
 0mt/5VgzY+UWSI6D6ydmKUu6soHEGD62sLRvJxGAcPQ3MxrD3AudUCoVlZll9FE4m4YC
 Uutl6EN1WXCYIk5IQHHi89J6zG7qSuSknY3vc3lql23CvyteUJ8h6tIKuANGCugTb3c5
 fotPj8kYWd2XmNs+J24R82f+KZWN6Qlq8FJxG6iSqoGvDs4TNtpBNseET4J4iS3CnsrL
 OuHI4SS0FJ34mnqwx8HC9QL4UoxytkF5wOMhcZH2CfjCjjnvSbxGPtLpgrcCapxE4jRD
 SywQ==
X-Gm-Message-State: AOAM532BPDLr7Jj1N6N9lYChOnt3wlAFKO6dOJ6is2r44/DHE5R+PbOn
 NEphbJlbaoUvMjjrbIFlbtSlYwkxFcqiDzM+mf15Qs9yV7Nbx3Wdbp9zH+nEnEyx8VKmfe8mDOI
 HrdnFnEWGD6VPXJOkR6as3xOlZKrkPat0Fh3jEtcXiw==
X-Received: by 2002:a37:6d4:: with SMTP id 203mr6191550qkg.62.1594937451032;
 Thu, 16 Jul 2020 15:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxYEeBzIs2bCnV423qUOLrPEFFdlKIbzBy5X5m3dvPlokO3/fmqeYPShXYfvK7oHLdpmv1M7E/0JgXl4Q6rQ4=
X-Received: by 2002:a37:6d4:: with SMTP id 203mr6191519qkg.62.1594937450726;
 Thu, 16 Jul 2020 15:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tsAEa5GXw5oeJPG=mcn+qxNvspXreJYWDJGZBy5v82JDA@mail.gmail.com>
In-Reply-To: <CACO55tsAEa5GXw5oeJPG=mcn+qxNvspXreJYWDJGZBy5v82JDA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Jul 2020 00:10:39 +0200
Message-ID: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
To: Linux PCI <linux-pci@vger.kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] nouveau regression with 5.7 caused by "PCI/PM: Assume
 ports without DLL Link Active train links in 100 ms"
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> Hi everybody,
>
> with the mentioned commit Nouveau isn't able to load firmware onto the
> GPU on one of my systems here. Even though the issue doesn't always
> happen I am quite confident this is the commit breaking it.
>
> I am still digging into the issue and trying to figure out what
> exactly breaks, but it shows up in different ways. Either we are not
> able to boot the engines on the GPU or the GPU becomes unresponsive.
> Btw, this is also a system where our runtime power management issue
> shows up, so maybe there is indeed something funky with the bridge
> controller.
>
> Just pinging you in case you have an idea on how this could break Nouveau
>
> most of the times it shows up like this:
> nouveau 0000:01:00.0: acr: AHESASC binary failed
>
> Sometimes it works at boot and fails at runtime resuming with random
> faults. So I will be investigating a bit more, but yeah... I am super
> sure the commit triggered this issue, no idea if it actually causes
> it.
>

so yeah.. I reverted that locally and never ran into issues again.
Still valid on latest 5.7. So can we get this reverted or properly
fixed? This breaks runtime pm for us on at least some hardware.

> git bisect log (had to do a second bisect, that's why the first bad
> and good commits appear a bit random):
>
> git bisect start
> # bad: [a92b984a110863b42a3abf32e3f049b02b19e350] clk: samsung:
> exynos5433: Add IGNORE_UNUSED flag to sclk_i2s1
> git bisect bad a92b984a110863b42a3abf32e3f049b02b19e350
> # good: [4da858c086433cd012c0bb16b5921f6fafe3f803] Merge branch
> 'linux-5.7' of git://github.com/skeggsb/linux into drm-fixes
> git bisect good 4da858c086433cd012c0bb16b5921f6fafe3f803
> # good: [d5dfe4f1b44ed532653c2335267ad9599c8a698e] Merge tag
> 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> git bisect good d5dfe4f1b44ed532653c2335267ad9599c8a698e
> # good: [b24e451cfb8c33ef5b8b4a80e232706b089914fb] ipv6: fix
> IPV6_ADDRFORM operation logic
> git bisect good b24e451cfb8c33ef5b8b4a80e232706b089914fb
> # good: [d843ffbce812742986293f974d55ba404e91872f] nvmet: fix memory
> leak when removing namespaces and controllers concurrently
> git bisect good d843ffbce812742986293f974d55ba404e91872f
> # good: [be66f10a60e3ec0b589898f78a428bcb34095730] staging: wfx: fix
> output of rx_stats on big endian hosts
> git bisect good be66f10a60e3ec0b589898f78a428bcb34095730
> # good: [a4482984c41f5cc1d217aa189fe51bbbc0500f98] s390/qdio:
> consistently restore the IRQ handler
> git bisect good a4482984c41f5cc1d217aa189fe51bbbc0500f98
> # good: [bec32a54a4de62b46466f4da1beb9ddd42db81b8] f2fs: fix potential
> use-after-free issue
> git bisect good bec32a54a4de62b46466f4da1beb9ddd42db81b8
> # bad: [044aaaa8b1b15adb397ce423a6d97920a46b3893] habanalabs: increase
> timeout during reset
> git bisect bad 044aaaa8b1b15adb397ce423a6d97920a46b3893
> # good: [6fe8ed270763a6a2e350bf37eee0f3857482ed48] arm64: dts: qcom:
> db820c: Fix invalid pm8994 supplies
> git bisect good 6fe8ed270763a6a2e350bf37eee0f3857482ed48
> # good: [363e8bfc96b4e9d9e0a885408cecaf23df468523] tty: n_gsm: Fix
> waking up upper tty layer when room available
> git bisect good 363e8bfc96b4e9d9e0a885408cecaf23df468523
> # bad: [afaff825e3a436f9d1e3986530133b1c91b54cd1] PCI/PM: Assume ports
> without DLL Link Active train links in 100 ms
> git bisect bad afaff825e3a436f9d1e3986530133b1c91b54cd1
> # good: [be0ed15d88c65de0e28ff37a3b242e65a782fd98] HID: Add quirks for
> Trust Panora Graphic Tablet
> git bisect good be0ed15d88c65de0e28ff37a3b242e65a782fd98
> # first bad commit: [afaff825e3a436f9d1e3986530133b1c91b54cd1] PCI/PM:
> Assume ports without DLL Link Active train links in 100 ms

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

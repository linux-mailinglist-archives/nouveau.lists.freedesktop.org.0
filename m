Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82046C1CD
	for <lists+nouveau@lfdr.de>; Tue,  7 Dec 2021 18:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E25EAA15D;
	Tue,  7 Dec 2021 17:32:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACF2AA15D
 for <nouveau@lists.freedesktop.org>; Tue,  7 Dec 2021 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638898339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Y9Pjga21aracwhJoyyvYrk6Lt9GN/KkUwQElqefsrU=;
 b=d9xjfdOf8IHDCo8xNS6P4crWOD6JZKwaG0kzbfIuA+vnTfbuAznepk7bLRgkjqQAgybc2U
 Uc7s2UNT7mpTXwShzhYc7GVYiemPjLkf4m2YotsQ1mXI6ZKU4S3z1CNcPd6CH1kuUNt0YY
 FVCNEabAASpjhdKcjkvD3SZTXqqSCE4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-tzN9AgMuMfGOwP4FIoG-iQ-1; Tue, 07 Dec 2021 12:32:18 -0500
X-MC-Unique: tzN9AgMuMfGOwP4FIoG-iQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so1668591wms.6
 for <nouveau@lists.freedesktop.org>; Tue, 07 Dec 2021 09:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Y9Pjga21aracwhJoyyvYrk6Lt9GN/KkUwQElqefsrU=;
 b=vj7SDaE/HcLKLOr9tr1tY272xcHKUWT0Mgl/EUTe1FcEiK+EdCGVdgd+AgyWoZe5Wm
 vTV/lXH8EJA21rzsVk+FmkiEsvEJwrRu/x0nOtULQofPyA1K9Cm/EQu3gMCyapyCDJn0
 KNEPvdo3sN21L6wBrR1RsPRTHGv2Zevuznog2DbUD91HNESKk1QNKx+K40cZTahT+d09
 NzoICz474qJzDwjIKD2dXwDScD1GWbGnCj1xoLxinrjghjFWljqErmzlLgem2CedYip+
 7OVpRhdyc3rtqRxG6JR4yef3c/lQzWvotawxC3Zf4UEW9LFqWeN7PdonpcfOvQwsPKHU
 Vi+w==
X-Gm-Message-State: AOAM5300dYoC6f70+mf08laNqKAToHRDbJGKSzODtSdDBBLc6hBNx+vv
 A8TL8ugi4/lRGfiIjrbe1LXjZGdnMZ13MrgpYtk4qR6RZaq7lgznhMVZDO7XfvF5B14tw2zyraY
 QxwOfR+sc0udnWuyXcX//UJ6zc0kn9q4akdlHRu30KQ==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr52950477wrb.42.1638898337278;
 Tue, 07 Dec 2021 09:32:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS4WAmTgmumrIvWu+yX9HvqjuLp/srHLtI+V5J5dSkPaRSMHjOSblueIsPVT3q2xJTau7CrGgKuwVb0YRj6pc=
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr52950450wrb.42.1638898337097;
 Tue, 07 Dec 2021 09:32:17 -0800 (PST)
MIME-Version: 1.0
References: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
 <20211206183721.6495-1-dmoulding@me.com>
 <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
In-Reply-To: <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 7 Dec 2021 18:32:06 +0100
Message-ID: <CACO55tuw2pwqUnknvZmSiuEaMcjArsgzLy9NYBqZPE6f9zPXsA@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
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
Cc: regressions@lists.linux.dev, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dan Moulding <dmoulding@me.com>,
 regressions@leemhuis.info, Ben Skeggs <bskeggs@redhat.com>, sf@sfritsch.de
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 7, 2021 at 10:52 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 06.12.21 um 19:37 schrieb Dan Moulding:
> > On 04.12.21 17:40, Stefan Fritsch wrote:
> >> Hi,
> >>
> >> when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce
> >> GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland=
),
> >> there is a regression: There is now some annoying black flickering in
> >> some applications, for example thunderbird, firefox, or mpv. It mostly
> >> happens when scrolling or when playing video. Only the window of the
> >> application flickers, not the whole screen. But the flickering is not
> >> limited to the scrolled area: for example in firefox the url and
> >> bookmark bars flicker, too, not only the web site. I have bisected the
> >> issue to this commit:
> >>
> >> commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)
> > I have been experiencing this same issue since switching to 5.15. I
> > can confirm that reverting the above mentioned commit fixes the issue
> > for me. I'm on GP104 hardware (GeForce GTX 1070), also running KDE
> > Plasma on X.
>
> I'm still scratching my head what's going wrong here.
>
> Either we trigger some performance problem because we now wait twice for
> submissions or nouveau is doing something very nasty and not syncing
> it's memory accesses correctly.
>
> Attached is an only compile tested patch which might mitigate the first
> problem.
>
> But if it's the second then nouveau has a really nasty design issue here
> and somebody with more background on that driver design needs to take a
> look.
>

Ben mentioned a few times that fences might be busted but we all have
no idea what's actually wrong. So it might be that your change is
indeed triggering something which was always broken or something else.

> Please test if that patch changes anything.
>
> Thanks,
> Christian.
>
> >
> > Cheers,
> >
> > -- Dan
>


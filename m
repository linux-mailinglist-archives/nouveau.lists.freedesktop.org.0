Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE024570E0
	for <lists+nouveau@lfdr.de>; Fri, 19 Nov 2021 15:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0F06E194;
	Fri, 19 Nov 2021 14:39:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BD36E194
 for <nouveau@lists.freedesktop.org>; Fri, 19 Nov 2021 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637332754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPVAyMjSb/gSfj+6d4BZw3+mYUBoOnUapoYcaEraNcA=;
 b=hNRZ3eoEkMUcw+nOUT3IRcMhZxwXRQAPYi+r/RUOtE38qGlWKzfUPc29HhBPSbTTMXGu/5
 opQ58N8ex4ZSLJMKVdF2X2xeJggCZNx5bbZMipOe4jhlYXW1JiiBtBDycDpgDTr3NnlBed
 eekf+VKNPYtin0u0mP/7jM1uEkhCw2M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-476-2sDfwiQdOOmjl7PDtYcWwA-1; Fri, 19 Nov 2021 09:39:12 -0500
X-MC-Unique: 2sDfwiQdOOmjl7PDtYcWwA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so1808283wro.19
 for <nouveau@lists.freedesktop.org>; Fri, 19 Nov 2021 06:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KPVAyMjSb/gSfj+6d4BZw3+mYUBoOnUapoYcaEraNcA=;
 b=m9w28N/QAA1QLWOAkitgwcC2nyLrIa8aWZqNariy1wfdpDqpyK/Dq/2j7yJ0BnQkxn
 zDvDDpaW6mCPqOSvZoh2QylYA1Ri8Gtgt26YVSraUHC5cZOmoVPzj4MCY9/pASuhRSt3
 3rzxd2T3bJPlSOBKrp4HDwGNAYYLBCHwpuVzpLe2josy2fyOMCREkJBhUWr1XQTf2G5H
 BtwgAzldo/zBvZXp4hpGZ18XsV+52xd22lxcNv8sZqelVH56XzBA6F2a+h2MZuv/2SpM
 kRzJwsPcbXPD8DhxfkIVPNCU+rq3+Uh//i+s3MjPEWgl9OEt2VRtDrp9nJmdp+nkRwk1
 B9Qg==
X-Gm-Message-State: AOAM532rFgnAhYWLBp6s9Ss1cGZdUcgPu81LWZAk7XF1vm2DlM2kPRM8
 UZGjuohPvxZVIElsRe7Ef1iIBiwSmSIQ5PZc5TYP3ipM578mINYNc8BX7W3gAGH4ZmgztVF88yd
 /8APQT6Ozd/xJkA7AQF5ffHaQ9Edrzz9uOb5HNAP0Aw==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr177663wmi.108.1637332751671;
 Fri, 19 Nov 2021 06:39:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMCPD6zuoDj64o2bHPErJ/MtegllB1fynfyrNwPIhkloNW30yhjiz3Q2IkpNk26/qY4E4Nu4bdVxfVmxfBC98=
X-Received: by 2002:a7b:c207:: with SMTP id x7mr177621wmi.108.1637332751371;
 Fri, 19 Nov 2021 06:39:11 -0800 (PST)
MIME-Version: 1.0
References: <19065a66-ce89-b9b9-d534-eb2cabff7825@urv.cat>
 <CACO55tuWxXJoWJk-V11f-bb+6akfjBYiG8L0RoCZfRiceo9N5Q@mail.gmail.com>
 <3f418b50-e731-ff71-dc93-b065f9be8389@urv.cat>
 <CACO55tsqBSSzyeyJbS-81rO4=JXtdJxz_vOHoc-f7rvVwZdLog@mail.gmail.com>
 <f7a8c82c-2fa3-60ed-40e4-ccde4a96b8c6@urv.cat>
In-Reply-To: <f7a8c82c-2fa3-60ed-40e4-ccde4a96b8c6@urv.cat>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Nov 2021 15:39:00 +0100
Message-ID: <CACO55tuoWJbx0wqcGypocQm78sLrp6DoS+o2nGE4mVQAidNFGg@mail.gmail.com>
To: dmanye <dmanye@urv.cat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [INVALID_ARG] mthd 0414
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 2:00 PM dmanye <dmanye@urv.cat> wrote:
>
> On 19/11/21 13:31, Karol Herbst wrote:
> > yeah.. not quite sure yet. I tried it out with my gk208b gpus, but
> > couldn't hit anything. Maybe using VGA makes the difference here. Or
> > something else is different. Might also already be fixed in 5.16...
> > too many unknowns still. I will do another round of testing with VGA
> > and see how that ends.
>
> hello again,
>
> thanks for your effort Karol. i've just found another time the bug and:
>
> 1) kept the vga cable in the same place.
>
> 2) connected a dvi cable between the same computer and the same monitor.
>
> 3) told xrandr to dup the signal through the dvi cable:
>
> DISPLAY=3D:0.0 xrandr --output DVI-D-1 --mode "1920x1080" --same-as VGA-1
>
> 4) voil=C3=A0! the monitor, all alone, switched to dvi input and there is=
 my
> x session up and running.
>
> 5) if i force the monitor to change to vga input it refuses it and
> returns to dvi
>
> so i think the driver does its job but without actually sending anything
> through the vga cable.
>

yeah.. not quite sure yet what's going on here. Maybe the cable are
just a bit broken, or.... other signals interfering or whatever. Maybe
a driver bug. VGA being an analog signal and stuff makes it a bit
painful to tell what's wrong. If dmesg is clean, then no idea how to
dig into this even. I couldn't reproduce it with my Fedora system
running the latest 5.10 kernel either with VGA.

Could also be the displays being weird...

Anyway, if using DVI is an option for you I highly recommend using
that. But I'd also like to figure out what's wrong here.

What I think could help is to enable drm debugging once you hit the
error. For that you can write "0x1ff" into
/sys/module/drm/paramters/debug as root, restart X, change the
resolution via xrandr to force X to set a new mode on the connector
and pastebin the output of dmesg somewhere. Maybe that helps, maybe
not. Let's see what information that gives us.

>
> thanks.
>
>


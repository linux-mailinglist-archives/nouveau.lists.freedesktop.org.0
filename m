Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE8455F22
	for <lists+nouveau@lfdr.de>; Thu, 18 Nov 2021 16:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD7D6ECA6;
	Thu, 18 Nov 2021 15:14:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED6E6ECAB
 for <nouveau@lists.freedesktop.org>; Thu, 18 Nov 2021 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637248441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=imKBJBnWqulcXaGNXhXaIzfjZs6tVfFFxQOYZMmHlio=;
 b=fsnwNyr26az3iSRO4/8FhGOkbUJ9E9hMjAQ/W+uWwGATtVPzsdrg3srimMQoYXOHNouByD
 s8IOqGpD2Jao9AeWvxMZXsnBz0sA20eLJZBO4abq8MzkVZDX0uazRPhMPfF9TDMAKHQjvc
 lS/jkKV1M7frNGBhIo55LZsROPasV2k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-KI1YMgP7Pfqrl7HDobdPaw-1; Thu, 18 Nov 2021 10:13:59 -0500
X-MC-Unique: KI1YMgP7Pfqrl7HDobdPaw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so1158306wrd.1
 for <nouveau@lists.freedesktop.org>; Thu, 18 Nov 2021 07:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imKBJBnWqulcXaGNXhXaIzfjZs6tVfFFxQOYZMmHlio=;
 b=fqGwCBBXVqsiwr2RSkhBdBBMxE++QOXdtOU0vjqngDwPBKa6rLRP2uJcCr1ZIOI9WQ
 oifycrkS91zyi1ivQ9wedChn7r5TWEud7416+Q/7Gm81cyMBQT83Ur1OTbCCcwZNG09t
 Z3xOD1MockkdJhAGSoXA1IV3XIQ+jzVwUFoGYzuyVx/RrniQAXp2x10I5yhg7hdWmzJ/
 E/MZ1tp+8p/Kim81+/HtAwcT3I1ZhcN+LPBSPd/v3IWMEX+epoeRMJYZ2C1PjVP+dgc9
 VaF38nzPachzfloflAfGallp1p4KMksNM4Khn0Eku+jfmN22nsW4YkQBMD1fBiULhstv
 JRwQ==
X-Gm-Message-State: AOAM530bfrvcvf2I1P0xxuhH5bNNq+5BInVUp8bDWhdrC2hdJNE+5tZ7
 yzUR3dQlGkpo40UO/umf5v4pqAvx2EUEC8UThLOvE4YVYcZLCoO+8oe7MxjmmzgXAxzQEtqRYxf
 j0pvUWkovUTbr8rIh1T/Ee8xPHt1n805trdRZONZqAg==
X-Received: by 2002:adf:e484:: with SMTP id i4mr31761692wrm.49.1637248438330; 
 Thu, 18 Nov 2021 07:13:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+C2m3jCFu+7BKlfD+zjB3J/CJcadePZ7N6fogG3nZU+QvSiZdGjpnZj1leOyCqCUQXMgukaibfuMVaSB+S4Y=
X-Received: by 2002:adf:e484:: with SMTP id i4mr31761667wrm.49.1637248438181; 
 Thu, 18 Nov 2021 07:13:58 -0800 (PST)
MIME-Version: 1.0
References: <19065a66-ce89-b9b9-d534-eb2cabff7825@urv.cat>
In-Reply-To: <19065a66-ce89-b9b9-d534-eb2cabff7825@urv.cat>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 18 Nov 2021 16:13:47 +0100
Message-ID: <CACO55tuWxXJoWJk-V11f-bb+6akfjBYiG8L0RoCZfRiceo9N5Q@mail.gmail.com>
To: dmanye <dmanye@urv.cat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Nov 18, 2021 at 2:59 PM dmanye <dmanye@urv.cat> wrote:
>
> hello,
>
> i have a problem and i think that it is in the nouveau driver. i hope
> you can help me...
>
> i have 20 identical computers with debian bullseye (11) installed (only
> "official" debian packages). sometimes some of them boot but the screen
> is remains in black. if i connect remotely i can see that the X session
> starts as expected (i have set a lightdm autologin). restarting lightdm
> does not help, but rebooting the computer solves the problem but it
> reappears here and there (when i boot all the computers, between 0 and 2
> usually get the black screen).
>

What kind of connector are you using? I have a gk208B GPU here so I
could see if I hit this bug if I just reboot often enough on 5.10

> i've noticed that this three lines appear always in dmesg when it fails:
>
> [    4.090415] nouveau 0000:07:00.0: disp: chid 0 stat 00004414 reason 4
> [INVALID_ARG] mthd 0414 data 00000000 code 00000001
> [    4.090430] nouveau 0000:07:00.0: disp: chid 0 stat 10004418 reason 4
> [INVALID_ARG] mthd 0418 data 00000000 code 00000001
> [    4.090445] nouveau 0000:07:00.0: disp: chid 0 stat 10004424 reason 4
> [INVALID_ARG] mthd 0424 data 00000000 code 00000001
>
> i can solve it without rebooting by unloading and loading again the
> nouveau driver
>
> kernel version is 5.10.46-4
>
> nouveau driver debian package is 1:1.0.17-1
>
> i attach dmesg log in case it could help.
>
> please don't hesitate to ask for more info if you need it.
>
> thank you in advance.
>
>


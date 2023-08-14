Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27E77B80A
	for <lists+nouveau@lfdr.de>; Mon, 14 Aug 2023 13:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8339B10E1C1;
	Mon, 14 Aug 2023 11:58:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F004410E1C1
 for <nouveau@lists.freedesktop.org>; Mon, 14 Aug 2023 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692014323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xklp0re233elimPz2fr6mvqIoh+hu5pe70d4Tmn6E6Q=;
 b=aRYkkUtU2nr8DOMsSWskVYdmZm8EGvT22CkiGuFOA33eNTw0Hk386UYV9jLKXgOtJftVzd
 s5GBzXy9DLxxd4NF8935TnmOTUlMsgMVq6oRbDDPZnHaIRGMj0LDClpY9gmuKmzFvbrIlP
 O66yjdKxQT9oLs/miKgeXY+I7L7jvuw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-PIZz1-EZOlGDIOueWikdDg-1; Mon, 14 Aug 2023 07:58:41 -0400
X-MC-Unique: PIZz1-EZOlGDIOueWikdDg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b9cca3c395so8439681fa.1
 for <nouveau@lists.freedesktop.org>; Mon, 14 Aug 2023 04:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692014319; x=1692619119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xklp0re233elimPz2fr6mvqIoh+hu5pe70d4Tmn6E6Q=;
 b=T+HfCkKl05fqlkhtnKamP9Y7BspCCZLNofRzosA6KWwSmTWHt7n+cR2ldQDOGB+rIz
 dbdHh+lboD8UbTBVeYfAF8kAQAESIau2PQnwSAXxDhnERnsPqg0u63CNOoP6YXrh2Cob
 84uCNeNiriYqRMbJstf3UOidLlW5XObxKRzuv/JD4WqYNoCkXV53vzNoaIkEbF2qpJNB
 jrzHFw5Uuotv5UWRz/G1ZXLPnzIma+HIVcA0mUar/DgS5UlP8x8tuyCWT5SITXEcB5wK
 Uqj2/Sq6hGdp+zop9FnB78kKjxPP2f9hglnLNzqIPzfa3s6IYe59BpTQU+XDfxxilKpD
 2xHg==
X-Gm-Message-State: AOJu0YzBIDPJMJ6J3BMVBAcJDIUvBVAhvr/Tvrug2hRi//KkvmRIWljX
 cxm10oINXJFZzR2AUEWbb0+UwHERIBATCvYuJrVLhRHg0hCEeB50HWgw3uSmKZsgomY7p9yplM9
 Cf5Oi2sj9UVrfyMtZY+VrFHjw0BveueA57PKMZTznmoEhdIZPLg==
X-Received: by 2002:a2e:5414:0:b0:2b9:34b6:b47a with SMTP id
 i20-20020a2e5414000000b002b934b6b47amr5758269ljb.2.1692014319648; 
 Mon, 14 Aug 2023 04:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrc0EB95cfP1p1NRoHLVW2YCjWzXoSB0SqYG6MpVpyQv6tSrA/rUaj5/tDa6JoeeuAOC+Ji9vo+bOFToKZtIY=
X-Received: by 2002:a2e:5414:0:b0:2b9:34b6:b47a with SMTP id
 i20-20020a2e5414000000b002b934b6b47amr5758259ljb.2.1692014319335; Mon, 14 Aug
 2023 04:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <d7130547-02aa-8fa7-3611-211d41ebb73e@t-online.de>
In-Reply-To: <d7130547-02aa-8fa7-3611-211d41ebb73e@t-online.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 14 Aug 2023 13:58:28 +0200
Message-ID: <CACO55tsaCm7hd3RV2X7kuDxrTEqFZXccBTVdsf729_TVzHAd4Q@mail.gmail.com>
To: Wolfram Sauerteig <wsauerteig@t-online.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Problem with NVIDIA Quadro FX-2800m
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Aug 12, 2023 at 8:12=E2=80=AFAM Wolfram Sauerteig
<wsauerteig@t-online.de> wrote:
>
> Hello,
>
> since one  of the last nouveau driver updates I've got a problem with my =
Thinkpad W701. A couple of seconds after having started X11/KDE Plasma
> the Desktop freezes, only the mouse pointer is still moveable. System ist=
 therefore unusable.
> The Logs (/var/log/dmesg) show thousands of lines reading 'gr: TRAP_PROP =
- TP 5 - Unknown CUDA fault at address ...', see log file appended.
>
> Linux without GUI starts and runs as well as Windows 10 on the same machi=
ne without any problems.
>
>
> Hardware:
> LENOVO Thinkpad W701 model 25002EG/25002EG, BIOS 6KET60WW (1.30 ) 10/24/2=
012
> Core i7 920XM
> 32 GB RAM
> NVIDIA Quadro FX-2800M 1GB RAM
> SSD 2Tb data (Samsung SSD 870)
> SSD 512Mb system (Samsung SSD 850)
>
> Software:
> Linux 6.1.41-gentoo #2 SMP PREEMPT_DYNAMIC Thu Aug  3 09:51:42 CEST 2023 =
x86_64 Intel(R) Core(TM) i7 CPU X 920 @ 2.00GHz GenuineIntel GNU/Linux
> X.Org X Server 1.21.1.8
> kde-plasma/plasma-meta-5.27.6:5::gentoo
> sys-firmware/nvidia-firmware-340.32-r1::gentoo
> x11-drivers/xf86-video-nouveau-1.0.17::gentoo
>
> Does anyone have an idea how to resolve the problem?
> Might that be a hardware problem?
>

probably a kernel problem. As you seem to be on gentoo, would you feel
comfortable to figure out what kernel version regressed it? You could
use `git bisect` for that and it might take a while, but that's the
best approach to help out fixing that bug. Do you still know what was
the last good kernel? Maybe I can check the git log and see if
anything stands out or to try out.

>
> Best regards
> Wolfram


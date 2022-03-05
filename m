Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074C54CE161
	for <lists+nouveau@lfdr.de>; Sat,  5 Mar 2022 01:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4878710E179;
	Sat,  5 Mar 2022 00:16:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9186410E179
 for <nouveau@lists.freedesktop.org>; Sat,  5 Mar 2022 00:16:47 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id i1so7733757ila.7
 for <nouveau@lists.freedesktop.org>; Fri, 04 Mar 2022 16:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WP8p0K+sdyf0mxj2bWHDFEb5jGcwNE0UAZKoEqHnqFo=;
 b=Q05qutsgxUlaQdIIbWKxJEZ/eROil51cco3U/zCyzcagRUMx8yoCF0UR6sKXXV39sf
 0RxhcfpuNh1hrn7ID85fm78rhrU+lw7AH7ZWiGMUxDDzwSfAdmgpqLF6F7Bs3UL9yOCn
 4IPiNoiKzr6ZJW92MQrS6KZruTgTwTMma/xOGq4FAAc9qu2mAnovXLrjhp92UZlqf3oE
 4dVlIOLKNvaJtCSDZZbAbW14TMArFxSQDgC8krUrk4NXPBlh4CSVA2bbNSwDTKGLvLvZ
 FNc/QMEC8uihDjVgtXCz+wF02wHf74vsxq0fgKPmayk6vFFPYG3MRRVc0DfY7jEdAu46
 WA/g==
X-Gm-Message-State: AOAM532S2JYA/3Q9+rhevQqpFWKrgs7VDF9i+rUfJyIM7JaKBSoKj/Jz
 yywhYVVaehZDQFrR/gZ+pVo/h1GqyFp41v9w8RA=
X-Google-Smtp-Source: ABdhPJxFUoulnQd09mdaHnO6F7caSen6fVAtxQsUnBIvCdfndhFJyLWwUrlyBI0AH5jH8ZCq51b+EMiFfbgt2eQjJsE=
X-Received: by 2002:a05:6e02:1748:b0:2c4:20c6:5c57 with SMTP id
 y8-20020a056e02174800b002c420c65c57mr976857ill.70.1646439406873; Fri, 04 Mar
 2022 16:16:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMBDoMOXuowh-wrc32FR_O7oucOYBMhAP6hR-T7GjNd8DqUrsQ@mail.gmail.com>
In-Reply-To: <CAMBDoMOXuowh-wrc32FR_O7oucOYBMhAP6hR-T7GjNd8DqUrsQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 4 Mar 2022 19:16:36 -0500
Message-ID: <CAKb7UvjntPUW_ZHsCq5jn4+L=qToh_13ML79em8yskgsqdFrXQ@mail.gmail.com>
To: Andre Costa <andre.ocosta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] External monitor support for GTX 1650 (NV167/TU117)
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

Hi Andre,

You're going to be best off filing a bug at
gitlab.freedesktop.org/drm/nouveau with some details of your setup:

1. lspci -nn -d 10de:
2. Your vbios (/sys/kernel/debug/dri/1/vbios.rom)
3. Your monitor's EDID, esp as reported when plugged into nouveau
(/sys/class/drm/card1-HDMI-1/edid or the appropriate connector)
4. dmesg after nouveau is loaded and monitor plugged in

This should allow all the info to be well-contained and accessible to
everyone who needs to see it.

There aren't any currently outstanding known issues that I can think
of that would cause your current situation. But plenty of unknown
ones!

Cheers,

  -ilia

On Fri, Mar 4, 2022 at 7:12 PM Andre Costa <andre.ocosta@gmail.com> wrote:
>
> Hi there,
>
> I just bought an Acer Nitro 5 (AN515-44) notebook with an AMD Renoir iGPU=
 and a GTX 1650 dGPU. I installed Fedora 35 and, for the most part, it's wo=
rking great. The only issue so far is that I cannot use Wayland + external =
monitor with Nouveau -- it does recognize the external monitor, but only re=
nders the top half of the screen, the bottom half remains (literally) blank=
.
>
> (BTW the HDMI port is wired to the GTX 1650)
>
> For the record, I can use the external monitor just fine with Nvidia's pr=
oprietary driver on X11, but I'd rather use Nouveau if possible.
>
> I know support for the NV160 family is still coming up according to the f=
eature matrix, so I'll patiently wait. I just wanted to volunteer to do som=
e testing on this specific setup if this can help in any way. Just let me k=
now.
>
> Keep up the great work!
>
> Cheers,
> Andre

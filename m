Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2088827970
	for <lists+nouveau@lfdr.de>; Mon,  8 Jan 2024 21:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592BB10E32B;
	Mon,  8 Jan 2024 20:51:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6410E312
 for <nouveau@lists.freedesktop.org>; Mon,  8 Jan 2024 20:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704747099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UkyxvZQ5pYouZXCc0oPIjClMUAkVOY8Na3esy8fS2w=;
 b=ferdQ/19XsRuDo2yl/uNftdc6KZBZNlS55w8m7Zva3OYJKP13qQe3x3nNswLOvoO1s5aHP
 EReLY8JnYh1Fzz/zoyhEu8PYex7au+LJ04iorxNXrzO1gZWb6u5Tn7JXJ87N/mXfxkN0mq
 I6rQ75wEJjoyzM320hthcNUfRSENIwQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-2BhG1KE5PSKis1d9zRQJlA-1; Mon, 08 Jan 2024 15:51:38 -0500
X-MC-Unique: 2BhG1KE5PSKis1d9zRQJlA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5eba564eb3fso35317427b3.1
 for <nouveau@lists.freedesktop.org>; Mon, 08 Jan 2024 12:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704747098; x=1705351898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UkyxvZQ5pYouZXCc0oPIjClMUAkVOY8Na3esy8fS2w=;
 b=hVbZu8YhH3qrPHQruxBoSug6z77QPCsVBuEGRKKb/d+khMLU2XLC+Or8Ozfip/UuZW
 VNucfrSKnKl75wbv4+53tdRqZtMpAWT0evWPjLMUamq2kg6+F+oK7fOFlZQtMvyhBwWY
 RVw/C+QYVRv0sTAcBYJLyV/zuLxdjSOS5OIQqdnnnkVkIiNQPqtHYL56uzrHKs1+vw2I
 UQlu9A3OHeZ+psBCDILjdH0gYx6mfNzg0hhs9VJ4R6g6hbqJmhl7qurok4WGtLyUgENm
 DB04o+vzp3539lXUgpDiyJLlqiuT57/gUkEUjupwpxX1/fM0Lsz3m+ZxpubhjgiqCc3W
 6GOg==
X-Gm-Message-State: AOJu0Yze6USisk2ZpMlqOI1kYOtDwyb918PryHbd01vcQQXpNVcWJsfr
 pKhaSTwpV7w4NIJ98DlU9VTe/DruD45TM1yx16p4WKQ1c7uDsD4oPS+qjnv1X5IAkZsHG7pHEe9
 D072WkVBpfLkAoQzez/E8tETMqzJt+RuZRwR5oGbjlzMHZ0vVtQ==
X-Received: by 2002:a25:7391:0:b0:db7:dacf:ed65 with SMTP id
 o139-20020a257391000000b00db7dacfed65mr1729940ybc.70.1704747097767; 
 Mon, 08 Jan 2024 12:51:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE32OTXBZZ4AqcenfCZ/npf5vs1T3rzedd0Tz3UXzGyBKTZfzreJp+V6uBk9p0wYuShiMc+Z+KKDA0CtYQxSY=
X-Received: by 2002:a25:7391:0:b0:db7:dacf:ed65 with SMTP id
 o139-20020a257391000000b00db7dacfed65mr1729902ybc.70.1704747097086; Mon, 08
 Jan 2024 12:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20240108122823.2090312-1-sashal@kernel.org>
 <20240108122823.2090312-5-sashal@kernel.org>
In-Reply-To: <20240108122823.2090312-5-sashal@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Tue, 9 Jan 2024 06:51:25 +1000
Message-ID: <CAMwc25rAm1ndSiofWMMmQ1BeB0XxBvsHpcvaDKXUwEZp72iwEA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 5/5] nouveau: fix disp disabling with GSP
To: Sasha Levin <sashal@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, bskeggs@redhat.com,
 daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

NAK for backporting this to anything, it is just a fix for 6.7


On Mon, Jan 8, 2024 at 10:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Dave Airlie <airlied@gmail.com>
>
> [ Upstream commit 7854ea0e408d7f2e8faaada1773f3ddf9cb538f5 ]
>
> This func ptr here is normally static allocation, but gsp r535
> uses a dynamic pointer, so we need to handle that better.
>
> This fixes a crash with GSP when you use config=3Ddisp=3D0 to avoid
> disp problems.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20231222043308.309008=
9-4-airlied@gmail.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/disp/base.c
> index 65c99d948b686..ae47eabd5d0bd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
> @@ -359,7 +359,7 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
>         if (ret)
>                 return ret;
>
> -       if (disp->func->oneinit) {
> +       if (disp->func && disp->func->oneinit) {
>                 ret =3D disp->func->oneinit(disp);
>                 if (ret)
>                         return ret;
> @@ -461,8 +461,10 @@ nvkm_disp_new_(const struct nvkm_disp_func *func, st=
ruct nvkm_device *device,
>         spin_lock_init(&disp->client.lock);
>
>         ret =3D nvkm_engine_ctor(&nvkm_disp, device, type, inst, true, &d=
isp->engine);
> -       if (ret)
> +       if (ret) {
> +               disp->func =3D NULL;
>                 return ret;
> +       }
>
>         if (func->super) {
>                 disp->super.wq =3D create_singlethread_workqueue("nvkm-di=
sp");
> --
> 2.43.0
>


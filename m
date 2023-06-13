Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C772EE3A
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD0010E3FD;
	Tue, 13 Jun 2023 21:44:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB8E10E087
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686692663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaEaa0l31IXqM90UF4dkugFFxzcFTNl39a8he47uTVY=;
 b=QPz91wc2RQlx0xMOLzLKutXQgUVaN2gjXFCT2K/wv2KQw2FgL7DVDzh+Esm0zGffNENTJL
 DIqd5ShtJMxprarTzn2feMCoCrMvsOqU4C0UXTnA5A2/1LcPm/vZim5PaPYQqTLn52YXf4
 lgL/QWfhTJWqM6Rjf07Rq7fsfQGV/XU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-XuNt-y83PDSn4u81ySOF5Q-1; Tue, 13 Jun 2023 17:44:14 -0400
X-MC-Unique: XuNt-y83PDSn4u81ySOF5Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4f74128e499so454596e87.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686692652; x=1689284652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaEaa0l31IXqM90UF4dkugFFxzcFTNl39a8he47uTVY=;
 b=PMSnEDgIJ2CE6Pq2ex72xOlr8W8bPrcr9V5XSloUoV77xMpGj5ysi2lJCuh6+hWlsN
 W+Bez22ZWSthJ7qT3NXscfnoe3UMykiaH16MwJQmB15xpn7gcFens2kMfDs/3ktElWw4
 +pcGvaHpEXsGMNYDoSqt3n7g63yT4JfZfmfjKz97+ZBPHQ3HY4ELnrQQqbQirnriJScm
 9PcT2o02oFAy5Gi1nJwwaw/nYQOBkrKGUbmTnbVaRD093SPa/8JRusPr+wWT5adIoLmo
 xFXWHsOWjlCMOPIcPlGRTPk9/7ecfrs4+8tMXGlUbQiDOxbesLO7+LmrjtJwTENB63NY
 eMKQ==
X-Gm-Message-State: AC+VfDyIv/X801GlTv6/ckAxT5jziiYtYmaliLTlMsyn65ILVYSaHjF3
 ZrOXtN3jyRlS2shOofHt6wm0ycYKTrs9bbmq4VvVIPz5sqPRPKN1Tte6+kU74nmFmKx8OVy4sU5
 khTHPvr+PUW5DVA0+a5gfYYchk/fAhem0x2bF5XDowHbzmft7Lq1Y
X-Received: by 2002:a05:651c:3cc:b0:2b2:4e86:64a0 with SMTP id
 f12-20020a05651c03cc00b002b24e8664a0mr5449309ljp.3.1686692652389; 
 Tue, 13 Jun 2023 14:44:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FohFOtT7T44qaGFelK948RX2m+t+pqpc4/IBU4ilCYKhmzzlDOswhx/FDvrCzY9IFJrBCLFATBsJOnoJIMR8=
X-Received: by 2002:a05:651c:3cc:b0:2b2:4e86:64a0 with SMTP id
 f12-20020a05651c03cc00b002b24e8664a0mr5449300ljp.3.1686692652044; Tue, 13 Jun
 2023 14:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-9-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-9-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:44:01 +0200
Message-ID: <CACO55ts_a+r-A7QiRysWvC=3MQUBcV0DFTsWikSL-4EuD1AuBQ@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 09/10] drm/nouveau/nvif: fix potential
 double-free
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 2:31=E2=80=AFAM Ben Skeggs <skeggsb@gmail.com> wrot=
e:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> DRM cleanup paths unconditionally call nvif_mmu_dtor() for clients,
> which would result in a double-free if nvif_mmu_ctor()'d previously
> failed.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvif/mmu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau=
/nvif/mmu.c
> index 3709cbbc19a1..c9dd3cff49a0 100644
> --- a/drivers/gpu/drm/nouveau/nvif/mmu.c
> +++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
> @@ -27,6 +27,9 @@
>  void
>  nvif_mmu_dtor(struct nvif_mmu *mmu)
>  {
> +       if (!nvif_object_constructed(&mmu->object))
> +               return;
> +

nvif_mmu_ctor seems to be calling into this in its clean up path, so
this could now leaks memory in case nvif_mmu_ctor fails, no?

>         kfree(mmu->kind);
>         kfree(mmu->type);
>         kfree(mmu->heap);
> --
> 2.40.1
>


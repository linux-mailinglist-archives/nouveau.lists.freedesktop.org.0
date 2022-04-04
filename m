Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F14F1408
	for <lists+nouveau@lfdr.de>; Mon,  4 Apr 2022 13:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2563D10F09B;
	Mon,  4 Apr 2022 11:48:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1F10F099
 for <nouveau@lists.freedesktop.org>; Mon,  4 Apr 2022 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649072880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTroqqfcI2MDqWqbKgh6wbTef7dlVoQDzw8gA9QgLOo=;
 b=JJjC5rPNi0ADMfd7KZH08/4YiHZoj9rijfMqrDNvHIDehPeg7md+fprT+9dsTZOFW777If
 EoNTmF89BFentC9lAktD8E0ZzJDhKO2Ga6fVT0klEJuG1dBRZfqPNjCV0KMus1LpcnfWs1
 ieRvLzvdX7wnbo4cSMhmMl35HYK1HHk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-t5mWOkmPMPCG46dmfur-ww-1; Mon, 04 Apr 2022 07:47:59 -0400
X-MC-Unique: t5mWOkmPMPCG46dmfur-ww-1
Received: by mail-wr1-f72.google.com with SMTP id
 g4-20020adfa484000000b002061151874eso500802wrb.21
 for <nouveau@lists.freedesktop.org>; Mon, 04 Apr 2022 04:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RTroqqfcI2MDqWqbKgh6wbTef7dlVoQDzw8gA9QgLOo=;
 b=sSAzAzAADlQaB8oZcjLujl6wIS34JJ+pclgAZXJc9x7X97j2Zanf37qrAtzuYrU+F/
 bXYoW8FkNDO+mPwNBz5uEJuym9RT8vYxga8Zu8i3c4BQaT7t62opJLJO2Vj8ofNLhJ0A
 lAQ0BYvxasmkpVuc1EDUNQ5LaVzb8beXzBGKFTF/DB3nFdKvv01OC2D5ACJkR3fuJUsM
 2m8JJB8iifNCDevawlVkY6mLgaIni1mfR+VEEtT+vv3YT0P2m2ZZfXonzKIgBXLBqnDf
 tpw7dybYOi85deEFDcbKlHZ/7A4Jm3BA1QV+WMsM43Ga+k+KJP3Eq9UMRYkmpPx59d2d
 uDEw==
X-Gm-Message-State: AOAM531UYugHYlBI1SYBrwgR+t0JuCUGTbb3VnoqkIJKJd5NzqA4flxM
 U0RURaoQR0fMFV9JDUBni2JAIFEpHm4elyIMv49/7sdtHnY8S0hVz9N4sNw4fvUKJMuvZCRPZJV
 Ph996nB7JDAaYHPcQNJ8Z3OBwwx391zP67PaYaPd3IA==
X-Received: by 2002:a5d:58d7:0:b0:206:f0f:18d5 with SMTP id
 o23-20020a5d58d7000000b002060f0f18d5mr4382183wrf.271.1649072878725; 
 Mon, 04 Apr 2022 04:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfRniqq9oqHEt+AqH3PzMdEl+bXOMrnTFH6QrcmXHaI3SOtDHTkoB5JjP9e+7HlHoWE4/n4Er3zYtwjoxKlo8=
X-Received: by 2002:a5d:58d7:0:b0:206:f0f:18d5 with SMTP id
 o23-20020a5d58d7000000b002060f0f18d5mr4382168wrf.271.1649072878518; Mon, 04
 Apr 2022 04:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-6-christian.koenig@amd.com>
 <b9eb079c-3ec3-6095-92ab-5dbfab88d327@amd.com>
In-Reply-To: <b9eb079c-3ec3-6095-92ab-5dbfab88d327@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Apr 2022 13:47:47 +0200
Message-ID: <CACO55ttbz2vtr_3F=koenYW0S_238_FHXZ_w=r+i_X49ke+BYg@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 06/23] drm/nouveau: stop using
 dma_resv_excl_fence
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Apr 3, 2022 at 5:59 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Just a gentle ping to the nouveau guys.
>
> Any more comments on this? Otherwise I'm pushing that with Daniels rb.
>

It looks fine, but given that this area broke in the past I will try
to do some testing either before or after you push it. As long as we
do so before 5.19 it should be okay I think.

Unless somebody knowing more about this code has anything else to say.

> Thanks,
> Christian.
>
> Am 21.03.22 um 14:58 schrieb Christian K=C3=B6nig:
> > Instead use the new dma_resv_get_singleton function.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: nouveau@lists.freedesktop.org
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index fa73fe57f97b..74f8652d2bd3 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo=
,
> >   {
> >       struct nouveau_drm *drm =3D nouveau_bdev(bo->bdev);
> >       struct drm_device *dev =3D drm->dev;
> > -     struct dma_fence *fence =3D dma_resv_excl_fence(bo->base.resv);
> > +     struct dma_fence *fence;
> > +     int ret;
> > +
> > +     /* TODO: This is actually a memory management dependency */
> > +     ret =3D dma_resv_get_singleton(bo->base.resv, false, &fence);
> > +     if (ret)
> > +             dma_resv_wait_timeout(bo->base.resv, false, false,
> > +                                   MAX_SCHEDULE_TIMEOUT);
> >
> >       nv10_bo_put_tile_region(dev, *old_tile, fence);
> >       *old_tile =3D new_tile;
>


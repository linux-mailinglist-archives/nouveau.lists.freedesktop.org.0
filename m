Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2370D93E
	for <lists+nouveau@lfdr.de>; Tue, 23 May 2023 11:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3845C10E41E;
	Tue, 23 May 2023 09:37:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3610E419
 for <nouveau@lists.freedesktop.org>; Tue, 23 May 2023 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684834647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TAJ51kmQXr16zT02BkW6TkdFoXJfwtWEG43wr2zqYI=;
 b=Do9We+fewiIzH4JxkuuvUf6WhWR6fRR+uqGsXNwRfs7PsSax7UjwzbcX8VQsAouMK29tOM
 dkX0fFWaL6B6YTSXiztWUEV8vmlRp84nfMfowGe4T5RHlD/E4o/xv1TzQum4Mfbas4UJrZ
 56Aw37yQSs+cCGQASZGB5t3jOmcRpJU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-fguM3IiJNV2U9t-nTb_drA-1; Tue, 23 May 2023 05:37:25 -0400
X-MC-Unique: fguM3IiJNV2U9t-nTb_drA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4f3aada5081so547852e87.0
 for <nouveau@lists.freedesktop.org>; Tue, 23 May 2023 02:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684834644; x=1687426644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TAJ51kmQXr16zT02BkW6TkdFoXJfwtWEG43wr2zqYI=;
 b=Ln7RTsWN9mkRpJXTY+P3j6eWFpZ3ktdRQoEgMsFgrw0ERGxivG+a2gIYE0heVdaO5O
 cetcuIyKb5m5aZDFvbQEu0C5sshPS/Bw1Zwtx58rlOi3kfKbbRxvh//l4hBs5R4TOmHO
 qSaakAcqsv3Jo28VesApIa4zG1/kUW7WLMuGo0ac79iK6JsoHHoItRldjtQO+ns4gZ9J
 G2YdcoJ6uMv9o7NelrIy6PSnfCODOEHQfjBNwUykhZBUYy+bSzHc4Umvryhai5zbJqW/
 jW4njsstJLriJPM628MVSSSV4dZzhdNyhQ2jqQpFRzZjrO/8YXZEusu92d4tOQSnPOHY
 4SuQ==
X-Gm-Message-State: AC+VfDzb0VfHnFZw3Gb0xCwy9PT2tubmpGjMZEShqTZoHyVij3ICF+nf
 VD6VIw7kpR+0dosGniuFlzRzT4D0GXOpn3Wkg9V0E7+WHP/j9UZHmr0P2m0ddu7B4fgklgvTFns
 XLA8CzEg9/qHkT7huAHFoOS0ja578YPKfl7hT/HTfPg==
X-Received: by 2002:a2e:b543:0:b0:2b0:2214:f817 with SMTP id
 a3-20020a2eb543000000b002b02214f817mr1806090ljn.3.1684834644382; 
 Tue, 23 May 2023 02:37:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wfUxvYYMlMNYwsAxAvtMPY98o1s7TG750zKkGUBhjjl6rfxJ9Oo5E13RWKqWTlG86vS4OkxKnbLDWvHZB7oY=
X-Received: by 2002:a2e:b543:0:b0:2b0:2214:f817 with SMTP id
 a3-20020a2eb543000000b002b02214f817mr1806084ljn.3.1684834644065; Tue, 23 May
 2023 02:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230522201838.1496622-1-kherbst@redhat.com>
In-Reply-To: <20230522201838.1496622-1-kherbst@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 23 May 2023 11:37:13 +0200
Message-ID: <CACO55tuZeJZ6GTA+ooaXsSgde2Zy70qpe8Cg_AEfZRXtmd2LWA@mail.gmail.com>
To: linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: Abort loading ACR if no
 firmware was found
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
Cc: "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 10:18=E2=80=AFPM Karol Herbst <kherbst@redhat.com> =
wrote:
>
> This fixes a NULL pointer access inside nvkm_acr_oneinit in case necessar=
y
> firmware files couldn't be loaded.
>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/212
> Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/acr/base.c
> index 795f3a649b12..6388234c352c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> @@ -224,7 +224,7 @@ nvkm_acr_oneinit(struct nvkm_subdev *subdev)
>         u64 falcons;
>         int ret, i;
>
> -       if (list_empty(&acr->hsfw)) {
> +       if (list_empty(&acr->hsfw) || !acr->func->wpr_layout) {

Now thinking about this, it should probably also check acr->func...

>                 nvkm_debug(subdev, "No HSFW(s)\n");
>                 nvkm_acr_cleanup(acr);
>                 return 0;
> --
> 2.40.1
>


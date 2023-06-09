Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17072991A
	for <lists+nouveau@lfdr.de>; Fri,  9 Jun 2023 14:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB43610E69F;
	Fri,  9 Jun 2023 12:09:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA39010E69E
 for <nouveau@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3YEGdNvp8HrOlSgpTvQVmaRiPOQzGrP0bC+OvJCrwQ=;
 b=ZK3o4OGs5x4PjWSXrc8QPRbVeegBGkDhhaUVMxdrMRswHugw8I1J4nFlFJe6XuoowGdy9h
 SuNr13xeoAMbnEYZ7A6nZjopptpHV0nI2aRDKx0j+lqECDa5RwUYDil6wanYRPJveMYxAm
 JAvPBsKHWnOjqp8TkQDvj5j3Qbf8ssg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-UsHWG7tKOZWEaZ4v5p6HRg-1; Fri, 09 Jun 2023 08:09:41 -0400
X-MC-Unique: UsHWG7tKOZWEaZ4v5p6HRg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b0982c99adso1154911fa.0
 for <nouveau@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312580; x=1688904580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3YEGdNvp8HrOlSgpTvQVmaRiPOQzGrP0bC+OvJCrwQ=;
 b=K6w04NgsScr/0BUjHK1f6Znmiepvcy7gdHnUY1/OMllV6VbjcJgYju60c7AIvUJPk7
 /Ox2owi1IgKuEYyDqRUUMSPOBOXaAc4mb07emOwNahQpy3WHErRThTFFqvxF5NqQA9SS
 Tck7CmUdmQtQwBUMftp9WXrhYVB2vHCue8VTGZ5mybriKUj5z75MS8xPL2IjXngVF1vz
 F1EU4n3kCb7UuuojxfPP6u+jfGC0r3Q4iTr8wuz6h01jqPwUZjYSk29O0BV9axqj/tIE
 ilt8Z6lARxD9e8q0vouVdaMnKxuOqKagyPDO2ZkuT62T3khKY49mQd/lkhpJKUjUZhoc
 4AUA==
X-Gm-Message-State: AC+VfDy1NN/5kIHkmvzUMjGhHTS7r9LjVppu61Fa0nDSQY8FrQYFX5aw
 nWggutLPDUSyaiotQvCQdEb2UqAFVJtFUOQnCcoyrlJDjWbxe1Xb/pi/+ZohDFaKtKi2VuSBU+4
 Rwe5hBtx8kgjO44C4ezbiYdrysfacpetHhgtXRJSJ0Q==
X-Received: by 2002:a2e:aa1c:0:b0:2b1:e724:4d08 with SMTP id
 bf28-20020a2eaa1c000000b002b1e7244d08mr988058ljb.4.1686312580323; 
 Fri, 09 Jun 2023 05:09:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/t2tD8MaFXp12L6CGZR5hbVtX9aWeEyd2gjiDmsXx5pBr/sPbrekf6193BsmLX+ZVCnheOQK5h1GW9Ht/eq8=
X-Received: by 2002:a2e:aa1c:0:b0:2b1:e724:4d08 with SMTP id
 bf28-20020a2eaa1c000000b002b1e7244d08mr988048ljb.4.1686312580168; Fri, 09 Jun
 2023 05:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-11-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-11-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:09:29 +0200
Message-ID: <CACO55tuaNOYphHyB9+ygi9AnXVuF49etsW7x2X5K5iEtFNAAyw@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RESEND 10/15] drm/nouveau/nvkm/engine/gr/tu102:
 Staticify local function gf100_fifo_nonstall_block()
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 10:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previo=
us prototype for =E2=80=98tu102_gr_load=E2=80=99 [-Wmissing-prototypes]
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/tu102.c
> index 3b6c8100a2428..10a7e59482a6f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -206,7 +206,7 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, stru=
ct gf100_gr_pack **ppack)
>         return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
>  }
>
> -int
> +static int
>  tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *=
fwif)
>  {
>         int ret;
> --
> 2.41.0.162.gfafddb0af9-goog
>


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D359628B
	for <lists+nouveau@lfdr.de>; Tue, 16 Aug 2022 20:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F421121BB;
	Tue, 16 Aug 2022 18:36:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D7E113FE2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Aug 2022 18:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660674994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATLTNrU7GYz0luvrW4anz32ZvPvWjx6FLjAwIXa1ryQ=;
 b=JaEM4dCsujBGlIowU71zVaF8COc2TzZkh6T86wnOksj5qroFTdC8zHtr0Bc3SKVPgjYBiA
 0curIOPf6hMzcZ+vOLdQ8NI1C04QlgRiWPsM0ggDw87KZCWw9mbS1TcSnQnIKE/63pYiZk
 xO6Iq6HerTwuBjpR9WLf5GXNu2jvWYY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-kTKtkNK7N6mod7HLciLqkQ-1; Tue, 16 Aug 2022 14:36:33 -0400
X-MC-Unique: kTKtkNK7N6mod7HLciLqkQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 y17-20020a05620a25d100b006b66293d75aso9905136qko.17
 for <nouveau@lists.freedesktop.org>; Tue, 16 Aug 2022 11:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ATLTNrU7GYz0luvrW4anz32ZvPvWjx6FLjAwIXa1ryQ=;
 b=F0FTkduQ07apbaWUB/R1sAA0Re1/80/q8WepB47ivYVQHQO++KfMRA+6qzw8kbaRKR
 gImINQohrPIxsw1DP4q2syLypTFDhk8DU/WuvAyRua8Bir7z1qyhZcR3TXXVKWzRKePI
 GFYlfSVsWq+cXVErXSeMhAzWRfi84OV7UYJDZGxGN6Ak1tFoBgFIFhk438318BfmO3is
 LgUfROhqVruR7hnIf3iptWSCdi8eQXavy5Cbmf2CDpT6fMfR81tOEjGfx+yy5MZ1mnSa
 LjwkqX+KQocfaaAlj+U9aq472QL4V4QLggYJPjBA4hbRupFIdnj4bPoEi9Le6/b0NABw
 3f7A==
X-Gm-Message-State: ACgBeo1CaKTWpnwFt4l+69ACLvVoSGKqGJC40nShikv7NHzR5wUkWmyn
 LatF4JNlYIRC1rSYBFlJetYsjZf0eeIHZZlQiy/JCkDJcbu5pa86ljhFq/cBR7uDLHJmKFG59R6
 Fxk7rhVkZf82Twp5iIZESOOH95R/k59x/OBHugC3x0A==
X-Received: by 2002:a05:622a:53:b0:344:6f46:9b16 with SMTP id
 y19-20020a05622a005300b003446f469b16mr4523474qtw.664.1660674992999; 
 Tue, 16 Aug 2022 11:36:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uzqnNt/HXR/q6B/lqjN5qSDiPZY/PY86apwP8teYfRNvnblpR+HCXfIUeJjTQ/VgoEgoyP1yH48Iodoy+LVI=
X-Received: by 2002:a05:622a:53:b0:344:6f46:9b16 with SMTP id
 y19-20020a05622a005300b003446f469b16mr4523466qtw.664.1660674992830; Tue, 16
 Aug 2022 11:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220816180436.156310-1-lyude@redhat.com>
In-Reply-To: <20220816180436.156310-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 16 Aug 2022 20:36:22 +0200
Message-ID: <CACO55tvoDZMTr6my2LvhWWz7h3L6u2938n5dwvjvLANpvwxhjA@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv140-: Disable interlacing
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 8:04 PM Lyude Paul <lyude@redhat.com> wrote:
>
> As it turns out: while Nvidia does actually have interlacing knobs on their
> GPU still pretty much no current GPUs since Volta actually support it.
> Trying interlacing on these GPUs will result in NVDisplay being quite
> unhappy like so:
>
> nouveau 0000:1f:00.0: disp: chid 0 stat 00004802 reason 4 [INVALID_ARG] mthd 2008 data 00000001 code 00080000
> nouveau 0000:1f:00.0: disp: chid 0 stat 10005080 reason 5 [INVALID_STATE] mthd 0200 data 00000001 code 00000001
>
> So let's fix this by following the same behavior Nvidia's driver does and
> disable interlacing entirely.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 43a9d1e1cf71..8100c75ee731 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -504,7 +504,8 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
>                         connector->interlace_allowed =
>                                 nv_encoder->caps.dp_interlace;
>                 else
> -                       connector->interlace_allowed = true;
> +                       connector->interlace_allowed =
> +                               drm->client.device.info.family < NV_DEVICE_INFO_V0_VOLTA;
>                 connector->doublescan_allowed = true;
>         } else
>         if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS ||
> --
> 2.37.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>


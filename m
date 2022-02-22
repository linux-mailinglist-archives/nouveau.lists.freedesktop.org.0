Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2454C0331
	for <lists+nouveau@lfdr.de>; Tue, 22 Feb 2022 21:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673B310E5DB;
	Tue, 22 Feb 2022 20:36:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974B210E660
 for <nouveau@lists.freedesktop.org>; Tue, 22 Feb 2022 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645562204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtsuMnx/zdBZQQ43trmEefCQDk5DNh8X7mDs4NkeFJU=;
 b=PxeQlAVNfQPnPrUulYIL3NkuBOcYzEkRi9sJ3NHjzd78rKmOsc9UWDvLellb9dZ9QXyCeD
 5GdpzFilm8GF+1Hei0aFKOQYSXGfe61ir9h7n0vR2Y2223NxtvlYgqM5IKlUuOXPDDo9+9
 Vp5IVxNx6MZPb6RWBG4dwg1liv0gurA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-R15a7lIBPgKFSq0Oi9ApWQ-1; Tue, 22 Feb 2022 15:36:43 -0500
X-MC-Unique: R15a7lIBPgKFSq0Oi9ApWQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 3-20020a0562140d0300b0042d7c7ac26aso1052292qvh.7
 for <nouveau@lists.freedesktop.org>; Tue, 22 Feb 2022 12:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jtsuMnx/zdBZQQ43trmEefCQDk5DNh8X7mDs4NkeFJU=;
 b=21HWp/Nmz6O4PuH3iapF1OfDmTwY+vDcHOVROIEQGmO9/8B3o6n7lGY928DTsSi1Ag
 5IY39Rc+dYxQSoNf0SulsVGqfHhphQ0LJhmRuWLCPSKdWNUtYOigJX7YR3VE5OadPnJY
 ELtTx5P8TtegN3Szs1RZKFt4VBnfuDsEIMysIpzcILZR/MHeDaizRrihOcize9ESNa/g
 m7ZQs86+mov/4rfEUCQi/8ljHKQKhb+pkKF1Yz5mRPyPO+o9EefU5rXGRXcja+endm3Z
 tnKtPlsmHQ7JJN7N5+4v2flXLqxczqGj6dpx/mIctp4Q+wOw8Hi06JeJ19JmVVQi7M+r
 NLOg==
X-Gm-Message-State: AOAM5325DXCZtD6xrN9cl13QGs/6EHYxBxhJIJTXPpBrvyMLqdMVwNd/
 VZFwHJnDzBJgtxgmWzN45nHmaI4ZoPBDB1u9eUrgCL44c4xN7Pe4zN5eO2yeXdLcNalU/MNmJ1P
 V4+9J5VN7Ehw7fAqGJogb+DU9Ew==
X-Received: by 2002:a37:2791:0:b0:60d:d5a2:965e with SMTP id
 n139-20020a372791000000b0060dd5a2965emr16739714qkn.701.1645562202948; 
 Tue, 22 Feb 2022 12:36:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+ajuFarqEUjo9dTNx5yXpRv7c3qYT0A8Pm1EMM/XSCJ6AROkRiryQH0hVpjcTXRQO/t+Zgw==
X-Received: by 2002:a37:2791:0:b0:60d:d5a2:965e with SMTP id
 n139-20020a372791000000b0060dd5a2965emr16739694qkn.701.1645562202715; 
 Tue, 22 Feb 2022 12:36:42 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id y15sm404048qki.15.2022.02.22.12.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:36:42 -0800 (PST)
Message-ID: <91d0a60e2da3e2313f68b8c126d1da1efbaf0f88.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>
Date: Tue, 22 Feb 2022 15:36:40 -0500
In-Reply-To: <20220221095918.18763-14-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-14-maxime@cerno.tech>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH v2 13/22] drm/nouveau/kms: Remove redundant
 zpos initialisation
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 nouveau@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I assume you'll handle pushing this yourself? (JFYI - using drm-misc for
pushing this is fine by me)

On Mon, 2022-02-21 at 10:59 +0100, Maxime Ripard wrote:
> The nouveau KMS driver will call drm_plane_create_zpos_property() with
> an init value depending on the plane purpose.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in nv50_wndw_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> Cc: nouveau@lists.freedesktop.org
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 133c8736426a..0c1a2ea0ed04 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -635,8 +635,6 @@ nv50_wndw_reset(struct drm_plane *plane)
>                 plane->funcs->atomic_destroy_state(plane, plane->state);
>  
>         __drm_atomic_helper_plane_reset(plane, &asyw->state);
> -       plane->state->zpos = nv50_wndw_zpos_default(plane);
> -       plane->state->normalized_zpos = nv50_wndw_zpos_default(plane);
>  }
>  
>  static void

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1707959CA9F
	for <lists+nouveau@lfdr.de>; Mon, 22 Aug 2022 23:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6961113CD0;
	Mon, 22 Aug 2022 21:15:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709F4A33F7
 for <nouveau@lists.freedesktop.org>; Mon, 22 Aug 2022 21:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661202939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W99ikbboaJjO+6FHQ4eYoJSNppDNkQvI/eXvuOgjNJE=;
 b=SEHLsd4EzQ+W6SSU+barWBOc+9HjEWgdL9j0eW8WGSLMVLfGAwdAtlMqxMS4MBpAO2beVE
 gPZACCOdCpvHrGOtTh5nMzKLuNHChrOGeNvo7y5mspnqdp4tolnLm+8AutH4bZhBRzpe4n
 3QCm4mDCDEasehYDnw4WzTaVpE7/a8Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-wDeHjye6NV2Idwq4sNbRcw-1; Mon, 22 Aug 2022 17:15:37 -0400
X-MC-Unique: wDeHjye6NV2Idwq4sNbRcw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d20-20020a05622a05d400b00344997f0537so8164006qtb.0
 for <nouveau@lists.freedesktop.org>; Mon, 22 Aug 2022 14:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=W99ikbboaJjO+6FHQ4eYoJSNppDNkQvI/eXvuOgjNJE=;
 b=LoIvRiLZ+bPI1GA0/Xf9MhZjfHY5fYk/anCxp4YY/bKImadJtNlkbM1Y2sR7MYUXpi
 64+6I7Z2AWinIglRfyMENM3Jv+M10onpQF4G9R86UxgKSR2PypbxdgsH3OIYw/VPqTc+
 rtGUMwheR37FA6hOZC94N1tmntqQuV5oghh7sz0mhw7I87wFedSi6v14qr9uUebzRByt
 FBHpQqn1frQxvakkQLJh4sENkyomE8DkEGaFHXMwVyLILFFP3fb4RXlTJYz0W+dTwcGX
 lfthvQ5/czqUSfGkChdiN52bqe3n4Td7uMqCX9rtA1E8vh6y9zT+iFUbDOXlCH5o31Oj
 eD/g==
X-Gm-Message-State: ACgBeo0gEf1TqXNEO1BbWyeXSpfhWweENhIhQEqm00d4cqzcxwu8l5nc
 eiuoRtz4h5vi179iLf7pUMJEPOo+ddx309vWY72GHWQUQ5zCtpgisBY/b5KhzgZh84RdGW4d32i
 nea1WXAlQZP2Hpwv67bAhXub14A==
X-Received: by 2002:a05:622a:392:b0:343:738e:6f6b with SMTP id
 j18-20020a05622a039200b00343738e6f6bmr17200979qtx.174.1661202936870; 
 Mon, 22 Aug 2022 14:15:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5EnIC47AD0HBg/p8AcS7SZGGBNwPKTx0oDmr3tOt7DoWa5vhMJb3HcnPkR2X3yyJinWb3S5A==
X-Received: by 2002:a05:622a:392:b0:343:738e:6f6b with SMTP id
 j18-20020a05622a039200b00343738e6f6bmr17200952qtx.174.1661202936595; 
 Mon, 22 Aug 2022 14:15:36 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 w25-20020a05620a0e9900b006b5bf5d45casm11352206qkm.27.2022.08.22.14.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:15:35 -0700 (PDT)
Message-ID: <26a6f44c4b2a24d01b23d692416bf3f73103410d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Mon, 22 Aug 2022 17:15:34 -0400
In-Reply-To: <20220819200928.401416-1-kherbst@redhat.com>
References: <20220819200928.401416-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-08-19 at 22:09 +0200, Karol Herbst wrote:
> It is a bit unlcear to us why that's helping, but it does and unbreaks
> suspend/resume on a lot of GPUs without any known drawbacks.
> 
> Cc: stable@vger.kernel.org # v5.15+
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 35bb0bb3fe61..126b3c6e12f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>  		if (ret == 0) {
>  			ret = nouveau_fence_new(chan, false, &fence);
>  			if (ret == 0) {
> +				/* TODO: figure out a better solution here
> +				 *
> +				 * wait on the fence here explicitly as going through
> +				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> +				 *
> +				 * Without this the operation can timeout and we'll fallback to a
> +				 * software copy, which might take several minutes to finish.
> +				 */
> +				nouveau_fence_wait(fence, false, false);
>  				ret = ttm_bo_move_accel_cleanup(bo,
>  								&fence->base,
>  								evict, false,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


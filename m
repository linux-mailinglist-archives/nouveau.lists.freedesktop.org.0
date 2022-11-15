Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECB262A40E
	for <lists+nouveau@lfdr.de>; Tue, 15 Nov 2022 22:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAC510E105;
	Tue, 15 Nov 2022 21:28:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026C010E105
 for <nouveau@lists.freedesktop.org>; Tue, 15 Nov 2022 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668547698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmoXYFI0/eVOuz/NEvHefHeJjHkU7FXRO8BQqWcg6VU=;
 b=S+qFTzd7R0OMu3Q0VjmfZeJp1YLFaAkUGKXdeb/y6iCzuosxogc6KrsZ8uOnAV/zGstQdF
 xAsn9fPtmCuMzIRMXtLDh5n5axoQlWooOV/iYOmPfDpx4bHp9HUNG0TOxss3Vr98NNm+qC
 noX4Ft7fLkauXICMvuYB7PBnEcOwfLM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-QmMeHWD5PBOl5oqVWJnV-g-1; Tue, 15 Nov 2022 16:28:16 -0500
X-MC-Unique: QmMeHWD5PBOl5oqVWJnV-g-1
Received: by mail-qk1-f200.google.com with SMTP id
 bp10-20020a05620a458a00b006fa29f253dcso15084095qkb.11
 for <nouveau@lists.freedesktop.org>; Tue, 15 Nov 2022 13:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmoXYFI0/eVOuz/NEvHefHeJjHkU7FXRO8BQqWcg6VU=;
 b=ayjbJkBsSixfuvw28cWrIZon/smoZlG6tHlVlhtV3M1J1ys8NHSK6Dd3/yryKFmP4A
 aKAalA+rqJJyhsBfiRvbLPkdBk5B+DqBXLt7HJusVLv0KEDLN0ovKDA+saPbcNiPnx5O
 QksNb6GKOrkPh3o+EdmeOEwMzvIYATq6bg2ZeFV27sdGbXhTzt8Vv/3w6lMD9m3STimG
 EIrUGQ045W1j0we9DClbCxIPcZ0UzhBu2zD5p9VTGgk00VrgSc/hMiynvRsv/6Y7dvxf
 pW0+bEn2Yz7UDZsksjJcRVIvst1Tn3CmInXWI/obFZ89KmhiiSq5VWCM8UeC6fcwCVGn
 Qvmg==
X-Gm-Message-State: ANoB5pk8+fr8fXIm+sJ/AWWb7F6dyjIOtgKV84QItexZZIDqHvNv+wLX
 lITqn5a6b2SFvXmk2+Ps0Zcjpoap8AJrtMxMx37Z/6Kx91A15buzJ/xUqH9/Uccrz0YcEZr4CON
 h7MS6u0wDyFb3+rbAMEKPqdeVdA==
X-Received: by 2002:a37:3d6:0:b0:6ea:5efd:7c07 with SMTP id
 205-20020a3703d6000000b006ea5efd7c07mr17083353qkd.68.1668547696218; 
 Tue, 15 Nov 2022 13:28:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7CK3bbYzt2A3qEQjSmPdgB+DjUzTsXhGVKt0JKIf2+CrZ0ap0pHsHrLeu7LKroMWDYnkzA+Q==
X-Received: by 2002:a37:3d6:0:b0:6ea:5efd:7c07 with SMTP id
 205-20020a3703d6000000b006ea5efd7c07mr17083336qkd.68.1668547695975; 
 Tue, 15 Nov 2022 13:28:15 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 x28-20020a05620a0b5c00b006fa0d98a037sm8637014qkg.87.2022.11.15.13.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 13:28:14 -0800 (PST)
Message-ID: <78b220f34105e8f9ed5c1e9f1d3974c5ee9562e8.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Yang Li <yang.lee@linux.alibaba.com>, bskeggs@redhat.com
Date: Tue, 15 Nov 2022 16:28:13 -0500
In-Reply-To: <20221111011919.1992-1-yang.lee@linux.alibaba.com>
References: <20221111011919.1992-1-yang.lee@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/gr/gf100-: Remove unneeded
 semicolon
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
Cc: nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-11-11 at 09:19 +0800, Yang Li wrote:
> ./drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:423:31-32: Unneeded semicolon
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3013
> Fixes: 78a43c7e3b2f ("drm/nouveau/gr/gf100-: make global attrib_cb actually global")
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index 5f20079c3660..204516891ece 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
>  			return ret;
>  	} else {
>  		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb,
> -				      &args, sizeof(args));;
> +				      &args, sizeof(args));
>  		if (ret)
>  			return ret;
>  	}

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


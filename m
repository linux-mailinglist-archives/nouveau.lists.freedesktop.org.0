Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321D453B89
	for <lists+nouveau@lfdr.de>; Tue, 16 Nov 2021 22:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE73389DBF;
	Tue, 16 Nov 2021 21:18:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1809389D61
 for <nouveau@lists.freedesktop.org>; Tue, 16 Nov 2021 21:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637097481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4ttEiULMGdMkhTFpGiltGiBnhVT9018p53mbEP4OWA=;
 b=cLpyvubeWCW0MOFgrCVbV3St4D7Ch4cm1nKiitg6LM8Kg2erWsFaqUaAuliy4XPCu2IF7C
 1Dd+p+p9baA8zqjkiFGz0dc1/ImMgInF+c41czhyXTdqof7pyUzIqKHJSovlBrhigdKJ4Q
 pJTBtaNsCr9adn0KcaUAsYL18IfXD3U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-oQ_P3fRCPUKxQviW426pXA-1; Tue, 16 Nov 2021 16:18:00 -0500
X-MC-Unique: oQ_P3fRCPUKxQviW426pXA-1
Received: by mail-qk1-f197.google.com with SMTP id
 w13-20020a05620a0e8d00b0045fad6245e8so203610qkm.8
 for <nouveau@lists.freedesktop.org>; Tue, 16 Nov 2021 13:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=z4ttEiULMGdMkhTFpGiltGiBnhVT9018p53mbEP4OWA=;
 b=etrSdb8qjXRhNIUqciXlTba/64b0mjYTjg8L2hfmE3RQy5Yk05tB0QvaOwiH7ad8et
 WmnGuhe2JpmNmVx/C5frc2K8otKVcTbAxTWyAbo1leTSqK0l64hphREpK8J+wGIMK6X4
 GDM5JY2sIpqZux3vMkGkS8qWjQLoZhwc4O3nt4X8mw3l76pX8yHWULqK5AXmRPMwo7Bx
 ICl+eNfEQ6sdZuVuuhOna+0kCnEGVUkcpg2fIWhXijgfUTSp61szS1uF9pyywhNq8HZG
 kUj9HnKGrlj0FUjZo7XMHUueavBUP+7DGAG4AnV3rmFmuaedIksXXBMv5xM2balxB5Iz
 JM8w==
X-Gm-Message-State: AOAM532dEpwKKStnL+yNJuLdfT5Y8Sua1Q2aMgLyIHDa5H5JXdAjkYcn
 N03luujJmSW0qoK6M+qkF4KDvbFsKQgXCXPsiFzX8WxQiqHZIzBU7ZGTF6O/IoYeiIsKFc4xK9a
 1q/1doJ8brLPtmgCdIUct17fs1Q==
X-Received: by 2002:a37:9d8b:: with SMTP id g133mr8461209qke.180.1637097478715; 
 Tue, 16 Nov 2021 13:17:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz62Hg/kjKrougWFbpHWD2ssL0dJuk/qAO5ctquOWFbZqBzjVoR9pGuski9Qq326P5ilEvfEA==
X-Received: by 2002:a37:9d8b:: with SMTP id g133mr8461185qke.180.1637097478494; 
 Tue, 16 Nov 2021 13:17:58 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id y16sm9564415qtm.12.2021.11.16.13.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 13:17:58 -0800 (PST)
Message-ID: <6a79eef26121afa9190de5a021f4edef53fc9651.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 16 Nov 2021 16:17:56 -0500
In-Reply-To: <20211116070708.429432-1-yzhai003@ucr.edu>
References: <20211116070708.429432-1-yzhai003@ucr.edu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] In function nvkm_ioctl_map(),
 the variable "type" could be uninitialized if "nvkm_object_map()"
 returns error code, however,
 it does not check the return value and directly use the "type" in the if
 statement, which is potentially unsafe.
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is a very long patch name, it should probably be shorter and the
details in the patch title moved into the actual commit description
instead. Also a couple of things aren't formatted correctly:

* Cc tag for stable is missing, see
  https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
* Fixes tag isn't formatted properly

I generally recommend using `dim fixes` from
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
in order to get the correct stable kernel CC tag and Fixes: tag (you can
drop any of the Ccs it gives you beyond the one to stable at vger dot
kernel dot org.

Also, if you could try to Cc: me on the next version - will help me
respond faster :).

On Mon, 2021-11-15 at 23:07 -0800, Yizhuo Zhai wrote:
> Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
> be passed to map function")
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index 735cb6816f10..4264d9d79783 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
>                 ret = nvkm_object_map(object, data, size, &type,
>                                       &args->v0.handle,
>                                       &args->v0.length);
> +               if (ret)
> +                       return ret;
>                 if (type == NVKM_OBJECT_MAP_IO)
>                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
>                 else

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


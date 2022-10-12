Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA85FCE92
	for <lists+nouveau@lfdr.de>; Thu, 13 Oct 2022 00:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F48710E1CC;
	Wed, 12 Oct 2022 22:48:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B255510E1CC
 for <nouveau@lists.freedesktop.org>; Wed, 12 Oct 2022 22:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665614930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5nfuKdPwrQVXi/vnKW1FCyCONTVZtF3Xa0tpdwXNtg=;
 b=ULnhQPMbjGKdhY5cpzHTtTKonC9hIAcph92D1mAMTgB2PlepfWFbeJPxDqkioRYu4eJM5e
 bgh9dHdRozEGJgEdvbCWEk/osyXZVf7XKZJU1Job4fNP7yhfIQXkSFcuKavmDSsxnlf9s7
 7m8XxYUCfKVrvu7FLFxhY5o65mJRh8Q=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-A21vjRg2O36sRUIHNkOzsA-1; Wed, 12 Oct 2022 18:48:48 -0400
X-MC-Unique: A21vjRg2O36sRUIHNkOzsA-1
Received: by mail-qv1-f70.google.com with SMTP id
 q20-20020ad44354000000b004afb5a0d33cso208164qvs.12
 for <nouveau@lists.freedesktop.org>; Wed, 12 Oct 2022 15:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5nfuKdPwrQVXi/vnKW1FCyCONTVZtF3Xa0tpdwXNtg=;
 b=oHbucpCgdPb2DF3yoIbDTpdPIKzu6Op1U/+Y+wZnkEkdEkARs6MDayw2e1B0ALLTk1
 xo2B6DKg4hR6XG+4J75+KLeSQUUI6QJF2UKgwQSJBA+7tuNaMaAGDrCE35GmvuWpJ07c
 WosH31KytYZL2kPgZZigz78YfONekxDWCzeVWC7y8E1q4XS0cLGngsgyuGv3BaWauHZh
 C0N/ts20//GETyGZDKp+8Ph/0JhVffJt6DQY1FOnhrh7RwfWZOzOKLMVLXaPp8tDIQ3M
 Qg7DG0XvYnPVuBoKHGOg9P3vm0nNxokM0MeAnBtJuSmviPNk8wYonuseP/XAhXhfhJDk
 o8lg==
X-Gm-Message-State: ACrzQf2Lv13GZCx2unoeBr3Yi055qEv/ow/NNENsYkWwSUU7rjJhlfVA
 FCUn+GOZmDm4fy8kT+eMsA/NK7Ue8CHO86KFXJBRbmR/BZ4QffpiG3XD/MzX/KAOd29iOXyiBdx
 8CB+lxxTfEpnDlasM22n+1LDe/g==
X-Received: by 2002:a05:620a:27d2:b0:6cf:b644:f644 with SMTP id
 i18-20020a05620a27d200b006cfb644f644mr22536277qkp.35.1665614928475; 
 Wed, 12 Oct 2022 15:48:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72AflosodYNtr/quj11dfW8xw1ovGZzl7sA9B7tx1ZGymI0DOPi1vu4e2bPcM1ZP1Q5MC8dg==
X-Received: by 2002:a05:620a:27d2:b0:6cf:b644:f644 with SMTP id
 i18-20020a05620a27d200b006cfb644f644mr22536261qkp.35.1665614928240; 
 Wed, 12 Oct 2022 15:48:48 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300:fdba:af4a:bbcd:7e28?
 ([2600:4040:5c68:4300:fdba:af4a:bbcd:7e28])
 by smtp.gmail.com with ESMTPSA id
 l10-20020ac8148a000000b0039cc47752casm1669626qtj.77.2022.10.12.15.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 15:48:47 -0700 (PDT)
Message-ID: <9c36a93654c5aa9c850cd5d42681aa951df9e769.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: ruanjinjie <ruanjinjie@huawei.com>, bskeggs@redhat.com,
 kherbst@redhat.com,  airlied@linux.ie, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch,  jani.nikula@intel.com, airlied@redhat.com,
 tzimmermann@suse.de,  hverkuil-cisco@xs4all.nl, greenfoo@u92.eu,
 seanpaul@chromium.org,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 12 Oct 2022 18:48:46 -0400
In-Reply-To: <20220924092516.10007-1-ruanjinjie@huawei.com>
References: <20220924092516.10007-1-ruanjinjie@huawei.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/disp: fix cast removes
 address space of expression warnings
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

...oops, totally forgot to actually give you the magic tag so patchwork knows
I reviewed it:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2022-09-24 at 17:25 +0800, ruanjinjie wrote:
> When build Linux kernel with 'make C=2', encounter the following warnings:
> 
> ./drivers/gpu/drm/nouveau/dispnv50/disp.c:134:34: warning: cast removes address space '__iomem' of expression
> ./drivers/gpu/drm/nouveau/dispnv50/disp.c:197:34: warning: cast removes address space '__iomem' of expression
> 
> The data type of dmac->_push.mem.object.map.ptr is 'void __iomem *', but
> converted to 'u32 *' directly and cause above warnings, now
> recover their data types to fix these warnings.
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 33c97d510999..aa94f8e284dd 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -131,7 +131,7 @@ nv50_dmac_kick(struct nvif_push *push)
>  {
>  	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
>  
> -	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
> +	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
>  	if (dmac->put != dmac->cur) {
>  		/* Push buffer fetches are not coherent with BAR1, we need to ensure
>  		 * writes have been flushed right through to VRAM before writing PUT.
> @@ -194,7 +194,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
>  	if (WARN_ON(size > dmac->max))
>  		return -EINVAL;
>  
> -	dmac->cur = push->cur - (u32 *)dmac->_push.mem.object.map.ptr;
> +	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
>  	if (dmac->cur + size >= dmac->max) {
>  		int ret = nv50_dmac_wind(dmac);
>  		if (ret)

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


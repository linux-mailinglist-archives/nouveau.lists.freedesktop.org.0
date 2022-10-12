Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66225FCE91
	for <lists+nouveau@lfdr.de>; Thu, 13 Oct 2022 00:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767BD10E1B4;
	Wed, 12 Oct 2022 22:48:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472A310E149
 for <nouveau@lists.freedesktop.org>; Wed, 12 Oct 2022 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665614902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cQbK112G3CBY1iPorRDqAdSJlO6cOwytKNZM4RSxzY=;
 b=OaHGCLrABgbOCy7ugcQX1bTURhWCB6BGCd16dYjhg6i06vlUnbLYehm3QmRW+0hloS5Zux
 ir2rYfaVPseFQGJKJztUxvlLMs7DzJRl9+ei8hFWft4MFyiMEWcbsOXBUn353stxEPpwkN
 l+sDsxWprm0Nt8QlNsKgfL5+QD323kM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-QqP58IqnN_iQgNvRqysjpw-1; Wed, 12 Oct 2022 18:48:18 -0400
X-MC-Unique: QqP58IqnN_iQgNvRqysjpw-1
Received: by mail-qt1-f200.google.com with SMTP id
 bz12-20020a05622a1e8c00b0039ae6e887ffso20557qtb.8
 for <nouveau@lists.freedesktop.org>; Wed, 12 Oct 2022 15:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cQbK112G3CBY1iPorRDqAdSJlO6cOwytKNZM4RSxzY=;
 b=BXxatrytNVTgua3qZtR9Lzi1S29Vked5dHt3Z1kmGi4g+LhFmEPrh/J/aB7OVgwgZV
 s4N1G0OOD6okR+HbkaWxAC4Aq/jQaT+CvQjMcfc4HvbuzlCnIkwJNiBnjn8C7J87OWJu
 v/Qt75q18ibpnuPzlkIzR4kYFyNUFWaiaoaZZBo+gr4MT+d0VlAelK374axiki/CAmPQ
 QQ8hxayZ4nf0ScxdtUmuO0Q3ve9iIenNd2MQoNyPhA/R1rpNoYlDh4J0v1XjyOeK3sd5
 6caqt06utPm4Kh1srUqNX2FTYlmXfP1FckvRYJAFVQMRxP+qLabK6G0/ZvWVJKPc6T2c
 rrUA==
X-Gm-Message-State: ACrzQf1iuT4/wzNwPOqsWrdJwJjKWHAonTvrLJcBU09jtcJzoJIg6PcL
 3Lq4zd4DC8+xq/s2FshHKox3g5rwUTl0BwnIPTwSqgJfzyplIQAfCfjKk4tjkZKhSklkN7AFujW
 SO1Gk5hMloentx3nGNrNKtecjOA==
X-Received: by 2002:a05:622a:1183:b0:39c:606d:1f7f with SMTP id
 m3-20020a05622a118300b0039c606d1f7fmr8858882qtk.313.1665614897698; 
 Wed, 12 Oct 2022 15:48:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tzPmYPKNIbVp3GJbjJyU2orb8Zq7NMYarr1l6JZruGvyaqWohInpYh6qO0ffWOFde1Yrniw==
X-Received: by 2002:a05:622a:1183:b0:39c:606d:1f7f with SMTP id
 m3-20020a05622a118300b0039c606d1f7fmr8858864qtk.313.1665614897486; 
 Wed, 12 Oct 2022 15:48:17 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300:fdba:af4a:bbcd:7e28?
 ([2600:4040:5c68:4300:fdba:af4a:bbcd:7e28])
 by smtp.gmail.com with ESMTPSA id
 x20-20020ac87014000000b0039cb9ef50b5sm3192209qtm.26.2022.10.12.15.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 15:48:16 -0700 (PDT)
Message-ID: <b52dbad5e3c2c5f19c605440de3e4e017e70a2ec.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: ruanjinjie <ruanjinjie@huawei.com>, bskeggs@redhat.com,
 kherbst@redhat.com,  airlied@linux.ie, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch,  jani.nikula@intel.com, airlied@redhat.com,
 tzimmermann@suse.de,  hverkuil-cisco@xs4all.nl, greenfoo@u92.eu,
 seanpaul@chromium.org,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 12 Oct 2022 18:48:15 -0400
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

Looks good to me (sorry for the slow response! I think this one just got lost
in the noise). Will push to drm-misc-next in a moment

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


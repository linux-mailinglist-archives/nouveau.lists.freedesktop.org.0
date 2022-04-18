Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC5505DFE
	for <lists+nouveau@lfdr.de>; Mon, 18 Apr 2022 20:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59379898BF;
	Mon, 18 Apr 2022 18:41:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCD1898BF
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 18:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650307266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VuGc/WdeVJI1eBiXvGHukz2whIa4wWjXqnrLuB6HMKY=;
 b=R1U2Rrdth6w3f3h9arZJLFadHGfBLeGXZkYFpaiiktv3+GVKn26bjVq+C3ynApXQX7a19O
 tnqu6WlNTq2bMlOG7CUb16qyI9T0eTU5D0GYsHET26QkWdzRORHRs/tDsZMSmMYWA8L5vz
 fKzC9u9HxHEO7Fl+0ZONXy5TRSc2VbI=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-T1tThXQYOs2GaF6It5JT-w-1; Mon, 18 Apr 2022 14:41:05 -0400
X-MC-Unique: T1tThXQYOs2GaF6It5JT-w-1
Received: by mail-vs1-f70.google.com with SMTP id
 v128-20020a672f86000000b0032a58624502so509013vsv.8
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 11:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VuGc/WdeVJI1eBiXvGHukz2whIa4wWjXqnrLuB6HMKY=;
 b=PX5YjWp9R1G1B3ZiNO2KTolsbYGTLl52nX6cuZ2XWUq7cHfbWXGY+8FK16XzNrsRZI
 JCwIb6jOTk7sAMFtvutK0rux1UDuBu1MBKooTPwPs9Owcfpz3yHjklp87seK89s31ENO
 1v+avAmlupxlSDwtFr6e6Okesv35ft23ggZoz/dvR4v4tDWhUgHgBu8KB0SYcJCVbkRx
 2jkFZDqJw8x/fNaE9eLhcc2aOzuc/tKQF2JGGcpOXp9lbobkxpIKvMvHoH5grJbB7zm6
 nf/QY9xsjAphPBEWY3v70KTByO5PPHlEjEN7LOOB2an4T0RrC+CcA8wGfK8dSXt3ONdr
 ypAQ==
X-Gm-Message-State: AOAM530/ToDGlNom3cXEnOPPdRM/zEciT/B1ZE2j4SBY04bLR2AphOSh
 4KLuvwTFW433a1Z3oknnp/XYlXc+MAiaW4L+fjv9Co18cQFw2Xpc14Rsx70Q5/Ub7xQ1z6KTmnp
 KpEIADe5r7AQwEO0HqTYfX8TpZA==
X-Received: by 2002:a1f:14c2:0:b0:345:3e0f:81b1 with SMTP id
 185-20020a1f14c2000000b003453e0f81b1mr3190541vku.2.1650307264770; 
 Mon, 18 Apr 2022 11:41:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEjhYF2Aoq1MDzFFiHfewXPAu8UoNo+RuC8SC8/8YCVnNVsfULVrP7+ysF7haG+Vsfh9D7ig==
X-Received: by 2002:a1f:14c2:0:b0:345:3e0f:81b1 with SMTP id
 185-20020a1f14c2000000b003453e0f81b1mr3190533vku.2.1650307264525; 
 Mon, 18 Apr 2022 11:41:04 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 t66-20020a1f2d45000000b00348da3c51bbsm1605500vkt.13.2022.04.18.11.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 11:41:03 -0700 (PDT)
Message-ID: <bc995a702bfa0c0efa83792a0d5c46bfe1ff0a4b.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 18 Apr 2022 14:41:02 -0400
In-Reply-To: <20220418141842.296386-1-trix@redhat.com>
References: <20220418141842.296386-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: change base917c_format from
 global to static
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this to the appropriate branch in a little bit

On Mon, 2022-04-18 at 10:18 -0400, Tom Rix wrote:
> Smatch reports this issue
> base917c.c:26:1: warning: symbol 'base917c_format'
>   was not declared. Should it be static?
> 
> base917c_format is only used in base917.c.  Single
> file variables should not be global so change
> base917c_format's storage-class specifier to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/base917c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> index a1baed4fe0e9..ca260509a4f1 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
> @@ -22,7 +22,7 @@
>  #include "base.h"
>  #include "atom.h"
>  
> -const u32
> +static const u32
>  base917c_format[] = {
>         DRM_FORMAT_C8,
>         DRM_FORMAT_XRGB8888,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


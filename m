Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F07373A6
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF80F10E31A;
	Tue, 20 Jun 2023 18:20:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC37210E132
 for <nouveau@lists.freedesktop.org>; Wed, 31 May 2023 08:32:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f606912ebaso56960275e9.3
 for <nouveau@lists.freedesktop.org>; Wed, 31 May 2023 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685521917; x=1688113917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WhA/sfDRnLuDCN7yHv6nCUiMzZVvvoBjYdsSnPZ2b68=;
 b=Qf9zKFrn4Y6OFuEjXy7xAuVGz/ckgeam+xe7JLoo1sZ2JIwV3Zle4eGVrClGw0Suuu
 EuPu5XqzoGtSat0xDB8XzH//945LkSMdRioWZ07l3M+g3sQPSG6k5rbbiURKiTm3B7io
 beFK2eG3qQGuU7oqTYBxDur924FFE9Kd6DwSCXq6CmSdUPSY7ZYVbroOjtE0rOpBialT
 2pRHtuwWKBsxHuAUF0xHP+WoE6Cpl5WLqdOnWc2v6+hVQ1Y3woLNfCrW5f8kxg0qVI9C
 WdnZVK5XxDrJP5HkDypnDQoH7zGtbRZct9zHWKgpsrYdownAuH6HRocfvXIjm7fhRODu
 PeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685521917; x=1688113917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhA/sfDRnLuDCN7yHv6nCUiMzZVvvoBjYdsSnPZ2b68=;
 b=TMPrm1Qe+ZIypPmWJ+/r3cjCZPszzNAUqhsYcVEKrbRqJPuBx6lk1VDWYVZh0D6d7/
 wCmyZGAvTe+fcsB8RMFWBUo/9xG23Ze3n7RjH98VI8539znhniS2XrrU0aRazhPymxn1
 RFsnXuwJ5p+UcZT90SJAvR9vp24J/rCinoXilQmUg0VGO/W48oKB3CBZisy+tMn/cOiz
 yWMY3tLM/zps8q9geonW626slN0dirG+FH0SL3lvrmM6c4WauktDEindeaEEKwFce5gb
 P8fVHZ/MRPFt1FhveEFjxDvuTj6+ZbYiSp+YwRASHo/v0edubKO0CFKTLu3G2SVXBfEv
 Jt8w==
X-Gm-Message-State: AC+VfDzj28lvcXxPxFbiGId3nPATFiC5a6/D/wVP9YeaU/OXM12QyfGG
 cjRfLM9OzcIlgTjkybzIK4Awtg==
X-Google-Smtp-Source: ACHHUZ4S5/0dJg8BIO5Y3X1Ar+fFJRW029hscEdyzxU/RK6FIShaB3l5woWFqtMhhmxltyEBwA5dOw==
X-Received: by 2002:a1c:f216:0:b0:3f1:7581:eaaf with SMTP id
 s22-20020a1cf216000000b003f17581eaafmr3223629wmc.4.1685521916624; 
 Wed, 31 May 2023 01:31:56 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q13-20020a7bce8d000000b003f43f82001asm23557270wmj.31.2023.05.31.01.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 01:31:54 -0700 (PDT)
Date: Wed, 31 May 2023 11:31:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Message-ID: <00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain>
References: <20230531043826.991183-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531043826.991183-1-suhui@nfschina.com>
X-Mailman-Approved-At: Tue, 20 Jun 2023 18:20:11 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau/nvif: use struct_size()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 airlied@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 12:38:26PM +0800, Su Hui wrote:
> Use struct_size() instead of hand writing it.
> This is less verbose and more informative.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/nouveau/nvif/object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> index 4d1aaee8fe15..4bd693aa4ee0 100644
> --- a/drivers/gpu/drm/nouveau/nvif/object.c
> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> @@ -65,7 +65,7 @@ nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
>  	u32 size;
>  
>  	while (1) {
> -		size = sizeof(*args) + cnt * sizeof(args->sclass.oclass[0]);
> +		size = struct_size(args, sclass.oclass, cnt);

This is from the original code, but now that you are using the
struct_size() macro static checkers will complain about it.  (Maybe they
don't yet?).  size is a u32.  Never save struct_size() returns to
anything except unsigned long or size_t.  (ssize_t is also fine, I
suppose).  Otherwise, you do not benefit from the integer overflow
checking.

>  		if (!(args = kmalloc(size, GFP_KERNEL)))
>  			return -ENOMEM;
>  		args->ioctl.version = 0;

regards,
dan carpenter

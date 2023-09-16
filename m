Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB917A30E1
	for <lists+nouveau@lfdr.de>; Sat, 16 Sep 2023 16:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41A210E122;
	Sat, 16 Sep 2023 14:26:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865CE10E121
 for <nouveau@lists.freedesktop.org>; Sat, 16 Sep 2023 14:26:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso35091785e9.2
 for <nouveau@lists.freedesktop.org>; Sat, 16 Sep 2023 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694874363; x=1695479163; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wuByROzzKWy0dgFTyL5cv38N2mo72GoYzRnh9gqNiOA=;
 b=NOV5YcEHvJ6GrefkO1nGu2ZBw05F81demkocCjRIk267Xp7gEvct2lvzm2EDIWJrZD
 tyrLKpv6UJyy2rr1HAqRF/z18unPbTqL6GwB5zxJg+7fM2RgpSlu4BVgXBeoQu1vbyLq
 ttdIRNP+PkoEBrR4Q8VFHaBqltf5y0rSOc/1w8D5vJtSfRZSLFftWSQfp/YKKPcSr/ns
 U3O2yIyJg1d2WeuI07SDCAxSJOREidCggqKoUxz0tGtmmiLF9ZK/QKiW0CbxOG0dKV1A
 HVnMr+6+fzR7+dKS8Ko48c70nFf3IzVlGRoKo7IKM/im5rLqoIpwOx6Bc1A1TFKrOVyy
 rTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694874363; x=1695479163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wuByROzzKWy0dgFTyL5cv38N2mo72GoYzRnh9gqNiOA=;
 b=vTVEmTytddOHpIrbbvIX482ISAKhettsBaxKTpmr8lcltdfLuyU/DscdJeeqZMKxu5
 +W0v0aA+RlF6FMjO8GNk+kbKtzAlRi3rhIfeHaktLLRw1aZy/uKrJA9T5M1s+53LkNYD
 vC5u/olkVIuYF6hb12MkN/i8QTJDgem4RRb9fvM2ovAQnKG/ze2Gds3llxf73naLQtME
 zb0IT0J1MycQpMuACYkdkylf71qHKznEWV/QEJKjYSLBc/BnhSeIp81O0ekCIVoEVcDV
 TspPLfinYZo357NuY+9iXWp4rLvnz70V7DhZp0ZLgc7F8T8OmQWiZdmIPq2Pr3/xDRpH
 lMGg==
X-Gm-Message-State: AOJu0Yyd9dE6eoXm6jdHrDEAeCQBDk1OUF4RAK6lV/T5SV83W8aKNDaY
 S42E1575TyTFm3vZ8zyaO/9ic1tkf1cctE460S4=
X-Google-Smtp-Source: AGHT+IFgjG10KveE648lPazX2ga7MjAWg/VhRg7CJ3ISLz4Oqx1Ua27V4XKEa8rrgx0sxyaBXgEE7Q==
X-Received: by 2002:a05:600c:2058:b0:401:b53e:6c39 with SMTP id
 p24-20020a05600c205800b00401b53e6c39mr3958856wmg.6.1694874362781; 
 Sat, 16 Sep 2023 07:26:02 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c220600b00402dbe0bbdcsm10285689wml.28.2023.09.16.07.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 07:26:02 -0700 (PDT)
Date: Sat, 16 Sep 2023 17:26:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Message-ID: <2ab31d98-931f-4322-8e67-381d21302a7c@kadam.mountain>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
 <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
 <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer
 bug
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Sep 16, 2023 at 05:24:04PM +0300, Dan Carpenter wrote:
> On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
> > Hi Dan,
> > 
> > On 9/15/23 14:59, Dan Carpenter wrote:
> > > The u_memcpya() function is supposed to return error pointers on
> > > error.  Returning NULL will lead to an Oops.
> > > 
> > > Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > index 3666a7403e47..52a708a98915 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
> > >   	size_t bytes;
> > >   	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> > > -		return NULL;
> > > +		return ERR_PTR(-ENOMEM);
> > 
> > I plan to replace this function with an upcoming vmemdup_array_user() helper,
> > which returns -EOVERFLOW instead, hence mind using that?
> > 
> > Unless you disagree, no need to resubmit the patch, I can change it
> > before applying the patch.
> 
> Generally, I would say that ENOMEM is the correct error code.  I feel
> like someone thinks EOVERFLOW means integer overflow and that's not
> correct.  I means like if you pass a number higher than INT_MAX to
> kstroint().

The most common error code for integer overflows is EINVAL because the
user passed invalid data.

regards,
dan carpenter


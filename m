Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45040505E17
	for <lists+nouveau@lfdr.de>; Mon, 18 Apr 2022 20:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F256010E135;
	Mon, 18 Apr 2022 18:53:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD29410E12A
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650308002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QL6AB1e58fXCCgMn67tELqsCerYiMJO8eo3KuBC5io=;
 b=DDJHy09Ap2sUGzABWMiUBXIfttlTUfPaWUjoBjmizvq0pVD4rA/rMuC4sIy2su/NYNd99M
 Q1JMR1vWdIQIibyhiNB+9xjiFbTyaxPudLQtnNEkNWD4rx8axbJcaz/SyZ5r5ZKihkwRKL
 LBNocb5sfhSj+dVXv0nTuATXXM2dZeg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-j7gP7i8tO8esuFmhMzpLLg-1; Mon, 18 Apr 2022 14:53:21 -0400
X-MC-Unique: j7gP7i8tO8esuFmhMzpLLg-1
Received: by mail-qt1-f200.google.com with SMTP id
 s9-20020ac87589000000b002e1cfb25db9so2261230qtq.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 11:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=3QL6AB1e58fXCCgMn67tELqsCerYiMJO8eo3KuBC5io=;
 b=Ev4TRDm8p5q7aKojtEmc0TgDBu9XAN6LBuXRX56MvC7IwbdHVYHuIku1J/Wlspf4iR
 x50lsvULT/mQ0Ay9MaYtoEgIt4gfsKTxVbuaPQhUL/fMa6gROvel0uUS5tHDkwx6NZSi
 OEHyBS3B1YM9QFU7/hyxrH36v4rF6Q5Fq6sqnzBAgHsfOTfws0DplBXajI4qResfm7MD
 QWgjZB/3y1AxSjRg96or8e5seS5A+HNDsGuobis1iKBF67Y6vZ26OD8wc4hv3NI/VC4J
 WjLzE5TmPq/t4KjRp6BFxlhtyXRQTMDdJilSh7hnRbzgBY5qE0lfxtvPEh2uoGRwGya8
 /h/w==
X-Gm-Message-State: AOAM5316TFz/uJTgMHIUwolcnBIFbNH4uRb1NT94jbxI6nhQwJ0OXG18
 8ZM3xTwupP+AoYB1pV/lLqxNj1kbhzuQdc2WCjWVBYeP6yf8wexJn073XyL4vfvSxkt6b6BdP9T
 Ja5Nc5Xc9qzYGAeL8EJ6qH2OY9Q==
X-Received: by 2002:a05:622a:13c7:b0:2f2:4bf:b4ee with SMTP id
 p7-20020a05622a13c700b002f204bfb4eemr2382470qtk.676.1650308001223; 
 Mon, 18 Apr 2022 11:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiJOMwM2cO+2EIYEAPFwkpbHHBWmZQjSPFW43xk7EoOaFdRaV6zdviqsvk9fEK/Ser1+Qycw==
X-Received: by 2002:a05:622a:13c7:b0:2f2:4bf:b4ee with SMTP id
 p7-20020a05622a13c700b002f204bfb4eemr2382456qtk.676.1650308001019; 
 Mon, 18 Apr 2022 11:53:21 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05622a018c00b002f2017d5652sm1819917qtw.40.2022.04.18.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 11:53:20 -0700 (PDT)
Message-ID: <f5700e71bfee343dc2837d3348cada66406ce9fa.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 18 Apr 2022 14:53:19 -0400
In-Reply-To: <20220418152810.3280502-1-trix@redhat.com>
References: <20220418152810.3280502-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/gr/gf100-: change gf108_gr_fwif
 from global to static
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

Will push to the appropriate branch in a moment

On Mon, 2022-04-18 at 11:28 -0400, Tom Rix wrote:
> Smatch reports this issue
> gf108.c:147:1: warning: symbol 'gf108_gr_fwif'
>   was not declared. Should it be static?
> 
> gf108_gr_fwif is only used in gf108.c.  Single
> file variables should not be global so change
> gf108_gr_fwif's storage-class specifier to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> index 030640bb3dca..ab3760e804b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> @@ -143,7 +143,7 @@ gf108_gr = {
>         }
>  };
>  
> -const struct gf100_gr_fwif
> +static const struct gf100_gr_fwif
>  gf108_gr_fwif[] = {
>         { -1, gf100_gr_load, &gf108_gr },
>         { -1, gf100_gr_nofw, &gf108_gr },

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


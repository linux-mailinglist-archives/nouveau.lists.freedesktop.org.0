Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9A4AE27C
	for <lists+nouveau@lfdr.de>; Tue,  8 Feb 2022 21:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B605710E125;
	Tue,  8 Feb 2022 20:09:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AB910E125
 for <nouveau@lists.freedesktop.org>; Tue,  8 Feb 2022 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644350961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3/8UwtTiLaHjDIsw5ToTGGU9VaJhcJtecxqfQCO+Kg=;
 b=E1dQBbkrtUDbVwISoUl0RLNImuuiSrzaSnxvSn3I3awcmPwNPyg3S2hwTbaPsl1h5W9qc5
 85eOds5djgpWZrUMek338uxDyNImSzYVPKMw6EY1+j23+leiosSENPjj3bLFh+6TBEmMC0
 XqvpZm2cWyuuiLjfRr6YjJLkwCCpMXY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-FCpLPGtIOpurzQnOCADEoQ-1; Tue, 08 Feb 2022 15:09:17 -0500
X-MC-Unique: FCpLPGtIOpurzQnOCADEoQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 z205-20020a3765d6000000b0047db3b020dfso11722753qkb.22
 for <nouveau@lists.freedesktop.org>; Tue, 08 Feb 2022 12:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=I3/8UwtTiLaHjDIsw5ToTGGU9VaJhcJtecxqfQCO+Kg=;
 b=PiFtErJXF0uSzIefv+2jnxlD87EsKcYHyxAY+Nsew5cXNN0VGB72wO2MhZPsRGR+l2
 UvgjCytWaLr79SghDQJfP7omILYfkKHxiB26pjMKtQrpHqj3wQW2/l/mNSScfleLr/FY
 vOVAC7Hra/vLK3Tut5IYq+NFLtERbHzEsq2PwzBJChp1plKUJTzZgwws8ekT5oZFp32w
 R5ihA+K9zMJ5r1ZfQ5BU3Acqen8PGNFQ5WkWXsIuEPiFqz0sKC0qceyU2F4zblqgtEMX
 iXXq+Taa4cS5kGKIdigQWzmlmlFdxU0A4oEwIWZizPOf6UYGAsQG6Lno7yXc/fi7SrXI
 mgBA==
X-Gm-Message-State: AOAM532ooXXzQsruUpqPGy3qoHQ8IbU13jZxV6Ti/MRsLoG019B8w/e2
 f/5uhvBsj7V33v9dQ3+7uKcqiEbkh0m99OprOfVuJeEl274qkjJ+IYuV8vDAtmiAxbk9mjU2MMr
 IpIWAEqO6JzVqFouCQqBsI0YHJQ==
X-Received: by 2002:a05:6214:4111:: with SMTP id
 kc17mr4417585qvb.61.1644350957408; 
 Tue, 08 Feb 2022 12:09:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsREE/wlVXhB/X8tBjZ+cErEBHMvIYU1EUljfRg7HUFF85vJYIMBgalTBx0/F2MZWG8LFj8g==
X-Received: by 2002:a05:6214:4111:: with SMTP id
 kc17mr4417571qvb.61.1644350957203; 
 Tue, 08 Feb 2022 12:09:17 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id p70sm7253061qka.62.2022.02.08.12.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:09:16 -0800 (PST)
Message-ID: <58cc03e21bdf8665f402c7eb9beed557f19a4be2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 08 Feb 2022 15:09:04 -0500
In-Reply-To: <20220207233923.GA524723@embeddedor>
References: <20220207233923.GA524723@embeddedor>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH][next] nouveau/svm: Use struct_size() helper
 in nouveau_pfns_map()
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
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this to drm-misc-next, thanks!

On Mon, 2022-02-07 at 17:39 -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worse scenario, could lead to heap overflows.
> 
> Link: https://github.com/KSPP/linux/issues/160
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c
> b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 266809e511e2..46a5a1016e37 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -925,8 +925,8 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct
> mm_struct *mm,
>  
>         mutex_lock(&svmm->mutex);
>  
> -       ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, sizeof(*args)
> +
> -                               npages * sizeof(args->p.phys[0]), NULL);
> +       ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> +                               struct_size(args, p.phys, npages), NULL);
>  
>         mutex_unlock(&svmm->mutex);
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


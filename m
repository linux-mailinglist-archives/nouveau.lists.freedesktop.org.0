Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3976F553B13
	for <lists+nouveau@lfdr.de>; Tue, 21 Jun 2022 22:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4216411200D;
	Tue, 21 Jun 2022 20:02:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6369910FFFF
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jun 2022 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655841756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZyjZSjQZn3cKm/xWBINLzP0PpmZ5ysMHiqhpqzZXfWw=;
 b=NOXfa3TONmMTr1PGcNb+LEynd9yf3cyQisnsbaw9kGsBqqHWwVhrJ/GL+o+4vCXpmvMBBc
 I5nbz53opx36EcOyiCoB+zIRwdUY6sZj6mNTPBRAchCqf+INNG2qiFK9AozObBc8MgYk9H
 WwgtOIIl2IhS9u6oEmj8tjnX/J9HSas=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-u25fbaaaPhO5U2IedRu4lg-1; Tue, 21 Jun 2022 16:02:35 -0400
X-MC-Unique: u25fbaaaPhO5U2IedRu4lg-1
Received: by mail-qv1-f71.google.com with SMTP id
 e10-20020a0ce3ca000000b004702b8819beso11349494qvl.4
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jun 2022 13:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ZyjZSjQZn3cKm/xWBINLzP0PpmZ5ysMHiqhpqzZXfWw=;
 b=ZyqVqT6loXCYGThyEVr8NHCNtWJCKEbvD70fQu7Q16A+ZuFCkSCxdBaD13rw/TagEY
 Gu2uldUUICSXqlNegsc/VwGgB+sJ+M2KPW8CoR6JeyB6ZfZ49Xk00CH8VeE4HjJFPef8
 QEOOnAFscgl7a5+C5/xEZL2QQiS/9ZJ0Rq4MNIOq0KMfRqY0jefRL9FmH39UH75bN2XC
 Yyly8jiWyrp4x7nro2DBOEcWED3BXXtoNkrpMLHfKOVNYof1z15Ggpfnpijra2k6jaFS
 L3wId3SxNjNvns2Y1wrXaPJw20eT4APDMsY9NLiLmAqiIhzWWzGG+RnJgfKmH0UcHMVl
 +61A==
X-Gm-Message-State: AJIora83qnH1IpkhFk5GznlfFgYdHdQFJhq1/00RZNz40OFysq1hqvnU
 zXv+mksN/w5TOyXxQ5thW7WLJczs7reZ9pV1eJ8tH2y335USIywBBAmHT9JIZXNYcl9NnIWcKLh
 A7+AFmJZx6XyomhhIzZwddx3bCw==
X-Received: by 2002:a05:6214:1c85:b0:443:8347:d7a5 with SMTP id
 ib5-20020a0562141c8500b004438347d7a5mr24823090qvb.11.1655841754807; 
 Tue, 21 Jun 2022 13:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vM8IKeeTIvsIrRyl7KwkmjLpX2QVNqBVXs8SpNfFPLl/Lnzwb+9ION1EMSLPmdLICdu0qrNA==
X-Received: by 2002:a05:6214:1c85:b0:443:8347:d7a5 with SMTP id
 ib5-20020a0562141c8500b004438347d7a5mr24823049qvb.11.1655841754427; 
 Tue, 21 Jun 2022 13:02:34 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 br6-20020a05620a460600b006a6d3fa430csm14472268qkb.58.2022.06.21.13.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:02:33 -0700 (PDT)
Message-ID: <512685d31ec05034f67c71d9ce91a427828919e2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 21 Jun 2022 16:02:32 -0400
In-Reply-To: <20220621133920.8112-1-jiangjian@cdjrlc.com>
References: <20220621133920.8112-1-jiangjian@cdjrlc.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: drop unexpected word "the"
 in the comments
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
 dri-devel@lists.freedesktop.org, Julia.Lawall@inria.fr, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Tue, 2022-06-21 at 21:39 +0800, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be dropped
> 
> file: drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> line: 1051
>  * have the the deepest nesting of page tables.
> changed to
>  * have the deepest nesting of page tables.
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index ca74775834dd..ae793f400ba1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -1048,7 +1048,7 @@ nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct
> nvkm_mmu *mmu,
>         __mutex_init(&vmm->mutex, "&vmm->mutex", key ? key : &_key);
>  
>         /* Locate the smallest page size supported by the backend, it will
> -        * have the the deepest nesting of page tables.
> +        * have the deepest nesting of page tables.
>          */
>         while (page[1].shift)
>                 page++;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


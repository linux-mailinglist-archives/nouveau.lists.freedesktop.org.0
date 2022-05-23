Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3B5315D6
	for <lists+nouveau@lfdr.de>; Mon, 23 May 2022 21:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC8210FE43;
	Mon, 23 May 2022 19:52:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26C110FE43
 for <nouveau@lists.freedesktop.org>; Mon, 23 May 2022 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653335536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOYC9iIBfV1vzZrPUZwk0oyKY1xPZWZ/ayniepgLDTs=;
 b=eT6/ydLrLnAZFrKlyEznc9q50dQ8RlJKkQfWSefyKc2pAd2k0cOWbH1oBdubGMkP9V5cFa
 /NyhBTYaa3SrXWVhDNwNBvM93S/kFTfYuOEdFiDpFZBGHvV5iSJOclh11B/J24AuhogFIi
 MZk7TW8qly7k+yqObieG9jXDpG1Bjg0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-t95oLDuHOjmTBApmbbVofQ-1; Mon, 23 May 2022 15:52:15 -0400
X-MC-Unique: t95oLDuHOjmTBApmbbVofQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 cn8-20020a05622a248800b002f3c7be2744so12253733qtb.17
 for <nouveau@lists.freedesktop.org>; Mon, 23 May 2022 12:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=KOYC9iIBfV1vzZrPUZwk0oyKY1xPZWZ/ayniepgLDTs=;
 b=JS10O/gTvINWF1VAbdvoQnsyUX115qqOGw7sOrs3Y3ncdGc7VZprqaAKc2B+oltltp
 vyz1tukIN6mRLF9AseFYf2Jxx5MUjGtSv0jU2LfI9oXZhlZFgLzLg6/NtRfIabc8D00U
 U9aaO10b/xC9U8dOST2kGawJqXYo46B/xmNxKB+5ISHVQ2DNtxnkN2nUDY7DqTrZrdyV
 FF9KUaKZOQ72D/AFmAsgyjftgqHPqqINEEPd0aEt1QqRl+QGjsiSzlAq5Z1tB3XL6I7k
 1mI72OlokTCjvTvaqp5xNWbk7ElvtWskrltKQXN9OL4ioGHp3GWmRvn2gDyDpaxSwFxG
 apGw==
X-Gm-Message-State: AOAM530AtpQzc04Trhv92fWjFG5vrobvBP5eyDZRKkdY3T7clKF8gnLj
 tv2/x/mXNGNNjgJZJyabMHdv2jPyZQYgPXgUVqczqZTc5mW6l8/SkkGzhj0ro9xUWvoo2UjGkO7
 Q5NgbgD7AFTXr8bOn1CwBsLIinA==
X-Received: by 2002:a37:6650:0:b0:6a3:5fb9:7ff7 with SMTP id
 a77-20020a376650000000b006a35fb97ff7mr8582256qkc.90.1653335535108; 
 Mon, 23 May 2022 12:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgZ4upgTLufDFLOHGMjBcNkvM4E+LvXn+UyvlAfFfBcrNLQCi/YNJUO8bUY6aCMfrUg56p0w==
X-Received: by 2002:a37:6650:0:b0:6a3:5fb9:7ff7 with SMTP id
 a77-20020a376650000000b006a35fb97ff7mr8582253qkc.90.1653335534913; 
 Mon, 23 May 2022 12:52:14 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 v128-20020a372f86000000b006a33009158esm4838303qkh.119.2022.05.23.12.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 12:52:12 -0700 (PDT)
Message-ID: <70daebd6d65b34f5ab85f0286df9a539b5c62146.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 23 May 2022 15:52:11 -0400
In-Reply-To: <20220521111145.81697-57-Julia.Lawall@inria.fr>
References: <20220521111145.81697-57-Julia.Lawall@inria.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: fix typo in comment
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will fix that double space after the punctuation while I'm at it as well, and
will push to the appropriate branch in a little bit. Thanks!

On Sat, 2022-05-21 at 13:11 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 8bf00b396ec1..8b11dfa0998d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -280,7 +280,7 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn,
> u32 ptei, u32 ptes)
>         if (desc->type == SPT && (pgt->refs[0] || pgt->refs[1]))
>                 nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
>  
> -       /* PT no longer neeed?  Destroy it. */
> +       /* PT no longer needed?  Destroy it. */
>         if (!pgt->refs[type]) {
>                 it->lvl++;
>                 TRA(it, "%s empty", nvkm_vmm_desc_type(desc));
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


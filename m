Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D614F1B7D
	for <lists+nouveau@lfdr.de>; Mon,  4 Apr 2022 23:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E62310E316;
	Mon,  4 Apr 2022 21:23:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74D0C10E316
 for <nouveau@lists.freedesktop.org>; Mon,  4 Apr 2022 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649107401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfDyjcnnLyc2bSZ6jJAVhGllQHcKHgp84LgGIl4EXgM=;
 b=O/xKp+aaN01eINcwTDKyUl7NxBl5p8xF0gD53R5bsy6IveDGmG5wJhuJ1FY8pX4TQNnSEF
 BY09Z92CyZkTnant4pRtPKTIUgibfxGkyCJmn0gXOYOxJiI5fG7nh7tryVBjjLADr6vDDe
 zS0WUN6tlzAVqVXbH0JbuJGTUYEs2KE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-8llrrdOfNyOok4ESZlTEKA-1; Mon, 04 Apr 2022 17:23:20 -0400
X-MC-Unique: 8llrrdOfNyOok4ESZlTEKA-1
Received: by mail-qk1-f199.google.com with SMTP id
 w200-20020a3762d1000000b0067d2149318dso7118799qkb.1
 for <nouveau@lists.freedesktop.org>; Mon, 04 Apr 2022 14:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DfDyjcnnLyc2bSZ6jJAVhGllQHcKHgp84LgGIl4EXgM=;
 b=6hCWagmd9N93puBsnWTOPE6mmbduMaetSb85WWHh0cFa5AHHfKxKJ8Ef8irYyPbxiE
 8tcQ147VWPsi171vFR9yndMGc7qA9sdjrjqQuOTXk1+9KXGjedzxeiV434HfuAF6UkQ5
 dQ98XaCgQsQbbml5/8tBiukcKBUtYAHMZkrhcc+xrD8PZrus9j/6LMyIRhMnqdQxtXdY
 +n9WspZXT0j/q/Myq/R4987Wv3cAjTOGTapIZrNgJEZO7XTUebB+HMRFhuVbIFUOaud7
 3prjKAWMcsvwHwISDDrXzFru8Enfvv/OkOf2nMrcq+fcDSl+cBMKZPxlf3038dh2OkYP
 GxYw==
X-Gm-Message-State: AOAM533HCIYmPFUxI1k9uX6oC5Rjz4KRgeQV9Vywoza3RQTsMlmsPcLQ
 lmjH9oJ28n6PrlHCVqiziqHqBTI0sxGbx+NBsk+ED471GSbtypPB/k0m5fJRfwSWz/QDVbuCfZO
 UaCgne8qhfn37pr7nVpPlzq4QcQ==
X-Received: by 2002:a05:620a:2487:b0:67b:3113:f83f with SMTP id
 i7-20020a05620a248700b0067b3113f83fmr179296qkn.604.1649107399543; 
 Mon, 04 Apr 2022 14:23:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA/j5T9RBShOaLAqidOK7ozpdzXqamqb+Gc1f+d2xjbvub/SnKUIk0rJFYk2A/f+j9+SQqNg==
X-Received: by 2002:a05:620a:2487:b0:67b:3113:f83f with SMTP id
 i7-20020a05620a248700b0067b3113f83fmr179283qkn.604.1649107399340; 
 Mon, 04 Apr 2022 14:23:19 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac86b46000000b002e02be9c0easm8354800qts.69.2022.04.04.14.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 14:23:18 -0700 (PDT)
Message-ID: <74509d19d84b879b624fa9f40bc8186fd09e750a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, bskeggs@redhat.com, 
 kherbst@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 04 Apr 2022 17:23:17 -0400
In-Reply-To: <20220327075824.11806-1-xiam0nd.tong@gmail.com>
References: <20220327075824.11806-1-xiam0nd.tong@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.DarkModeFix.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] clk: base: fix an incorrect NULL check on
 list iterator
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This should probably be prefixed with the title "drm/nouveau/clk:", but I can
fix that before pushing it.

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push it to the appropriate repository shortly


On Sun, 2022-03-27 at 15:58 +0800, Xiaomeng Tong wrote:
> The bug is here:
>         if (nvkm_cstate_valid(clk, cstate, max_volt, clk->temp))
>                 return cstate;
> 
> The list iterator value 'cstate' will *always* be set and non-NULL
> by list_for_each_entry_from_reverse(), so it is incorrect to assume
> that the iterator value will be unchanged if the list is empty or no
> element is found (In fact, it will be a bogus pointer to an invalid
> structure object containing the HEAD). Also it missed a NULL check
> at callsite and may lead to invalid memory access after that.
> 
> To fix this bug, just return 'encoder' when found, otherwise return
> NULL. And add the NULL check.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1f7f3d91ad38a ("drm/nouveau/clk: Respect voltage limits in
> nvkm_cstate_prog")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 57199be082fd..c2b5cc5f97ed 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -135,10 +135,10 @@ nvkm_cstate_find_best(struct nvkm_clk *clk, struct
> nvkm_pstate *pstate,
>  
>         list_for_each_entry_from_reverse(cstate, &pstate->list, head) {
>                 if (nvkm_cstate_valid(clk, cstate, max_volt, clk->temp))
> -                       break;
> +                       return cstate;
>         }
>  
> -       return cstate;
> +       return NULL;
>  }
>  
>  static struct nvkm_cstate *
> @@ -169,6 +169,8 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct
> nvkm_pstate *pstate, int cstatei)
>         if (!list_empty(&pstate->list)) {
>                 cstate = nvkm_cstate_get(clk, pstate, cstatei);
>                 cstate = nvkm_cstate_find_best(clk, pstate, cstate);
> +               if (!cstate)
> +                       return -EINVAL;
>         } else {
>                 cstate = &pstate->base;
>         }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


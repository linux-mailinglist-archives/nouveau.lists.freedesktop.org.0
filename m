Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07951C8C5
	for <lists+nouveau@lfdr.de>; Thu,  5 May 2022 21:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A7610E710;
	Thu,  5 May 2022 19:15:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 19:15:52 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFF110E710
 for <nouveau@lists.freedesktop.org>; Thu,  5 May 2022 19:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651778151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxnXTkpEEA0ypiQkB3eztb9h9bG9xl88+4zCoT7tsso=;
 b=Al+AcNCrh55jJ6JMQb9mc0MsxH90FXqZacTZQ0yXV8ew30tyM1CONiGZn4hOZm4QmcssBJ
 099RwGeCnAyjIrDV5zh0bn5ke3o/fOw8EJyW8LvEviv5zk3jjPRaD3sBk5kS8oRXrq20MU
 Ri+69K9LDQ44wJ3tXf3j+1issAYmt8g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-Xqxrv_6uOw6eEzO3cJc_pA-1; Thu, 05 May 2022 15:09:43 -0400
X-MC-Unique: Xqxrv_6uOw6eEzO3cJc_pA-1
Received: by mail-qt1-f199.google.com with SMTP id
 g1-20020ac85801000000b002f3b281f745so4047981qtg.22
 for <nouveau@lists.freedesktop.org>; Thu, 05 May 2022 12:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ZxnXTkpEEA0ypiQkB3eztb9h9bG9xl88+4zCoT7tsso=;
 b=flVOboCIjE9Ibh0A3d2BljCAqN8xmcHIxnf0oldZVTc538Q3Vs1lulQl9VTDTiyMg2
 HDc65MnxnmCrYGlbsHM6zy4MHmOUGMtU30JwFG0N7utqSxxYfECo3vajIUe/S5iNbZNG
 cxlsCpi0Q558CCPH6az2LkGD4AtG1fkoZpDFQp4i4d0QvUu1q8sLOSuxSnfwahKPmdvQ
 AvbwMYhQn7XfNjWDGm+NQRKmJeelt8uiaF9YsVlXJXtfOqYME/c/qLA8OpIQ1lNsVDOm
 X7eMWMevyPszRT5D6RbvMI1ky7IxyGlVE/QIyQx/ga2Tys2BZDtM0Ojk6qLcFKAur1IB
 RKIA==
X-Gm-Message-State: AOAM531XPYnYEJHBO8of+Qvf9PGojQBRmbmHsUC+EnnZsUw/GSSfZpV3
 OEUXmDZnSP9sAuDQdJl47Do9jT7hoo2sZDLLC4psPNkJhd5PwPhaP97FbbOjDi67fLr+4gPvhHc
 +7BBIRAHVe1BDxu34Gn2+vqM60A==
X-Received: by 2002:ac8:5cc6:0:b0:2f1:ffa3:ef2b with SMTP id
 s6-20020ac85cc6000000b002f1ffa3ef2bmr25381842qta.518.1651777782900; 
 Thu, 05 May 2022 12:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb4sWIQkHXnwic3TWdV/eR5dZuyWfn9dc3NOluXljfI9qtqzg5cTFanA9fkQON5k6aPQx0Hg==
X-Received: by 2002:ac8:5cc6:0:b0:2f1:ffa3:ef2b with SMTP id
 s6-20020ac85cc6000000b002f1ffa3ef2bmr25381817qta.518.1651777782697; 
 Thu, 05 May 2022 12:09:42 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 u12-20020ac8750c000000b002f39b99f69csm1243350qtq.54.2022.05.05.12.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 12:09:42 -0700 (PDT)
Message-ID: <2b71f1e318af9819707de1aa61727f02a7e0a79f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, bskeggs@redhat.com
Date: Thu, 05 May 2022 15:09:40 -0400
In-Reply-To: <20220505081345.89762-1-jiapeng.chong@linux.alibaba.com>
References: <20220505081345.89762-1-jiapeng.chong@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/gr/gf100-: Clean up some
 inconsistent indenting
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Thanks!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Thu, 2022-05-05 at 16:13 +0800, Jiapeng Chong wrote:
> Eliminate the follow smatch warning:
> 
> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1925
> gf100_gr_oneinit_tiles() warn: inconsistent indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index 397ff4fe9df8..f16eabf4f642 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -1922,8 +1922,8 @@ gf100_gr_oneinit_tiles(struct gf100_gr *gr)
>  
>         for (i = 0; i < gr->gpc_nr; i++) {
>                 init_frac[i] = gr->tpc_nr[gpc_map[i]] * gr->gpc_nr *
> mul_factor;
> -                init_err[i] = i * gr->tpc_max * mul_factor - comm_denom/2;
> -                 run_err[i] = init_frac[i] + init_err[i];
> +               init_err[i] = i * gr->tpc_max * mul_factor - comm_denom/2;
> +               run_err[i] = init_frac[i] + init_err[i];
>         }
>  
>         for (i = 0; i < gr->tpc_total;) {

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


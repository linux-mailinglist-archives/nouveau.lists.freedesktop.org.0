Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA68C56AC43
	for <lists+nouveau@lfdr.de>; Thu,  7 Jul 2022 21:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7A210FA6C;
	Thu,  7 Jul 2022 19:55:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14EC10E57B
 for <nouveau@lists.freedesktop.org>; Thu,  7 Jul 2022 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Mo3Zl8VhFZlmNu+vKliCf9PrnP4k8cuE7bMp/19zYQ=;
 b=IXZXqkBaUWNS6UMZcjUh1iriVhcQBI/SwmEAi372JBSAZ84UrnRLK8CZ8N1BlsjF7dv5co
 czBDAstG9udbZb1bdRN9cxVoqqN97JOHJkpMCLGVwGqhvej1DeqFhRRj5fS19YQd4nWQ62
 64gAoimkHxKda1htX6R9KDFlvh5vakk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-31aRWnDyPrq6_4sKAoGprg-1; Thu, 07 Jul 2022 15:55:48 -0400
X-MC-Unique: 31aRWnDyPrq6_4sKAoGprg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bp10-20020a05620a458a00b006b265587a17so17018346qkb.2
 for <nouveau@lists.freedesktop.org>; Thu, 07 Jul 2022 12:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=4Mo3Zl8VhFZlmNu+vKliCf9PrnP4k8cuE7bMp/19zYQ=;
 b=I6a0AzKXlpj1APPDVD8wlZOk9deEs2wtNhEaoT7GdLCrIlwewr0c33WT5xy+olo3IR
 xizN/iJKRmwajMfAoXl/MRrTx3SMikXWMc072tAmd0aSuIT/QADju9XaMEWUoV7eTsCo
 qaBFekLBeVTXpty1pDqM0OhlrfAIVtbWGt/NtwSHjVRvaAJtgSQ4y6KuUF5/J0IGiSCV
 a4whZTJggmvRoMRC5nKeUnslyOdQ5Io+DNXlJyLCq37wMN8AIqT/5IR/Q6mZEhMklsxz
 H6qnoYDsWumEIPATwOm5GWuw4UCg/1BZ6FzhTFv0NR8dEgT1c6ePPYHIuiwS6g8or/zO
 lYmA==
X-Gm-Message-State: AJIora9LOFk6G/3uf0aXxozxziX4gne0ioCWMyYGm+zOwKIRQoWkyPrh
 hzP/CtDXk1b2pvCb+Xzkf+kfbD/Qalym7bYkhJwdGWEysNjHE9DOJbIEuF7VrHpohw5EDx2xrmt
 op+/MDVYxJhri8X0rhrnZSsHPRw==
X-Received: by 2002:a05:620a:a97:b0:6af:1394:1966 with SMTP id
 v23-20020a05620a0a9700b006af13941966mr31924313qkg.348.1657223748325; 
 Thu, 07 Jul 2022 12:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uL/JdDYPTjD7D3BFa0hLHVO+5vqO0/kmBCEI+jlAypJGlcReJaqO0oDq49OegV/weSeVsAqg==
X-Received: by 2002:a05:620a:a97:b0:6af:1394:1966 with SMTP id
 v23-20020a05620a0a9700b006af13941966mr31924302qkg.348.1657223748010; 
 Thu, 07 Jul 2022 12:55:48 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006afd667535asm23648140qkp.83.2022.07.07.12.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:55:47 -0700 (PDT)
Message-ID: <62827a27253727d92d6bfcf833a9ec4d3f7c7cd3.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jianglei Nie <niejianglei2021@163.com>, bskeggs@redhat.com, 
 kherbst@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 07 Jul 2022 15:55:46 -0400
In-Reply-To: <20220705094306.2244103-1-niejianglei2021@163.com>
References: <20220705094306.2244103-1-niejianglei2021@163.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/nouveau_bo: fix potential memory
 leak in nouveau_bo_alloc()
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
Cc: nouveau@lists.freedesktop.org, ri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push

On Tue, 2022-07-05 at 17:43 +0800, Jianglei Nie wrote:
> nouveau_bo_alloc() allocates a memory chunk for "nvbo" with kzalloc().
> When some error occurs, "nvbo" should be released. But when
> WARN_ON(pi < 0)) equals true, the function return ERR_PTR without
> releasing the "nvbo", which will lead to a memory leak.
> 
> We should release the "nvbo" with kfree() if WARN_ON(pi < 0)) equals true.
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 05076e530e7d..d0887438b07e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -281,8 +281,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size,
> int *align, u32 domain,
>                         break;
>         }
>  
> -       if (WARN_ON(pi < 0))
> +       if (WARN_ON(pi < 0)) {
> +               kfree(nvbo);
>                 return ERR_PTR(-EINVAL);
> +       }
>  
>         /* Disable compression if suitable settings couldn't be found. */
>         if (nvbo->comp && !vmm->page[pi].comp) {

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


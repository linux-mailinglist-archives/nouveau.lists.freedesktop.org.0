Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170AB510561
	for <lists+nouveau@lfdr.de>; Tue, 26 Apr 2022 19:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BA910E44B;
	Tue, 26 Apr 2022 17:26:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A210E44B
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650993988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIDKi1Fbqi03mYjNDUZNSZko/5hz16GhkjeizzJX6xo=;
 b=eRfWVOIre4i/K579Qc25dJvkQWJG/ae4Vq3boTMAZqphm05OUeDpfJz5raxfgbTqBPK9aD
 cMhzci1cnQvn7pdFUVn4IxHKYdaWSNrlRbLwIAnn9yUYnU005SNLnkFs9cYy56KKZBnFNL
 Hrs2VQUr2pnlFZc4PrHFG9UQlLclO9M=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-GqGIbqVrPE-xPqH4wAJpsg-1; Tue, 26 Apr 2022 13:26:27 -0400
X-MC-Unique: GqGIbqVrPE-xPqH4wAJpsg-1
Received: by mail-ua1-f71.google.com with SMTP id
 m16-20020ab05a50000000b003628807eda4so3395761uad.20
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 10:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=lIDKi1Fbqi03mYjNDUZNSZko/5hz16GhkjeizzJX6xo=;
 b=X1bVi43pS6ngWTqKYvwNDzaVg5wioKN2mNz3Gkbp/shUax4MoqtQHFH/9VTN8gRY7z
 y1J2rzDzW5LfNZt1RQNjsixGdy2Wo884Ohc+oAwc3EJlA++w2CW5QAqju6RyMx9ivOVW
 pPNjNFULoPQ/Ayzrkks4IfU8JismyApjB92jMQrSsUWeiSIhJK2O62K2HF8rbKSVX+IF
 xinVH8ZduC1qVBxSxUfbV6DydJMLOkJXELcDj+Shfrsqxf8kTGA8e3aYGB8WxuKycVB0
 kUdvZ9KULBwA2VWfl145LR9rnOSjnrgTI6BM3reVguMbkz7cPqwKtwnGw581clBMURak
 MBKw==
X-Gm-Message-State: AOAM5310utgbkY3NvX/i+B2XbQNaVqbdUnspYn/twsDmX4hROFpEAQZ3
 cgoQGNFvbn2rW9BD9vRHJyojumM+d8XO8iBSwVaPDyXtwjbjRV9Uxpn3rpk6Uqk0UTLqr8y25Uq
 NxA46LC2DCcEHrWj6qZHeWAt9qQ==
X-Received: by 2002:a67:e9d1:0:b0:32c:eb44:efd6 with SMTP id
 q17-20020a67e9d1000000b0032ceb44efd6mr911042vso.16.1650993986740; 
 Tue, 26 Apr 2022 10:26:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpFGyTlNOnTHUlqHT3HOBW9kR28MQd1k1z2LvC85IOws5IevLAC/JD+KnrsGzp3VspUMHE+w==
X-Received: by 2002:a67:e9d1:0:b0:32c:eb44:efd6 with SMTP id
 q17-20020a67e9d1000000b0032ceb44efd6mr911031vso.16.1650993986543; 
 Tue, 26 Apr 2022 10:26:26 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 b206-20020a1f34d7000000b003452c5cc13csm1672864vka.41.2022.04.26.10.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:26:25 -0700 (PDT)
Message-ID: <a46595078332c8e0ad801f3f8eb03ca9c11db8dc.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 26 Apr 2022 13:26:24 -0400
In-Reply-To: <20220422185132.3163248-1-trix@redhat.com>
References: <20220422185132.3163248-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/gv100: use static for
 gv100_disp_core_mthd_[base|sor]
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

Will push to the appropriate branch in a bit

On Fri, 2022-04-22 at 14:51 -0400, Tom Rix wrote:
> Sparse reports these issues
> coregv100.c:27:1: warning: symbol 'gv100_disp_core_mthd_base' was not
> declared. Should it be static?
> coregv100.c:43:1: warning: symbol 'gv100_disp_core_mthd_sor' was not
> declared. Should it be static?
> 
> These variables are only used in coregv100.c.  Single file use
> variables should be static, so add static to their storage-class specifier.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> index 448a515057c7..1d333c484a49 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> @@ -23,7 +23,7 @@
>  
>  #include <subdev/timer.h>
>  
> -const struct nv50_disp_mthd_list
> +static const struct nv50_disp_mthd_list
>  gv100_disp_core_mthd_base = {
>         .mthd = 0x0000,
>         .addr = 0x000000,
> @@ -39,7 +39,7 @@ gv100_disp_core_mthd_base = {
>         }
>  };
>  
> -const struct nv50_disp_mthd_list
> +static const struct nv50_disp_mthd_list
>  gv100_disp_core_mthd_sor = {
>         .mthd = 0x0020,
>         .addr = 0x000020,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411045AC9A
	for <lists+nouveau@lfdr.de>; Tue, 23 Nov 2021 20:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8C16E12C;
	Tue, 23 Nov 2021 19:36:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECABD6E0D9
 for <nouveau@lists.freedesktop.org>; Tue, 23 Nov 2021 19:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637696159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZfv1IAB1L4OKPDv7Z7zl3z7pjV3ugHQdTctCyaDB7o=;
 b=Ll1bpo9uRND0QmF9bPPAq0VYrpzd+qg/Dfadsd8oLoDaTiKm0d35aTWIjhvDEaqi0f+UgV
 4IQWoSxMqFr66KLH+2LE1KFZh6KGf1QK7NTHKu2eKsxgEcKVwNer8b9fyRoJvX+TK+a9S8
 6UAKPgyGwKkeVWZ54QBqCN8R2x5eXBk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-kwG3RGSbPM27pJCnTTdhFw-1; Tue, 23 Nov 2021 14:35:58 -0500
X-MC-Unique: kwG3RGSbPM27pJCnTTdhFw-1
Received: by mail-qt1-f198.google.com with SMTP id
 e14-20020a05622a110e00b002b0681d127eso233279qty.15
 for <nouveau@lists.freedesktop.org>; Tue, 23 Nov 2021 11:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rZfv1IAB1L4OKPDv7Z7zl3z7pjV3ugHQdTctCyaDB7o=;
 b=jFnxBJeS7FNd3HRphQoBLoaGw3ASqGasJKfFxnX1x5juCMb+5+vObycwE5E5gVPTXa
 qx+onhBerNtpl1q5hHpGJqJ+XsDNu3XJkJNa8UfZvkCFLYAtrB2+26YEpc717+tagW7B
 VngYHCdiZH3M3mgdDPBJ0BbEnNRwjhCoGGWxA/P9d13edLl2Z6VlSriiOuVfZeFrcrqT
 7A3JrV/SYdn7jNXUCGNyLNXnHuKPY4O855mkpB+gnSFvRkZjafHzUikhLB198mHAuXXF
 sNl0H6HO/bcNO2arWDiMMGZVl59DdBv+C/0xiuDxxIyYCgyfm437SvAd8Me5Vpj2Vh54
 uqLQ==
X-Gm-Message-State: AOAM530U/i/3RzJm94L5g6jaRPKTSkrNf+ss1ZHBz6rWEsbIEF/wsHOZ
 gOzi4l9/WQ0z5G3ZE7psZeGBRR1eVgU/5wA41vOmOuND1FllC4N7DaCN5BIRnLOnja9hKoPSWoq
 mOYGGaR+V5X/UlyASyxIN4giiyw==
X-Received: by 2002:a05:622a:13c9:: with SMTP id
 p9mr9530986qtk.47.1637696158322; 
 Tue, 23 Nov 2021 11:35:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd9aJm8SZb+wfUFsxDgSU42rVqDIpUUlYw//me57YbMeMFl74fEpjtGIzlLmPaOts6c7+/Mg==
X-Received: by 2002:a05:622a:13c9:: with SMTP id
 p9mr9530939qtk.47.1637696158082; 
 Tue, 23 Nov 2021 11:35:58 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id m15sm6726097qkp.76.2021.11.23.11.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 11:35:57 -0800 (PST)
Message-ID: <4dd933d333194ff8a676fcafdd5c9ef19f002c92.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 23 Nov 2021 14:35:55 -0500
In-Reply-To: <20211118111314.GB1147@kili>
References: <20211118111314.GB1147@kili>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: fix a couple NULL vs
 IS_ERR() checks
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

Will push this to drm-misc in a bit

On Thu, 2021-11-18 at 14:13 +0300, Dan Carpenter wrote:
> The nvkm_acr_lsfw_add() function never returns NULL.  It returns error
> pointers on error.
> 
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> "secure boot"")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c | 6 ++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> index cdb1ead26d84..82b4c8e1457c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> @@ -207,11 +207,13 @@ int
>  gm200_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>  
>         while (hdr->falcon_id != WPR_HEADER_V0_FALCON_ID_INVALID) {
>                 wpr_header_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)-
> >falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>  
>         return 0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> index fb9132a39bb1..fd97a935a380 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> @@ -161,11 +161,13 @@ int
>  gp102_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header_v1 *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>  
>         while (hdr->falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
>                 wpr_header_v1_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)-
> >falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>  
>         return 0;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63F6264AD
	for <lists+nouveau@lfdr.de>; Fri, 11 Nov 2022 23:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D14510E8E6;
	Fri, 11 Nov 2022 22:36:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782D410E8E6
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 22:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668206156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhguikNfjP3jJj2Xsd2EMwn1nCtYD4FWU8eudH5AFMc=;
 b=MA25sQIWc0ddhfcddwraC+TGkTSaolZURMyA95vQifXHSXfSnErndfi5RZvFnMsea6JBOt
 KnJQrNSSVS1D5A/I36dag2YGU/DU5ZZeJ0lv9P65K+QpkR861crckkqzW85+bmxe3Hfzsr
 LxmcnKxy8mv7vPkDpb0gteQR3CpU1+w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-BjiXoeoFMH24723jF8-OPg-1; Fri, 11 Nov 2022 17:35:55 -0500
X-MC-Unique: BjiXoeoFMH24723jF8-OPg-1
Received: by mail-qk1-f198.google.com with SMTP id
 ay43-20020a05620a17ab00b006fa30ed61fdso5774116qkb.5
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 14:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhguikNfjP3jJj2Xsd2EMwn1nCtYD4FWU8eudH5AFMc=;
 b=n/+1HOnRdRnTLCi1UeYkcgQ3I9VmxpIult9oB1JNlECAyqUBB8D32B4IKZO15TpcGo
 guCV6TbA/Lv4JLCJZguqethX4yzVjn9T4BmVyHPLYZJs8aKtaR9aPH+WOSjM/UkAaRQ0
 sguqi/kiWG8wVNAZLGOCHuvuiyEfMQ1a0C3yL73CJ+t1yjM1wPUGgbdbs4DZvrstWyAk
 ScDWLkaHlHJ/Mt0/+Tc4fH88pz/RxJR6DZdEtHgZivo2ZQUdaOyBF/fPTj1QuWVvF42Z
 bJ74UgIrtTjvafcaIlJtPO7Ho9+/MhN8IXRInuvjNow0c2/40ZcfYEuCb87VdDbs/0K1
 j6ww==
X-Gm-Message-State: ANoB5pkkhDi8zKjoRqKqT78Vit8zh/SanoHbFsxNsd6DeWMmExJbRwj6
 XP0jYqSDdccHNxdu36pgfEjXASUq/HFxgdP/161lyvFnCjaom5MnXqq9UiGJ/z+JgHFTsK0uT9D
 yjhN65toDAy1/id209YjXasMn8A==
X-Received: by 2002:a05:620a:6c6:b0:6fa:3aa2:3269 with SMTP id
 6-20020a05620a06c600b006fa3aa23269mr3031012qky.580.1668206154909; 
 Fri, 11 Nov 2022 14:35:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6W/KXwux5rPH6dWDWepLU+USDtFNI5v0KJ6gDMc3Hi176iuyM26xOcvo8FvrRu0zkBEIu9xg==
X-Received: by 2002:a05:620a:6c6:b0:6fa:3aa2:3269 with SMTP id
 6-20020a05620a06c600b006fa3aa23269mr3031002qky.580.1668206154708; 
 Fri, 11 Nov 2022 14:35:54 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a05620a0d8700b006fafaac72a6sm2203033qkl.84.2022.11.11.14.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:35:53 -0800 (PST)
Message-ID: <b4f731226c27150cc776d87a1175859d22acd666.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, bskeggs@redhat.com
Date: Fri, 11 Nov 2022 17:35:52 -0500
In-Reply-To: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
References: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 1/5] drm/nouveau/nvfw/acr: make
 wpr_generic_header_dump() static
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
Cc: nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a bit

On Fri, 2022-11-11 at 17:11 +0800, Jiapeng Chong wrote:
> This symbol is not used outside of acr.c, so marks it static.
> 
> drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for ‘wpr_generic_header_dump’.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3023
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> index 83a9c48bc58c..7ac90c495737 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> @@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
>  	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
>  }
>  
> -void
> +static void
>  wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
>  {
>  	nvkm_debug(subdev, "wprGenericHeader\n");

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


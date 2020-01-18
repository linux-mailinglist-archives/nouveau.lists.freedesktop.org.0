Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291DF141527
	for <lists+nouveau@lfdr.de>; Sat, 18 Jan 2020 01:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5F56F978;
	Sat, 18 Jan 2020 00:19:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3576D6F978
 for <nouveau@lists.freedesktop.org>; Sat, 18 Jan 2020 00:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579306746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkMRlosfOBwcGR259WMKcKORYoc0cAsdlRRPRABPESI=;
 b=K9Y7Jt9vuCs+F6Ok/bmD/N/bO//L5wDJc9m90LngXyRxXe+BEH7VYiOCootC1uqxD3USYy
 DylD9zdPv1y8NtfVj0CI43vBUCDPWWFv5+6XEigaoeb4Ofq2bJkyVu6SpaGmZBPqFW1VF1
 REX5Zjf3uWc2x2sOqyd8rOEcbPI72TQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-up6f1KE1MqCrBDUndW3Gtw-1; Fri, 17 Jan 2020 19:19:02 -0500
Received: by mail-qv1-f71.google.com with SMTP id z12so16847506qvk.14
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2020 16:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=nkMRlosfOBwcGR259WMKcKORYoc0cAsdlRRPRABPESI=;
 b=iLqkRA4VpDbYxO09LhkMT5l/bxDXcScjzZilO5MW+mKc3XcBEoHnsxpaPIQPiGt4BV
 rRsMSsLtxAMz9D/vk8/pfYZDqyQnmxAusX4QakHbpkBWTzUxLM+jUN7fjDBQG4b7fqkf
 Tjch500TX/UUi2Vw36QcQaydH/IAADhr+rogLVssJlgD6WEOEnVeZucHlw3wu1WSgZjn
 fYmPRHx2kLiwsIg7VcvJdkIbKAMZVGIGYZToNTMBtw0BYeh06idKymm89evfA5O78Wl8
 LqegthSiphkkZEY13+TkEh71ouuXlac+KnfdcZDbdKT7GDcAV0+3cwVFmsC9Jcmk5iw+
 NwYA==
X-Gm-Message-State: APjAAAUtt0WVSYw4gl1IwvXs5d1YNIt3LcC66X9yb7oUsq1+Juuz0xZi
 iGXqc+mWY40rbQi/DVVv101aMDnMzTcv3Xt97BoK5DxpkZ0L8jf7ZDvOSdbdQL6Dm3eZcAwTL7z
 LHQX2eRNXHB2XbPlJlxZ5lVPZTQ==
X-Received: by 2002:a0c:e58e:: with SMTP id t14mr10162445qvm.131.1579306742079; 
 Fri, 17 Jan 2020 16:19:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNTy3Zp7IZPvd77D4uDVi5088sphWrG/dsjizjp3pS33LcWWWKx4ZUjCa0TdoqrXJ1spKRQQ==
X-Received: by 2002:a0c:e58e:: with SMTP id t14mr10162421qvm.131.1579306741879; 
 Fri, 17 Jan 2020 16:19:01 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id r28sm14155261qtr.3.2020.01.17.16.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 16:19:01 -0800 (PST)
Message-ID: <c99174eefb65688c3db3fc25ddec819a58dccc6a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: YueHaibing <yuehaibing@huawei.com>, bskeggs@redhat.com,
 airlied@linux.ie,  daniel@ffwll.ch, alexander.deucher@amd.com,
 sam@ravnborg.org
Date: Fri, 17 Jan 2020 19:19:00 -0500
In-Reply-To: <20200117033642.50656-1-yuehaibing@huawei.com>
References: <20200117033642.50656-1-yuehaibing@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: up6f1KE1MqCrBDUndW3Gtw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/kms/nv50: remove set but
 not unused variable 'nv_connector'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2020-01-17 at 11:36 +0800, YueHaibing wrote:
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function nv50_pior_enable:
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1672:28: warning:
>  variable nv_connector set but not used [-Wunused-but-set-variable]
> 
> commit ac2d9275f371 ("drm/nouveau/kms/nv50-: Store the
> bpc we're using in nv50_head_atom") left behind this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 5fabe2b..a82b354 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1669,7 +1669,6 @@ nv50_pior_enable(struct drm_encoder *encoder)
>  {
>  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>  	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
> -	struct nouveau_connector *nv_connector;
>  	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
>  	struct nv50_core *core = nv50_disp(encoder->dev)->core;
>  	u8 owner = 1 << nv_crtc->index;
> @@ -1677,7 +1676,6 @@ nv50_pior_enable(struct drm_encoder *encoder)
>  
>  	nv50_outp_acquire(nv_encoder);
>  
> -	nv_connector = nouveau_encoder_connector_get(nv_encoder);
>  	switch (asyh->or.bpc) {
>  	case 10: asyh->or.depth = 0x6; break;
>  	case  8: asyh->or.depth = 0x5; break;
-- 
Cheers,
	Lyude Paul

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06B15105E2
	for <lists+nouveau@lfdr.de>; Tue, 26 Apr 2022 19:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC6110E63F;
	Tue, 26 Apr 2022 17:46:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9084010E63F
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650995216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faLawbnhHW02EYrXGuASXIKJnZrxT+4fARzUkA4OZ1c=;
 b=HWiZ5bLqPLZDIkU2Xska28y0s29XViiVXmeFTaSOw3mSI3E7wIgKK6Etbf2KQ2Ierm5XZR
 RyR+ALaqE/QuXQa7uW03sgXBh3g+R9mjKWpmeoIpa97MpYtMxaKjPn43a9wCdTDwIpo+fD
 viKx7hbeeao4sWjgM7H1pd7HQzXwcf8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-x5vQ4_McNFmVETe3O5RFaw-1; Tue, 26 Apr 2022 13:46:55 -0400
X-MC-Unique: x5vQ4_McNFmVETe3O5RFaw-1
Received: by mail-qk1-f200.google.com with SMTP id
 k15-20020a05620a07ef00b0069eab7275d5so12201661qkk.5
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 10:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=faLawbnhHW02EYrXGuASXIKJnZrxT+4fARzUkA4OZ1c=;
 b=eWVQ9E9+lFmDLrvX1/jQ8LmU/W/AT2PBzjsZLmd/VS1nkGoaDwpVjRNADWw+Lf9xC1
 mpFEuy8t3msuvCCj9AoC/IlifSvN+JadcaYiMcRKeo/tNndwPdCS/L3TJA5lCOuHCygt
 Jc5G1R1OIhshkXZVLgvA0ehtBVKW8X0rpO1FbWsPRYtxikYOs6vmiDH7tfhnPBudum/v
 NGSB82NQy9WCG/r433ablgQOxAh/rh1URL2mkg86Ubw0Gb9caJWgr7mKOuE7SnK6kF0a
 uc9MJ8PFLmzzuKrfYYV/u3tpOtqA5bT8El3UsRQT8QtWQQkjRzYR+AQaTUsHOR7XLl1H
 KUzQ==
X-Gm-Message-State: AOAM533cPzIYI9FQypK7w45b/dCtBrkpq0Nu6OtWpmMRhSmI5vOv9Uv2
 z8mQZ+ErvtKBYX4ujWp81tTt+TESev1J8IT1rfD00WAGyyv1/VtN9/zd7NwLxeIf5Dxs0TWw7A1
 U5tnUv7lLk1MJTJuPLZ/gZxo5Xw==
X-Received: by 2002:a05:620a:108a:b0:69e:7d3c:7230 with SMTP id
 g10-20020a05620a108a00b0069e7d3c7230mr13769266qkk.616.1650995214739; 
 Tue, 26 Apr 2022 10:46:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEOSHVXcCeNEv+IDmrQTu6C7S63JG6GilAnmFbTugdP8U7PQOfDNm67g0JW/sLepxLrIYkOg==
X-Received: by 2002:a05:620a:108a:b0:69e:7d3c:7230 with SMTP id
 g10-20020a05620a108a00b0069e7d3c7230mr13769257qkk.616.1650995214552; 
 Tue, 26 Apr 2022 10:46:54 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 76-20020a370c4f000000b0069f62e55f65sm2895549qkm.107.2022.04.26.10.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:46:53 -0700 (PDT)
Message-ID: <7f2ac9892b93d452a728d07a49a4446b81ce76be.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 26 Apr 2022 13:46:52 -0400
In-Reply-To: <20220425131308.158635-1-trix@redhat.com>
References: <20220425131308.158635-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wndw
 and gv100_disp_wndw_mthd static
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

Will push upstream in a moment

On Mon, 2022-04-25 at 09:13 -0400, Tom Rix wrote:
> Sparse reports these issues
> wndwgv100.c:120:1: warning: symbol 'gv100_disp_wndw_mthd' was not declared.
> Should it be static?
> wndwgv100.c:140:1: warning: symbol 'gv100_disp_wndw' was not declared.
> Should it be static?
> 
> These variable are only used in wndwgv100.c.  Single file variables should
> be static.
> So use static as their storage-class specifiers.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> index 5d3b641dbb14..e635247d794f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> @@ -116,7 +116,7 @@ gv100_disp_wndw_mthd_base = {
>         }
>  };
>  
> -const struct nv50_disp_chan_mthd
> +static const struct nv50_disp_chan_mthd
>  gv100_disp_wndw_mthd = {
>         .name = "Window",
>         .addr = 0x001000,
> @@ -136,7 +136,7 @@ gv100_disp_wndw_intr(struct nv50_disp_chan *chan, bool
> en)
>         nvkm_mask(device, 0x611da4, mask, data);
>  }
>  
> -const struct nv50_disp_chan_func
> +static const struct nv50_disp_chan_func
>  gv100_disp_wndw = {
>         .init = gv100_disp_dmac_init,
>         .fini = gv100_disp_dmac_fini,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


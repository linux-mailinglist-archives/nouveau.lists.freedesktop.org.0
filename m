Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342475105E1
	for <lists+nouveau@lfdr.de>; Tue, 26 Apr 2022 19:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF32110E44B;
	Tue, 26 Apr 2022 17:46:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1F610E3BC
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 17:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650995201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyHFMRMYec8pKum11uE5p2KKdtxqjNqZDXrySSGMmcw=;
 b=eaJJu+cH1LhrvdsUd6l4PMQgDjtu//NEJ+n2xzhqI+G9O61JkHhtl3ZdKFoz9AFoXrX5AL
 svfkXEKfFKywIUMT6lRDQppRmVOMMp6eydji1sNXHWClsb5hEx0TkR3WoishbE/mycJazm
 DA+/pkukmp+71dLoyNwIJhAOSuwP1j4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-R-Tkg-OdNhy-QmJAh3Z6zQ-1; Tue, 26 Apr 2022 13:46:39 -0400
X-MC-Unique: R-Tkg-OdNhy-QmJAh3Z6zQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 s63-20020a372c42000000b0069ec0715d5eso12192554qkh.10
 for <nouveau@lists.freedesktop.org>; Tue, 26 Apr 2022 10:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UyHFMRMYec8pKum11uE5p2KKdtxqjNqZDXrySSGMmcw=;
 b=wwmDe3RblB5vxvGRmPMcbLKkGnVWCTY5DO6DT+kasN1X2JyfVJRnSORA0WTCHsHYDc
 1+5It4pGaYoZWXG+ZtQxXYs7BenTpviNF/L3N/GLJoPdAh2vYx+EoNpuxWqeyWHfkHyf
 YEBViTOO2Z1UhEjKp6Y52Ig8yYZUzCClDMHLOLf8S+fr9+ukWhfEtONtzHwiiwncXKuW
 DAj4+ZpiQTeb6Cv/DIFEOuGfUxMqIpHdWOqjcVFScrI86awCTSUv4ih9H36M7Fsk9Blg
 CId2LLew/7C7vlqnYemSa9DOeKrcxSPP1MtmRgGqqKpWCYMzKreSQPvvQLo3adWK8YIj
 o1sA==
X-Gm-Message-State: AOAM532gLBFmxMo3ezkapSRF03HFzfUad91RynK2s2UPkO2ZGx1R8/QY
 vO/xAB29yDvyyJNUH5uz2DpeBbPwpRYnQfSlKaHsCj7rjRyKd2qSexGXhoLBel/C9HuPP3a5xJy
 TScyDpEqAZ8S7Yiqs3i/gn41RJA==
X-Received: by 2002:a05:6214:c4d:b0:449:7011:56d0 with SMTP id
 r13-20020a0562140c4d00b00449701156d0mr17055897qvj.70.1650995199339; 
 Tue, 26 Apr 2022 10:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytQo4guo50H9GZxl1ELWFz7ma3vpp9ula5MxUUZOqiIR/U1tsZlJzmD9Gpb2jw0WaPhaKbqg==
X-Received: by 2002:a05:6214:c4d:b0:449:7011:56d0 with SMTP id
 r13-20020a0562140c4d00b00449701156d0mr17055867qvj.70.1650995199030; 
 Tue, 26 Apr 2022 10:46:39 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 v7-20020a379307000000b0069c0a2afc55sm6966783qkd.123.2022.04.26.10.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:46:38 -0700 (PDT)
Message-ID: <1c11c3b9647829e197fb262c4afb66739fc7eca4.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 26 Apr 2022 13:46:37 -0400
In-Reply-To: <20220425130050.1643103-1-trix@redhat.com>
References: <20220425130050.1643103-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wimm
 static
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

On Mon, 2022-04-25 at 09:00 -0400, Tom Rix wrote:
> Sparse reports this issue
> wimmgv100.c:39:1: warning: symbol 'gv100_disp_wimm' was not declared. Should
> it be static?
> 
> This variable is only used in wimmgv100.c.  Single file variables should be
> static.
> So use static as its storage-class specifier.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> index 89d783368b4f..bb4db6351ddf 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> @@ -35,7 +35,7 @@ gv100_disp_wimm_intr(struct nv50_disp_chan *chan, bool en)
>         nvkm_mask(device, 0x611da8, mask, data);
>  }
>  
> -const struct nv50_disp_chan_func
> +static const struct nv50_disp_chan_func
>  gv100_disp_wimm = {
>         .init = gv100_disp_dmac_init,
>         .fini = gv100_disp_dmac_fini,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


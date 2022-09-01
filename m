Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552AC5AA0C6
	for <lists+nouveau@lfdr.de>; Thu,  1 Sep 2022 22:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1404C10E2DA;
	Thu,  1 Sep 2022 20:16:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA0410E20D
 for <nouveau@lists.freedesktop.org>; Thu,  1 Sep 2022 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662063387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShxcPF4Eq/4VuhK0YuLPN2dIglWIe3dTsSJxTWOrspQ=;
 b=RUL2FUJFiRVdFABhzSQ++8T5JHXq2ZTaTjKAT22CK04/XjFqW0oAqnPEArqGe1MnICvi8f
 +Np6YKTUUGfPZLPvbw/It/7dQhNG068LT/jes2MWhYij1uNHei32lNHJfA7y809RKY8uu0
 ED1hBLWFC+K62ptN246AbL7vAh26Nps=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-uF3kYfa8OKigyxR9romJug-1; Thu, 01 Sep 2022 16:16:26 -0400
X-MC-Unique: uF3kYfa8OKigyxR9romJug-1
Received: by mail-qv1-f71.google.com with SMTP id
 y5-20020a056214016500b004992ae3b0c2so2134272qvs.22
 for <nouveau@lists.freedesktop.org>; Thu, 01 Sep 2022 13:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ShxcPF4Eq/4VuhK0YuLPN2dIglWIe3dTsSJxTWOrspQ=;
 b=frW2pEVejhqeDFlVsbQOGKmkUg48JxZlhKqgRl3d2ZXlySHqDFPZx3G0cyrWdbuLE9
 v2Kar7sRtp+0X4YKzMVtMOFu235aQfDdcUEsZ2k9kVYq0rwKC/DaItxIIFEdjY6kXcAc
 pz2/Tr0dKzuqDASwOnsiu9ckiulXZq9qtLr9e3VUAe1WaQ/X9i8pGLMc3wPbCQHw1i2n
 KlulgEmlN0nYpIQEBV5GoGWZZx6sC1vfm/gfrRxl2M9GRU+YYFlCctJQJDr3kqLatNYg
 pRmndC9QrycLB4kR1awWqdvLo0ICtn04BsikHDa6OWQv0xBehvyOlkpn2+3waHDuWc6I
 bfvw==
X-Gm-Message-State: ACgBeo1e46o9LzxGB0YjxlSNc05PvYc/23ewqXfNNCRupFASQXqKPKT5
 J1WsbzISVYsBJV02otPGrZ/f64oc5uYEzy50/v9mfN8vnPQJSznU/gwbAEy6ydsB+ARdqIVyd8e
 sanspvDsQ44vGEUlJnh7sUDgrxA==
X-Received: by 2002:a05:620a:4553:b0:6bb:1dd0:e44c with SMTP id
 u19-20020a05620a455300b006bb1dd0e44cmr21170561qkp.543.1662063386417; 
 Thu, 01 Sep 2022 13:16:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4SXoUZt30A0xKlvUByAmirOD7wWDVTeEB40+CkCT1+zPJotJQ/iOqWav7vFUEdmX088i/ZHA==
X-Received: by 2002:a05:620a:4553:b0:6bb:1dd0:e44c with SMTP id
 u19-20020a05620a455300b006bb1dd0e44cmr21170540qkp.543.1662063386195; 
 Thu, 01 Sep 2022 13:16:26 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00:e786:1aff:4f5c:c549?
 ([2600:4040:5c48:e00:e786:1aff:4f5c:c549])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a05620a28c100b006b5e1aeb777sm12671930qkp.43.2022.09.01.13.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 13:16:25 -0700 (PDT)
Message-ID: <4a44b0d4511e20fc32a9d9de8e6d12ec62c9f51b.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Thu, 01 Sep 2022 16:16:24 -0400
In-Reply-To: <e2fa3e97b0989a50b9050d0518844d1f403385ea.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
 <e2fa3e97b0989a50b9050d0518844d1f403385ea.1662036058.git.jani.nikula@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 2/9] drm/nouveau: convert to using is_hdmi and
 has_audio from display info
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Also, went ahead and tested this for you on one of my machines:

Tested-by: Lyude Paul <lyude@redhat.com>

On Thu, 2022-09-01 at 15:47 +0300, Jani Nikula wrote:
> Prefer the parsed results for is_hdmi and has_audio in display info over
> calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
> respectively.
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
>  drivers/gpu/drm/nouveau/dispnv50/head.c     | 8 +-------
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>  3 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 33c97d510999..d0d9494b729c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -769,7 +769,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
>  				     (0x0100 << nv_crtc->index),
>  	};
>  
> -	if (!drm_detect_monitor_audio(nv_connector->edid))
> +	if (!nv_connector->base.display_info.has_audio)
>  		return;
>  
>  	mutex_lock(&drm->audio.lock);
> @@ -839,7 +839,7 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
>  	int ret;
>  	int size;
>  
> -	if (!drm_detect_hdmi_monitor(nv_connector->edid))
> +	if (!nv_connector->base.display_info.is_hdmi)
>  		return;
>  
>  	hdmi = &nv_connector->base.display_info.hdmi;
> @@ -1705,7 +1705,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
>  
>  	if ((disp->disp->object.oclass == GT214_DISP ||
>  	     disp->disp->object.oclass >= GF110_DISP) &&
> -	    drm_detect_monitor_audio(nv_connector->edid))
> +	    nv_connector->base.display_info.has_audio)
>  		hda = true;
>  	nv50_outp_acquire(nv_encoder, hda);
>  
> @@ -1721,7 +1721,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
>  			 */
>  			if (mode->clock >= 165000 &&
>  			    nv_encoder->dcb->duallink_possible &&
> -			    !drm_detect_hdmi_monitor(nv_connector->edid))
> +			    !nv_connector->base.display_info.is_hdmi)
>  				proto = NV507D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS;
>  		} else {
>  			proto = NV507D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index c3c57be54e1c..8b5bc834f1b3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -127,14 +127,8 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
>  	struct drm_display_mode *omode = &asyh->state.adjusted_mode;
>  	struct drm_display_mode *umode = &asyh->state.mode;
>  	int mode = asyc->scaler.mode;
> -	struct edid *edid;
>  	int umode_vdisplay, omode_hdisplay, omode_vdisplay;
>  
> -	if (connector->edid_blob_ptr)
> -		edid = (struct edid *)connector->edid_blob_ptr->data;
> -	else
> -		edid = NULL;
> -
>  	if (!asyc->scaler.full) {
>  		if (mode == DRM_MODE_SCALE_NONE)
>  			omode = umode;
> @@ -162,7 +156,7 @@ nv50_head_atomic_check_view(struct nv50_head_atom *armh,
>  	 */
>  	if ((asyc->scaler.underscan.mode == UNDERSCAN_ON ||
>  	    (asyc->scaler.underscan.mode == UNDERSCAN_AUTO &&
> -	     drm_detect_hdmi_monitor(edid)))) {
> +	     connector->display_info.is_hdmi))) {
>  		u32 bX = asyc->scaler.underscan.hborder;
>  		u32 bY = asyc->scaler.underscan.vborder;
>  		u32 r = (asyh->view.oH << 19) / asyh->view.oW;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 1991bbb1d05c..2ef5fb8df4ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1012,7 +1012,7 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
>  	unsigned duallink_scale =
>  		nouveau_duallink && nv_encoder->dcb->duallink_possible ? 2 : 1;
>  
> -	if (drm_detect_hdmi_monitor(nv_connector->edid)) {
> +	if (nv_connector->base.display_info.is_hdmi) {
>  		info = &nv_connector->base.display_info;
>  		duallink_scale = 1;
>  	}

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


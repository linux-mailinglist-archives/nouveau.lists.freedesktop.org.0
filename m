Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB87B099E
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 18:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD02410E55F;
	Wed, 27 Sep 2023 16:07:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0983710E55F
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695830874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dmc5VmRD75N5MrwkjQkOMmpHbgV6BLNCT6oM/cgrosQ=;
 b=R32qGWQ+husnVbwqfNjjucdSMaRYYlZoorFaJsvq4kppQFpQTVlKYdCRyafEF6QMXd7nQ0
 tgy5wRlQxWhJIV9CdrSeLpOxWXM3fjYI44FNno6P7UA+WzHcwfXe3nGuA+FNqQm54jfntC
 ePtJ3dDoZxoBVBijEznhmgDm4teyNlQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-VWYSAUULM6eM-kMgaSeQyQ-1; Wed, 27 Sep 2023 12:07:52 -0400
X-MC-Unique: VWYSAUULM6eM-kMgaSeQyQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9ae686dafedso974619966b.3
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 09:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695830871; x=1696435671;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dmc5VmRD75N5MrwkjQkOMmpHbgV6BLNCT6oM/cgrosQ=;
 b=n7qICjkGfO8wkqwIkGCaAH/OuP5DehiCFKJeBf9gVbav5xM/HE7+rw9ZSJHSy1gTkM
 lij9mf+ZCz30ePsjM48ApPWk1D9Ilr4k8uRTTuVPqjEVMcGDaKJ7+J1jRJforv0ps7tN
 yv/8S6pBfoOQYsRKoqEtc0h5x7w3Wvyj8joVy0EKzYDklTtw9Ih1nv2Hi+eYzp/Fd8d9
 Okek7+u9HL/NvGTWBh8HKWvt/ObO+QD5X/ebVAvMaYBuoTFbDmis90jX7xjeWDIHdGUC
 +DU3IwgTlDsZZ+Lngd71i3YPpDHztUAPe5lGc3GZ6/HF+rNhQLM3e7X3FZYt3Cl23xBp
 fGvQ==
X-Gm-Message-State: AOJu0YxfQQk1tL11BDGvHDWEhPb4vFV8pRu9/dPwM4zsUESWFdHNKNus
 GM/rzXfjjmHUIDPuXv7944Rwbj/laNJwaspjCTwqT1EKkvvzGIQ4BoB1JC0hPeVfkiGCdUECj7Z
 szcniOg1KJtegORzwcLiFeaW2dg==
X-Received: by 2002:a17:906:cc4a:b0:9a5:852f:10ae with SMTP id
 mm10-20020a170906cc4a00b009a5852f10aemr2068147ejb.60.1695830871397; 
 Wed, 27 Sep 2023 09:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEScE57Oifvf88LVHOFmgxtaT4lQ7JAGP2BjnoUvP4S8zYBm//vVNHqB4Egl8TQoqvs/HAJ7Q==
X-Received: by 2002:a17:906:cc4a:b0:9a5:852f:10ae with SMTP id
 mm10-20020a170906cc4a00b009a5852f10aemr2068130ejb.60.1695830871071; 
 Wed, 27 Sep 2023 09:07:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170906374800b0099cf840527csm9523564ejc.153.2023.09.27.09.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 09:07:50 -0700 (PDT)
Message-ID: <83c1b1df-7e5e-8b71-358a-9c34969dc695@redhat.com>
Date: Wed, 27 Sep 2023 18:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Arnd Bergmann <arnd@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <me@dakr.org>,
 Ben Skeggs <bskeggs@redhat.com>
References: <20230925155930.677620-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230925155930.677620-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50: hide unused variables
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
Cc: nouveau@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/25/23 17:59, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After a recent change, two variables are only used in an #ifdef:
> 
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1569:13: error: unused variable 'ret' [-Werror=unused-variable]
>   1569 |         int ret;
>        |             ^~~
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1568:28: error: unused variable 'aux' [-Werror=unused-variable]
>   1568 |         struct drm_dp_aux *aux = &nv_connector->aux;
>        |                            ^~~
> 
> Move them into the same conditional block, along with the nv_connector variable
> that becomes unused during that fix.
> 
> Fixes: 757033808c95b ("drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 52f1569ee37c1..a0ac8c258d9ff 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1560,15 +1560,13 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
>   {
>   	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>   	struct nv50_head *head = nv50_head(nv_encoder->crtc);
> -	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
>   #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> +	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
>   	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>   	struct nouveau_backlight *backlight = nv_connector->backlight;
> -#endif
>   	struct drm_dp_aux *aux = &nv_connector->aux;
>   	int ret;
>   
> -#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>   	if (backlight && backlight->uses_dpcd) {
>   		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
>   		if (ret < 0)


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C3D7C754E
	for <lists+nouveau@lfdr.de>; Thu, 12 Oct 2023 19:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D45110E568;
	Thu, 12 Oct 2023 17:58:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE85910E565
 for <nouveau@lists.freedesktop.org>; Thu, 12 Oct 2023 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697133485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVsd25JJrPKVfuhRRuS6kpquTIw0T//+HNpizwkPWZ0=;
 b=LV60t54gnhA/1beN1Vl8qe+aOQuZu07aNUCQJOj4PsF4NGeb6Bvmdp1sUm9bDHpN2DrYqo
 +DlxW+XcFgXqccoGutKmuOpCLuKGo4GkzThSHsrymF9MBdcrwbRtJbAkU7friXoBx4NTCq
 QqANCNs1/OK0zmWvxnl1S6Fynwei2bY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-nJp6kkStPr6PA6HPhhwGGg-1; Thu, 12 Oct 2023 13:58:04 -0400
X-MC-Unique: nJp6kkStPr6PA6HPhhwGGg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9b2e3f315d5so136344066b.1
 for <nouveau@lists.freedesktop.org>; Thu, 12 Oct 2023 10:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697133483; x=1697738283;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FVsd25JJrPKVfuhRRuS6kpquTIw0T//+HNpizwkPWZ0=;
 b=tr49hM4JeqcgTM/s7aStrQb8kOdQJSVtuaCLahcQ8GINId9iAFQYTuPmB2tLa9M9yD
 rMmgopoGAOCeZhNoG4z/d6DyO2niD+39vWB86oDQ+/+oeOhZrhK9cQP+2sDLFRz827gA
 QbrNvDwCKm9kUvRh0wje47IaakaaY2wxTZhZh0cTVRzm1FSjonRUYS43dRSSOigL/nxI
 Asg0xCYZD5VxM0nUkVDBnz1xqv2oTnl85xND4i8/V0M7RC+lz25XOkNwqne0lJFT2GOa
 bCS9D9xf7JIioI/d9gBn2RD38IojtLu6LMb8BUX5BIWOpZIFo0kLgJr5cYtwOQIuu9OU
 nmkg==
X-Gm-Message-State: AOJu0Yx0duP3CXc/lXJBrGGE9lgagb6SRQPlxwv4RWbEn+pInOWlso3u
 eOFocQij84tJdT2BzLSRSiykhGfkNrmiIsysNU3QoFb7Kay15mUv5hn8gd6lB+r8zfazdDscvs7
 8dwmv613BnTwBWeulgKuqaovjWw==
X-Received: by 2002:a17:907:7601:b0:9ba:b5:cba6 with SMTP id
 jx1-20020a170907760100b009ba00b5cba6mr16976170ejc.14.1697133483532; 
 Thu, 12 Oct 2023 10:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Ev4jZ1AjQIWBFFW64KwIs1qrFVUApRQO2mPNRQF9ONEf/GfLbNT6HeVYBtT/urA60vGy7A==
X-Received: by 2002:a17:907:7601:b0:9ba:b5:cba6 with SMTP id
 jx1-20020a170907760100b009ba00b5cba6mr16976161ejc.14.1697133483205; 
 Thu, 12 Oct 2023 10:58:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gz24-20020a170906f2d800b00985ed2f1584sm11393950ejb.187.2023.10.12.10.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 10:58:02 -0700 (PDT)
Message-ID: <78f3a73d-3c2a-4432-8ac5-9e4418f509cb@redhat.com>
Date: Thu, 12 Oct 2023 19:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make_ruc2021@163.com>
References: <20231007032349.3997387-1-make_ruc2021@163.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231007032349.3997387-1-make_ruc2021@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dispnv04: fix a possible null
 pointer dereference
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
Cc: jani.nikula@intel.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/7/23 05:23, Ma Ke wrote:
> In nv17_tv_get_ld_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..4a08e61f3336 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -209,6 +209,8 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
>   		struct drm_display_mode *mode;
>   
>   		mode = drm_mode_duplicate(encoder->dev, tv_mode);
> +		if (!mode)
> +			continue;
>   
>   		mode->clock = tv_norm->tv_enc_mode.vrefresh *
>   			mode->htotal / 1000 *


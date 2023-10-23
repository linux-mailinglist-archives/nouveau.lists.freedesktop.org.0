Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301547D41AB
	for <lists+nouveau@lfdr.de>; Mon, 23 Oct 2023 23:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3010E027;
	Mon, 23 Oct 2023 21:29:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F0510E027
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698096568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcPd91tcHUqGQ8cwQ4BFcEpBug5kyk/HqJ75ngdNbWY=;
 b=NRDI9Es2XQxkXVHmhpw3jQBJvGiIijShSKmLEghkW29BXw91AQq6W14M1qQ4gwvzqN9pCp
 vaSQ0vns6y0FKXoR+0ZPXCiP/IrfY7Gduh+w7NCwcT2ODkk9vJC0VsaQM1Eo0W+z6RitjO
 7aPPkFeXBHQeMtSyGjk8WrFj27EcMuA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-5-vYsqkZPMGCsE9duM4R-A-1; Mon, 23 Oct 2023 17:29:26 -0400
X-MC-Unique: 5-vYsqkZPMGCsE9duM4R-A-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-507a3ae32beso3752927e87.2
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 14:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698096565; x=1698701365;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rcPd91tcHUqGQ8cwQ4BFcEpBug5kyk/HqJ75ngdNbWY=;
 b=hiOI94tb2a02/ZYiZki2QvPSSTJ4ZyqVzprctkFTXOdAy8brYCFcljbHEuE3ZqNJxg
 0N9JLPzkR9/jxfN2F2D4r+k7k+hiVAAcsngpYgtko0RM/+68P5lMUlbQ/mPvFnLg0dsw
 +vFaxBAu0Cvv/b9z0rflpiRqdvJ8S2f86wYKfFvCvl3IDfHrAYZ7xKNiU01Wpc6SzwNN
 1ahaksX8YEoXVmU8Lhfc56z18JCOB5EJLN35z6s1zszm7Dm+bO13sBtmaqCJXsBG4wu+
 QkRzSMt+ikfKz9ktOPtiJLVj5b97upfi0cwCVeebM27EeLp9YjhOtY+mODm7eECXjyN2
 J+Xw==
X-Gm-Message-State: AOJu0YymFTpayGi3hzQv2ukx7SK+up3Vm97YwON+aJVq4GneZAhFVTvh
 H0HqmcgASVcvOKmmG6BL7hJ64Hqf30D/D/W70tw7cpG41NjeUesXHcwI9vznJfDGcJPRpiU3LEf
 uVWqkZLL39JMKmnM0SQxZYIscZw==
X-Received: by 2002:a05:6512:1382:b0:507:a1dd:5a86 with SMTP id
 fc2-20020a056512138200b00507a1dd5a86mr8401830lfb.13.1698096565324; 
 Mon, 23 Oct 2023 14:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnF8cqoxrlrOT9P0v4zs+TvviuGD1NXYsIxxUywKDSj03aKaf/bFvjifDaAO0+t237pvZMQ==
X-Received: by 2002:a05:6512:1382:b0:507:a1dd:5a86 with SMTP id
 fc2-20020a056512138200b00507a1dd5a86mr8401805lfb.13.1698096564991; 
 Mon, 23 Oct 2023 14:29:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 vg18-20020a170907d31200b009adc77fe164sm7193030ejc.66.2023.10.23.14.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 14:29:24 -0700 (PDT)
Message-ID: <6ddcac19-70c1-4f94-ac11-9d864721ff62@redhat.com>
Date: Mon, 23 Oct 2023 23:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make_ruc2021@163.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 noralf@tronnes.org, mripard@kernel.org, jani.nikula@intel.com
References: <20231013011850.103967-1-make_ruc2021@163.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231013011850.103967-1-make_ruc2021@163.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/13/23 03:18, Ma Ke wrote:
> In nv17_tv_get_hd_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate(). The same applies to drm_cvt_mode().
> Add a check to avoid null pointer dereference.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

For this one and the previous patch, please add the corresponding
'Fixes:' [1] and stable [2] tags and split the commits accordingly.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
[2] https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

> ---
>   drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..9c3dc9a5bb46 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -258,6 +258,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
>   		if (modes[i].hdisplay == output_mode->hdisplay &&
>   		    modes[i].vdisplay == output_mode->vdisplay) {
>   			mode = drm_mode_duplicate(encoder->dev, output_mode);
> +			if (!mode)
> +				continue;
>   			mode->type |= DRM_MODE_TYPE_PREFERRED;
>   
>   		} else {
> @@ -265,6 +267,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
>   					    modes[i].vdisplay, 60, false,
>   					    (output_mode->flags &
>   					     DRM_MODE_FLAG_INTERLACE), false);
> +			if (!mode)
> +				continue;
>   		}
>   
>   		/* CVT modes are sometimes unsuitable... */


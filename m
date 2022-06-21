Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F8F553B24
	for <lists+nouveau@lfdr.de>; Tue, 21 Jun 2022 22:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBC81121FD;
	Tue, 21 Jun 2022 20:08:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1321121E9
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jun 2022 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655842108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmXNSrWNq48zXd1EQ3l1n2Chs8rdLQeClhksCt61t+0=;
 b=Y7gg0N+HC3vQLiZHL3JiZzvJng4jzRTuJ9lF4c4tGICG/PQZMpOUn/X4RtdAsa2ZER5HhS
 UbnlDP4Cp5iSpcrR8/4ZqLkRVfCYfhIZpjBOjBbAxfGxV9uP3qvEr9dSvTM+1oMynO2+eJ
 dSHnLbWWTHWmlEFMOQp4SIF8yA6v2W4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-tjOMdHUCNo6ksDUkPcUxPA-1; Tue, 21 Jun 2022 16:08:25 -0400
X-MC-Unique: tjOMdHUCNo6ksDUkPcUxPA-1
Received: by mail-qk1-f197.google.com with SMTP id
 bi36-20020a05620a31a400b006a79f0706e5so17638734qkb.2
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jun 2022 13:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RmXNSrWNq48zXd1EQ3l1n2Chs8rdLQeClhksCt61t+0=;
 b=FQt27cgVusCwfuyk6d8+hHuAKOSmIUpRbQpiyao1rH08vvqpJUcXkuUaL3QbqCKDaX
 CNgRheno2EbvJGhYVcbDWYb14EA1TO4UV/yFoz10fPA9yy2YTk3r/KMZbG0uncSjNh/u
 QCiSM/DegNtgOukrE66h76juRfghXYLV7/00MWbnXdG4V3KuRRYo7fFLIHdkyg6iqUR3
 on+bow0YPxdJInf2J56Ic3p/2bR2RoKnVodihNFsQrPlksOObtvzoAz098J493Gc21F7
 lUPTz26fO25Yn+ky68wzG2Sn5IHLMayW8Enz2v3PwoSr8hHrrXGetIYH17tOb4rKQFRT
 bE/g==
X-Gm-Message-State: AJIora/WjcYHfWNq89nhxXI/CpEvyOJCX5ap15hnZWQpPLQ2NSk2K8Bs
 5Wc89Kb59GjAZHFmJiRYBRJ3B5FoZKBZMw7NfKFGzt9F5rRNFekYGZvBIPpAcdnOM3YSEkAOkrv
 s7PZg0Z8mGGndT3BrR6G5Ak6bqg==
X-Received: by 2002:a0c:fa03:0:b0:470:3e83:4300 with SMTP id
 q3-20020a0cfa03000000b004703e834300mr11742009qvn.55.1655842104524; 
 Tue, 21 Jun 2022 13:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6OBIQbAgLyiI6McC42p6i5g7xpjiCMJyH10ALqOFoCzbeFE2xp865KOfy+OQhYDbb8Qi0Og==
X-Received: by 2002:a0c:fa03:0:b0:470:3e83:4300 with SMTP id
 q3-20020a0cfa03000000b004703e834300mr11741983qvn.55.1655842104191; 
 Tue, 21 Jun 2022 13:08:24 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05620a404e00b006a69d7f390csm16072005qko.103.2022.06.21.13.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:08:23 -0700 (PDT)
Message-ID: <58bc64d81295092de0a9cab9c16dfae5600fc821.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>
Date: Tue, 21 Jun 2022 16:08:22 -0400
In-Reply-To: <20220620094627.9730-1-hdegoede@redhat.com>
References: <20220620094627.9730-1-hdegoede@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/Kconfig: Drop duplicate "select
 ACPI_VIDEO"
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Also, you have my permission to push this to drm-misc-next.

On Mon, 2022-06-20 at 11:46 +0200, Hans de Goede wrote:
> Before this change nouveau's Kconfig section had 2 "select ACPI_VIDEO"
> statements:
> 
> select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> select ACPI_VIDEO if ACPI && X86
> 
> Drop the one with the extra conditions, if the conditions for that
> one are true then the second statement will always select ACPI_VIDEO
> already.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/Kconfig
> b/drivers/gpu/drm/nouveau/Kconfig
> index 34760164c271..03d12caf9e26 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -11,7 +11,6 @@ config DRM_NOUVEAU
>         select DRM_TTM
>         select DRM_TTM_HELPER
>         select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
>         select X86_PLATFORM_DEVICES if ACPI && X86
>         select ACPI_WMI if ACPI && X86
>         select MXM_WMI if ACPI && X86

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


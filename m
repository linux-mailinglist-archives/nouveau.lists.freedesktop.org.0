Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E982969CAA
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D3E10E4FE;
	Tue,  3 Sep 2024 12:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ivxQwaAI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA4F10E515
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wqkxl9KwjevEu+t1uza2Tm1mz4C/9rJUsakscGOOK3I=;
 b=ivxQwaAIEPL9uLoxxL+sNKQ3MiEDiM4d9D6q0L3XSXmmRKCiQvG2mHZKuLS6cKZt472pBM
 Wq+yvY+FoBM4rAA5wrZAkqdnjDhxojP2drEtzrgipMclRG+npiSBXho5oziPfO8uEIiIpR
 RH+ECSrqdkuFl46g3Jx4gjzzl5UohJI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-k7KrTux9OKehNXkZ_8wFLA-1; Tue, 03 Sep 2024 08:00:28 -0400
X-MC-Unique: k7KrTux9OKehNXkZ_8wFLA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374cd315c68so1184478f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364827; x=1725969627;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wqkxl9KwjevEu+t1uza2Tm1mz4C/9rJUsakscGOOK3I=;
 b=FuoGe+b/XbqmMW/5utxeDHPikjjdlZzWzfsoGCMMzqrBwcJZ00kmJ0gTwUtoO+8Oww
 mM0o5Ubs8k12/gL393P1Jno2eylB3fp+/exG7inl6//D4iPz4+euI3LibU+X6d5rrgmu
 yrFa59qMpr9nLVkBshrQlpUyh7vQvG4O3jH7Tvubtz2/Mq2MWQZ5YY/Dd8CeamSObys2
 ighf6Gpd7cCIvnUY+xhZb1F1IzRDdVJa55QqATV9Cdd+UlC8uNrTs56I3TN91zpeUJwf
 PKcV7nqSLt2yR8A22GdXKB/jVAMGIlmDr+VPPxfgYJNVA2ZU1yE02+HkXdQh5ouDVM9O
 3f0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9cJfv1e0NVG8FPbSouhUuLTjRolIfMIY8+9j1CrYK3bG+kILbYRuWoR921O4+GCPucECL7IkY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycwt6W1sdO5U1tAuu2DRBVJ+NwLgO+2AnWur4vr109og1b/kIC
 JNxL5h95rZKpr/BZ1qqSfyuT07Yrwn8G7JjsBPj4iS9W90Ui74+18IeSvWzELroiZFDWn83P72s
 paoqxQfN2ZknrEG2fik1obKrzhFoQ4nY27xKCfqFntdap+7P+sGj2V6MeRw10skY=
X-Received: by 2002:adf:e005:0:b0:367:9088:fecd with SMTP id
 ffacd0b85a97d-3749b52e4b2mr11567927f8f.7.1725364827054; 
 Tue, 03 Sep 2024 05:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKbVj02CwoguAfZhg3DQHVPX/ENKLjb8+BLnTX8X8+/N0+IHzNka7Y5ll+wgLPRMt/UdLgcA==
X-Received: by 2002:adf:e005:0:b0:367:9088:fecd with SMTP id
 ffacd0b85a97d-3749b52e4b2mr11567893f8f.7.1725364826511; 
 Tue, 03 Sep 2024 05:00:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba639643esm208275255e9.1.2024.09.03.05.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:00:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 52/81] drm/cirrus: Run DRM default client setup
In-Reply-To: <20240830084456.77630-53-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-53-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:00:25 +0200
Message-ID: <87ikvddk12.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The cirrus driver requests the same client pixel format as the value
> stored in struct drm_mode_config.preferred_depth. The fbdev client
> also looks at this value for the default pixel format. Thus remove
> the format selection from cirrus.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/tiny/cirrus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

